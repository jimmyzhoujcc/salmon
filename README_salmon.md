# salmon安装和执行手册

## 环境介绍
- 192.168.110.208 主服务器  (角色ansible2.3.0.0,redis,mongod)
- 192.168.110.207 （角色客户机）
- 192.168.110.211 （角色客户机）
- 192.168.111.98/localhost （角色salmon，mysql）

## salmon安装部分

### 192.168.111.98／localhost
#### 数据库（mysql）
- 创建数据库，数据库名salmon，字符utf8
- 导入数据库salmon.sql
- 配置文件更改路径 salmon/salmon/settings.py,更改如下内容
- 
```
# Database # https://docs.djangoproject.com/en/1.11/ref/settings/#databases  DATABASES = {     'default': {         'ENGINE': 'django.db.backends.mysql',         'NAME': 'salmon', 	    	'USER': 'root',	# 数据用户         'PASSWORD': '',	# 数据库密码         'HOST': '',   	# 数据库ip         'PORT': '',			# 数据库端口，默认端口可以不填     } }
```

#### 安装python2.7，和pip9
- pip install -r requirements.txt

#### 其他需要更改的配置
- salmon/curl.py 用于调用部署的ansible-api，更改的内容如下

```
def post_json(data):     stime = time.time()     # url = 'http://启动ansible-api的服务器ip:8765/command'     url = 'http://192.168.110.208:8765/command'
...

def post_playbook(json_data):     stime = time.time()     url = 'http://启动ansible-api的服务器:8765/playbook'     # url = 'http://192.168.51.167:8765/playbook'
...
```

- salmon/accounts/view.py,更改临时上传的服务器ip

```
# 查找关键字 server = '192.168.110.208'
# 把所有server = ‘x.x.x.x’的服务器ip在底部定义，或者在settings中定义，统一定义是最好的，或者全部替换为临时上传的服务器ip
```

### 192.168.110.208
#### 基础环境安装
- pip install ansible==2.3.0.0
- 安装redis
- redis配置文件更改路径 salmon/celery_tasks/celeryconfig.py,更改如下内容

```
# 更改为redis服务器的ip
BROKER_URL = 'redis://192.168.110.208:6379/0' CELERY_RESULT_BACKEND = 'redis://192.168.110.208:6379/0' CELERY_TIMEZONE='Asia/Shanghai' CELERY_IMPORTS = (     'celery_tasks.task',     'celery_tasks.task2', )
```

- redis配置文件更改路径 salmon/salmon/settings.py,更改如下内容
	
```
#celery setting import djcelery djcelery.setup_loader() BROKER_URL = 'redis://192.168.110.30:6379/0' BROKER_POOL_LIMIT = 0
```
- 安装mongod（建立数据库ansible，后续程序会自动插入表adhoc和playbook的数据）
- mongo写入的配置文件更改路径 salmon/ansible-api/ansible_api/callback.py,更改如下内容

```
def InsertDB(values):     uri = 'mongodb://localhost' # mongo服务的ip     client = MongoClient(uri)     db = client.ansible     # print ('values',values)     # Insert adhoc | playbook into mongodb     if values['task_name'] == 'task':         print ('task_name=task,wsmsg--->',values)         db.adhoc.insert(values)     else:         db.playbook.insert(values)

```

#### ansible-api的部署
- 用于json方式调用ansible执行adhoc命令或是playbook剧本，返回的结果同样是json回给django后台
- 跟随ansbile部署即可，也可以分开部署
- cp -r salmon/ansible-api ./
- 执行python ansible-api -c ansible.cfg &

#### jcc_ansible2.3的部署
- 用于根据host ip收集host的硬件信息,此部分还未完成入库到mysql库内的server表
- cp -r salmon/jcc_ansible2.3 ./
- 收集命令

```

python adhoc.py '{"hosts": [{"hostname": "192.168.51.178", "port": "22", "username": "root","password": "1234.com"},{"hostname": "192.168.51.167", "port": "22", "username": "root","password": "123.com"},{"hostname": "192.168.51.183", "port": "22", "username": "root","password": "123.com"}],"module_name":"setup","module_args":""}'
   [root@localhost jcc_ansible2.3]# python adhoc.py '{"hosts": [{"hostname": "192.168.51.183", "port": "22", "username": "root","password": "1234.com"},{"hostname": "192.168.51.167", "port": "22", "username": "root","password": "123.com"}],"module_name":"setup","module_args":""}' "result_json_data": [{'cpu_number': 1, 'model': u'VirtualBox', 'kernel': '3.10.0-327.el7.x86_64', 'ip': u'192.168.51.167', 'hostname': u'localhost', 'system': u'CentOS 7.2.1511 64', 'vcpu_number': 1, 'status': 0, 'disk_total': 40960, 'nks': [], 'cpu_core': 1, 'swap': 2047, 'ram_total': 993, 'selinux': u'enabled', 'serial': u'0', 'cpu': u'Intel(R) Core(TM) i7-4770HQ CPU  2.20GHz', 'manufacturer': u'innotek GmbH'}, {'cpu_number': 1, 'model': u'VirtualBox', 'kernel': '2.6.32-431.el6.x86_64', 'ip': u'192.168.51.183', 'hostname': u'node2', 'system': u'CentOS 6.5 64', 'vcpu_number': 1, 'status': 0, 'disk_total': 40960, 'nks': [{'macaddress': u'08:00:27:b6:44:3a', 'module': u'e1000', 'mtu': 1500, 'active': 1, 'address': u'192.168.51.183', 'device': u'eth0'}], 'cpu_core': 1, 'swap': 2015, 'ram_total': 996, 'selinux': u'enabled', 'serial': u'0', 'cpu': u'Intel(R) Core(TM) i7-4770HQ CPU  2.20GHz', 'manufacturer': u'innotek GmbH'}]
```


## salmon执行部分

### 运行主程序
- 执行python manage.py runserver 0.0.0.0:8000
http://127.0.0.1:8000/admin
超级管理员jcc 密码1234.com

- 也可自建立超级管理员
python manage.py createsuperuser
用户名
邮件地址
密码

### 如果需要用到schedule tasks的时候需运行celery
- sh run_celery_tasks.sh

### 导入资产
- 资产模版：salmon/设备资产批量导入模板文件.xls
- 导入资产主要是为了导入ip，用户名，密码
- 主机的其他信息是通过ansible去收集，无须填写

### 执行adhoc或playbook
- command：adhoc（此过程时间很短）
- scripts：adhoc中的scripts模块（上传bash至远程每台主机，执行scripts，删除临时scripts，返回至前台页面，大致过程在2分钟左右返回结果）
- playbook：单一playbook执行（上传playbook至远程附服务器，执行playbook，返回至前台页面，此过程时间很短）

### 执行schedule_tasks
- 就是crontab的功能，其他功能和scripts、playbook一致
- 返回的task id
- 执行结果在schedule_details内，可以根据得到task id取查找是否执行

### 日志查询
- ansible的执行日志都写入mongodb中ansible数据库中的adhoc表和playbook表
- adhoc表包含了command和scripts执行的日志
- playbook表包含了playbook的执行日志


