# salmon安装和执行手册
- Author：Six Fans
- Date：2018-03-22
- Version：1.0

## 文档目录
```
[root@node217 salmon]# tree ./
./
├── README.md
├── salmon.sql
├── salmon_v1.0.tar
├── server.xls
└── test_scripts
    ├── echo.yml
    └── t.sh
```

## 功能简介
- 用户CRUD
- 用户、用户组、主机组权限管理
- CMDB录入
- 根据CMDB信息自动收集信息（自动收集脚本已建立，还未入库和渲染至前台webui）
- ansible脚本执行（遇见$要注意反义）
- ansible剧本执行
- 定时任务执行，查询任务结果
- django restful api接口
- ansible2.x api接口改造（adhoc和playbook两种）
- 自动安装vm（Todo：结合ansible-api和vmware推出的官方pyvmomi可实现vm自动安装）
- 监控（Todo: 结合zabbix-api可实现对报警的收敛、绘图、自动添加监控项等功能）

## 环境介绍
- 10.6.97.217 ansible服务器、redis队列服务器、log日志服务器  (角色ansible2.3.0.0,redis,mongod)
- 10.6.97.216 应用服务器、数据库服务器						（角色salmon，mysql5.6）

## salmon安装部分

### 10.6.97.216
#### 安装数据库（mysql5.6）

```
├── mysql-5.6.35-linux-glibc2.5-x86_64.tar.gz
├── MySQL-client-5.6.35-1.el6.x86_64.rpm
├── MySQL-devel-5.6.35-1.el6.x86_64.rpm
├── MySQL-server-5.6.35-1.el6.x86_64.rpm
├── MySQL-shared-5.6.35-1.el6.x86_64.rpm
├── MySQL-shared-compat-5.6.35-1.el6.x86_64.rpm
└── numactl-2.0.9-2.el6.x86_64.rpm

tar zxvf packages/mysql_5.6.35.tar;
cd mysql_5.6.35/;rpm -ivh *.rpm
```

- 创建数据库salmon
```
	create database salmon default character set utf8；
```
- 导入数据库

```
	mysql -uroot salmon < salmon.sql
```
- mysql配置路径salmon/salmon/settings.py,更改如下内容：

```
	# Database
	DATABASES = {
	    'default': {
	        'ENGINE': 'django.db.backends.mysql',
	        'NAME': 'salmon',
	        'USER': 'root',
	        'PASSWORD': '',
	        'HOST': '',
	        'PORT': '',
	    }
	}
```

#### 安装Python-2.7.11(略)和pip9（略）
- pip2.7 install -r requirements.txt
- 重点关注MySQL-python的安装成功与否，如果安装成功可以用如下方法验证

```
	[root@node216 salmon]# /usr/local/bin/python2.7
	Python 2.7.11 (default, Mar 16 2018, 14:57:02) 
	[GCC 4.4.7 20120313 (Red Hat 4.4.7-3)] on linux2
	Type "help", "copyright", "credits" or "license" for more information.
	>>> import MySQLdb 	# 不报错代表成功，此时django可以操作mysql5.6了
```
- salmon/salmon/settings.py,更改Celery和Backend的服务器ip，由于ansible、ansible-api、redis、mongodb都安装在10.6.97.217上，所以这里是统一的

```
# Celery setting
import djcelery
djcelery.setup_loader()
BROKER_URL = 'redis://10.6.97.217:6379/0'
BROKER_URL = CELERY_RESULT_BACKEND = 'redis://10.6.97.217:6379/0'
BROKER_POOL_LIMIT = 0
CELERY_TIMEZONE='Asia/Shanghai'

# Backend setting
server='10.6.97.217'
```

### 10.6.97.217
#### 基础环境安装
- pip install ansible==2.3.0.0
- 安装和启动redis
```
	wget http://10.5.32.41/redis-2.8.17.tar.gz
 	tar zxvf redis-2.8.17.tar.gz
	cd redis-2.8.17
	make
	make install
	cp redis.config /etc/redis.conf
	sed -i 's/daemonize no/daemonize yes/g/' /etc/redis.conf
	/usr/local/bin/redis-server /etc/redis.conf
```	
	
- 安装mongod（建立数据库ansible，后续程序会自动插入表adhoc和playbook的数据）
```
	wget http://10.5.32.41/mongodb-linux-x86_64-3.0.12.tgz
	tar zxvf mongodb-linux-x86_64-2.4.5.tgz 
	mv mongodb-linux-x86_64-3.0.12/bin/* /usr/bin/
```

- 如果是all in one安装可忽略此步骤，但如果mongodb独立安装，需更改mongo写入的配置文件更改路径 salmon/ansible-api/ansible_api/callback.py,更改如下内容

```
def InsertDB(values):
    # Define mongodb ip
    uri = 'mongodb://localhost'
    client = MongoClient(uri)
    db = client.ansible
    # Insert adhoc | playbook into mongodb
    if values['task_name'] == 'task':
        print ('task_name=task,wsmsg--->',values)
        db.adhoc.insert(values)
    else:
        db.playbook.insert(values)
```

#### ansible-api的部署
- 用于json方式调用ansible执行adhoc命令或是playbook剧本，返回的结果同样是json回给django后台
- 跟随ansbile部署即可，也可以分开部署

```
cp -r salmon/ansible-api ./
sh run_ansible_api.sh
```

#### jcc_ansible2.3的部署
- 用于根据host ip收集host的硬件信息,此部分还未完成入库到mysql库内的server表
- 
```
cp -r salmon/jcc_ansible2.3 ./
# 收集命令示例脚本collect_host_info.sh

[root@node217 jcc_ansible2.3]# sh collect_host_info.sh 
"result_json_data": [
	{'cpu_number': 2, 
		'model': u'VMware Virtual Platform',
 		'kernel': '2.6.32-358.14.1.el6.x86_64', 
 		'ip': u'10.6.97.217', 
 		'hostname': u'node217', 		'system': u'CentOS 6.4 64', 
 		'vcpu_number': 4, 
 		'status': 0, 
 		'disk_total': 67584, 
 		'nks': [
 			{'macaddress': u'00:50:56:81:3f:89', 
 			'module': u'e1000', 
 			'mtu': 1500, 
 			'active': 1, 
 			'address': u'10.6.97.217',
 			 'device': u'eth0'}], 
 		'cpu_core': 2, 
 		'swap': 4031, 
 		'ram_total': 7872, 
 		'selinux': 'disabled', 
 		'serial': u'VMware-42', 
 		'cpu': u'Intel(R) Xeon(R) CPU E5-2420 0  1.90GHz', 		'manufacturer': u'VMware, Inc.'},
 {'cpu_number': 2, 'model': u'VMware Virtual Platform', 'kernel': '2.6.32-358.14.1.el6.x86_64', 'ip': u'10.6.97.216', 'hostname': u'node216', 'system': u'CentOS 6.4 64', 'vcpu_number': 4, 'status': 0, 'disk_total': 67584, 'nks': [{'macaddress': u'00:50:56:81:0d:d1', 'module': u'e1000', 'mtu': 1500, 'active': 1, 'address': u'10.6.97.216', 'device': u'eth0'}], 'cpu_core': 2, 'swap': 4031, 'ram_total': 7872, 'selinux': 'disabled', 'serial': u'VMware-42', 'cpu': u'Intel(R) Xeon(R) CPU E5-2420 0  1.90GHz', 'manufacturer': u'VMware, Inc.'}, 
 {'cpu_number': 2, 'model': u'VMware Virtual Platform', 'kernel': '2.6.32-358.14.1.el6.x86_64', 'ip': u'10.6.97.218', 'hostname': u'node218', 'system': u'CentOS 6.4 64', 'vcpu_number': 4, 'status': 0, 'disk_total': 67584, 'nks': [{'macaddress': u'00:50:56:81:10:11', 'module': u'e1000', 'mtu': 1500, 'active': 1, 'address': u'10.6.97.218', 'device': u'eth0'}], 'cpu_core': 2, 'swap': 4031, 'ram_total': 7872, 'selinux': 'disabled', 'serial': u'VMware-42', 'cpu': u'Intel(R) Xeon(R) CPU E5-2420 0  1.90GHz', 'manufacturer': u'VMware, Inc.'}
 ]
```


## salmon执行部分

### 运行主程序
- 执行django
```
nohup python manage.py runserver 0.0.0.0:8000 &
# http://127.0.0.1:8000/admin
# 超级管理员jcc 密码1234.com
```

- 也可自建立超级管理员
```
python manage.py createsuperuser
用户名
邮件地址
密码
```

### 如果需要用到schedule  tasks需运行celery
```
sh run_celery_tasks.sh
```
### 导入资产
- 资产模版：salmon/server.xls
- 导入资产主要是为了导入ip，用户名，密码
- 主机的其他信息是通过ansible去收集，无须填写

### 执行adhoc或playbook
- command：adhoc（此过程时间很短）
- scripts：adhoc中的scripts模块（上传bash至远程每台主机，执行scripts，删除临时scripts，返回至前台页面）
- playbook：单一playbook执行（上传playbook至远程附服务器，执行playbook，返回至前台页面，此过程时间很短）

### 执行schedule_tasks
- 就是crontab的功能，其他功能和scripts、playbook一致
- 返回的task id
- 执行结果在schedule_details内，可以根据得到task id取查找是否执行

### 日志查询
- ansible的执行日志都写入mongodb中ansible数据库中的adhoc表和playbook表
- adhoc表包含了command和scripts执行的日志
- playbook表包含了playbook的执行日志

### Api一览
- django restful api
```
{
    "users": "http://127.0.0.1:8000/api/users/",
    "groups": "http://127.0.0.1:8000/api/groups/",
    "hosts": "http://127.0.0.1:8000/api/hosts/",
    "hostgroups": "http://127.0.0.1:8000/api/hostgroups/",
    "hostusers": "http://127.0.0.1:8000/api/hostusers/",
    "assets": "http://127.0.0.1:8000/api/assets/",
    "servers": "http://127.0.0.1:8000/api/servers/"
}
```

- ansible restful api

```
{
	"command": "http://10.6.97.217:8765/command",
	"playbook":"http://10.6.97.217:8765/playbook"
}
```

