# -*- coding: utf-8 -*-
# __author__ = 'ymzhou'

#from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User,Group

class HostUser(models.Model):
    user = models.ForeignKey(User)
    group = models.ForeignKey('HostGroup')

    def __unicode__(self):
        return self.user.username

class Asset(models.Model):
    assets_type_choices = (
                          ('server',u'服务器'),
                          ('vmser',u'虚拟机'),
                          )
    assets_type = models.CharField(choices=assets_type_choices,max_length=100,default='server',verbose_name='资产类型')
    sn =  models.CharField(max_length=100,verbose_name='设备序列号',blank=True,null=True)
    buy_time = models.DateField(blank=True,null=True,verbose_name='购买时间')
    expire_date = models.DateField(u'过保修期',null=True, blank=True)
    management_ip = models.GenericIPAddressField(u'管理IP',blank=True,null=True)
    manufacturer = models.CharField(max_length=100,blank=True,null=True,verbose_name='制造商')
    provider = models.CharField(max_length=100,blank=True,null=True,verbose_name='供货商')
    model = models.CharField(max_length=100,blank=True,null=True,verbose_name='资产型号')
    status = models.SmallIntegerField(blank=True,null=True,verbose_name='状态')
    put_zone = models.SmallIntegerField(blank=True,null=True,verbose_name='放置区域')
    group = models.SmallIntegerField(blank=True,null=True,verbose_name='使用组')
    business = models.SmallIntegerField(blank=True,null=True,verbose_name='业务类型')
    project = models.SmallIntegerField(blank=True,null=True,verbose_name='项目类型')

    class Meta:
        db_table = 'salmon_asset'
        permissions = (
            ("can_read_assets", "读取资产权限"),
            ("can_change_assets", "更改资产权限"),
            ("can_add_assets", "添加资产权限"),
            ("can_delete_assets", "删除资产权限"),
        )
        # verbose_name = 'Asset'
        # verbose_name_plural = 'Asset'


class Server(models.Model):
    assets = models.OneToOneField('Asset')
    ip = models.CharField(max_length=100,unique=True,blank=True,null=True)
    hostname = models.CharField(max_length=100,blank=True,null=True)
    username = models.CharField(max_length=100,blank=True,null=True)
    passwd = models.CharField(max_length=100,blank=True,null=True)
    keyfile =  models.SmallIntegerField(blank=True,null=True)#FileField(upload_to = './upload/key/',blank=True,null=True,verbose_name='密钥文件')
    port = models.DecimalField(max_digits=6,decimal_places=0,blank=True,null=True)
    line = models.SmallIntegerField(blank=True,null=True)
    cpu = models.CharField(max_length=100,blank=True,null=True)
    cpu_number = models.SmallIntegerField(blank=True,null=True)
    vcpu_number = models.SmallIntegerField(blank=True,null=True)
    cpu_core = models.SmallIntegerField(blank=True,null=True)
    disk_total = models.CharField(max_length=100,blank=True,null=True)
    ram_total= models.IntegerField(blank=True,null=True)
    kernel = models.CharField(max_length=100,blank=True,null=True)
    selinux = models.CharField(max_length=100,blank=True,null=True)
    swap = models.CharField(max_length=100,blank=True,null=True)
    raid = models.SmallIntegerField(blank=True,null=True)
    system = models.CharField(max_length=100,blank=True,null=True)
    create_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'salmon_server'
        permissions = (
            ("can_read_server_assets", "读取服务器资产权限"),
            ("can_change_server_assets", "更改服务器资产权限"),
            ("can_add_server_assets", "添加服务器资产权限"),
            ("can_delete_server_assets", "删除服务器资产权限"),
        )
        # verbose_name = 'Server'
        # verbose_name_plural = 'Server'

class Host(models.Model):
    ip = models.CharField(max_length=15,unique=True)
    name = models.CharField(max_length=15)
    location = models.CharField(max_length=15,blank=True,null=True)
    version = models.CharField(max_length=10,blank=True,null=True)
    comment = models.CharField(max_length=50,blank=True,null=True)
    path = models.CharField(max_length=100,blank=True,null=True)
    visible = models.BooleanField(default='True',blank=True)
    create_at = models.DateTimeField(blank=True,null=True)
    update_at = models.DateTimeField(blank=True,null=True)

    def __unicode__(self):
        return self.ip

class NewHost(models.Model):
    ip = models.CharField(max_length=15,unique=True)
    name = models.CharField(max_length=15)
    location = models.CharField(max_length=15,blank=True,null=True)

    def __unicode__(self):
        return self.ip

class HostGroup(models.Model):
    name = models.CharField(max_length=64, unique=True)
    memo = models.CharField(max_length=128, blank=True, null=True)
    bind_hosts = models.ManyToManyField('Host',blank=True)
    # bind_users = models.ManyToManyField('HostUser',blank=True)
    def __unicode__(self):
        return self.name

    # def __str__(self):
    #     return self.name
    #
    # class Meta:
    #     verbose_name = 'HostGroup'
    #     verbose_name_plural = 'HostGroup'

class ScheduleDetails(models.Model):

    eta = models.DateTimeField(blank=True,null=True)
    args = models.CharField(max_length=200,blank=True,null=True)
    sid = models.CharField(max_length=70,blank=True,null=True)
    state= models.CharField(max_length=20,blank=True,null=True)
    result = models.CharField(max_length=1000,blank=True,null=True)
    def __unicode__(self):
        return self.sid

# < -- droppable upload file by AJAX api start-->
class ProfileImage(models.Model):
    image = models.FileField(upload_to='profile/%Y/%m/%d')
# < -- droppable upload file by AJAX api end-->