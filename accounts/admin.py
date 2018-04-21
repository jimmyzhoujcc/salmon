# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib import admin
from accounts.models import *
from .models import User

# Register your models here.

#admin.site.register(User)

# Define Admin panel here.

class HostUser_Admin(admin.ModelAdmin):
    list_display = ('id','user','group')

class Host_Admin(admin.ModelAdmin):
    list_display = ('id','ip','name','location','version','comment','version','path','visible','update_at')

class HostGroup_Admin(admin.ModelAdmin):
    list_display = ('id','name')
    filter_horizontal = ('bind_hosts',)

class Asset_Admin(admin.ModelAdmin):
    list_display = ('id','assets_type','sn','buy_time','expire_date',
                    'management_ip','manufacturer','provider','model','status',
                    'put_zone','group','project')

class Server_Admin(admin.ModelAdmin):
    list_display = ('id','ip','hostname','username','passwd','keyfile','port',
                    'cpu','cpu_number','vcpu_number', 'cpu_core','disk_total',
                    'ram_total','kernel','selinux','swap','raid','system')


# Register your models here.
admin.site.register(Host,Host_Admin)
admin.site.register(HostGroup,HostGroup_Admin)
admin.site.register(HostUser,HostUser_Admin)
admin.site.register(Asset,Asset_Admin)
admin.site.register(Server,Server_Admin)