# -*- coding: utf-8 -*-
from django.shortcuts import render,render_to_response,redirect
from django.http import HttpResponseRedirect, HttpResponse

from django.contrib import auth
from accounts.models import *
from django.core import serializers
import models
import subprocess,os,xlrd
import paramiko
import json
import sys
import urllib
import urllib2
import json,simplejson
from curl import post_json,post_playbook
from pymongo import MongoClient
from schedule_curl import run_task2
from multiprocessing import Process
from salmon.settings import server

# Create your views here.
def pie(request):
	return render_to_response('pie.html',{'login_user': request.user})

def profile(request):
	return render_to_response('other-user-profile.html',{'login_user': request.user})

def table(request):
    hosts = models.Host.objects.all()
    usergroup = models.HostUser.objects.all()
    hostgroup = models.HostGroup.objects.all()
    hgroups = models.HostGroup.objects.get(name='java1')
    ips = hgroups.bind_hosts.all()
    return render_to_response('host_summary.html',
                          {'login_user': request.user,
                           'hostgroup': hostgroup,
                           'usergroup':usergroup,
                           'hosts': hosts,
                           'hgroups':hgroups,
                           'ips':ips
                           })

def host_list(request):
    assets = models.Asset.objects.all()
    servers = models.Server.objects.all()
    return render_to_response('host_list.html',
                          {'login_user': request.user,
                           'assets': assets,
                           'servers':servers,
                           })

def charts(request):
	return render_to_response('charts.html',{'login_user': request.user})

def login(request):
	return render_to_response('other-login.html')

def documents(request):
	return render_to_response('documents.html',{'login_user': request.user})

def command(request):
	return render_to_response('command.html')

def logout(request):
	auth.logout(request)
	return HttpResponse("<h4>You've just logged out! <a href='/login/'>click here</a> to go back to main page</h4>")


def account_login(request):
    username = request.POST['user']
    password = request.POST.get('password', '')
    user = auth.authenticate(username=username, password=password)
    print user, '====='
    if user is not None:  # and user.is_active:
        # correct password and user is marked "active"
        auth.login(request, user)
        return HttpResponseRedirect("/")
    else:
        return render_to_response('other-login.html', {'err': 'Wrong username or password!'})

# csrf
from django.template.context_processors import csrf


def host_manager(request):
    usergroup = models.HostUser.objects.all()
    g_list = models.HostUser.objects.filter(user=request.user)
    group_list =[]
    for g in g_list:
        print 'group=====>',g.group
        group_list.append(g.group)
    hosts = models.Host.objects.all()
    hostgroup = models.HostGroup.objects.all()
    print type(hostgroup)
    #host_id = models.HostGroup.objects.filter(bind_hosts__id=1)
    #models.HostGroup.objects.filter(bind_hosts='')
    if request.method == "POST":
        # var data = $.parseJSON({ "n":"task#100000@project","m": fun, "a": arg, "t": tgt})
        group = request.POST.get('grp')
        print 'group====>',group
    a_value = ''
    for hg in hostgroup:
        hg_id = str(hg.id)
        if 'hg.id' in request.POST:
            # bind_hosts_id = models.HostGroup.objects.filter(bind_hosts__id=hg.id)
            a_value = models.Host.objects.filter(hostgroup=hg.id)
    args={'login_user': request.user,'hostgroup': hostgroup, 'a': a_value, 'hosts': hosts}
    return render_to_response('host_manager.html',{'login_user': request.user,'hostgroup': hostgroup, 'group_list':group_list,'a': a_value, 'hosts': hosts})
    # return render('host_manager.html',args)
    # return render('host_manager.html',{'login_user': request.user,'hostgroup': hostgroup, 'a': a_value, 'hosts': hosts})

# def host_manager(request):
#     hosts = models.Host.objects.all()
#     hostgroup = models.HostGroup.objects.all()
#     # host_id = models.HostGroup.objects.filter(bind_hosts__id=1)
#     hid = ''
#     a_value = ''
#     # return render_to_response('index.html',{'login_user': request.user})
#     for h in hosts:
#         host_id = str(h.id)
#         if 'h.id' in request.POST:
#             # host_id = models.HostGroup.objects.filter(bind_hosts__id=h.id)
#             # if 'id' + host_id in request.GET:
#             # print '-->'+host_id
#             # if 'id' in request.GET:
#             child = subprocess.Popen(
#                 ['/bin/bash', '-c', '/Users/jimmy/PycharmProjects/test_shell/web/hello.sh'],
#                 stdout=subprocess.PIPE, stderr=subprocess.PIPE)
#             out = child.stdout.readlines()
#             hid = h.id
#             for line in out:
#                 print line.strip()
#                 a = line.strip()
#                 a_value = locals()


    # return render_to_response('host_manager.htm', {
    #     'hosts': hosts, 'login_user': request.user, 'users': users, 'a': a_value, 'hid': hid
    # })
    # return render_to_response('host_manager.html', {'hostgroupname': hostgroup,'host_id': host_id,'a': a_value, 'hid': hid,'hosts': hosts})

def index(request):

    hosts = models.Host.objects.all()
    # users = models.Host_User.objects.all()
    auth_users = models.User.objects.all()

    hid = ''
    a_value = ''
    # return render_to_response('index.html',{'login_user': request.user})
    for h in hosts:
        host_id = str(h.id)
        if 'id' + host_id in request.GET:
        #if 'id' in request.GET:
            child = subprocess.Popen(['/bin/bash', '-c', '/Users/jcc/PycharmProjects/test_shell/web/hostname.sh'],
                                     stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            out = child.stdout.readlines()
            hid = h.id
            for line in out:
                print line.strip()
                a = line.strip()
                a_value = locals()

    return render_to_response('index.html', {
        'hosts': hosts, 'login_user': request.user, 'auth_users': auth_users, 'a': a_value, 'hid': hid
    #return render_to_response('index.html', {
    #    'hosts': hosts, 'login_user': request.user, 'users': users, 'auth_users': auth_users, 'a': a_value, 'hid': hid
    #return render_to_response('index.html',{
    #    'hosts': hosts,'login_user': request.user,'users':users,'auth_users':auth_users,
    })



def checkurl(request,id):
    hosts = models.Host.objects.all()
    a = ''
    users = models.Host_User.objects.all()
    auth_users = models.User.objects.all()
    hid = ''
    a_value = ''
    # return render_to_response('index.html',{'login_user': request.user})
    for h in hosts:
        host_id = str(h.id)
        if 'id' in request.GET:
            child = subprocess.Popen(['/bin/bash', '-c', '/Users/jcc/PycharmProjects/test_shell/web/hostname.sh'],
                             stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            out = child.stdout.readlines()
            hid = h.id
            for line in out:
                print line.strip()
                a = line.strip()
                a_value = locals()
    rlist = [['Jack', 'Chinese', a_value], ['Mike', 'English', '35'], ['Bob', 'Math', '50'], ['Frank', 'Art', '27'],
             ['Lucy', 'Music', '26']]
    rlist2 = []
    rlist2.append({"name": rlist[int(id)][0], "subject": rlist[int(id)][1], "age": rlist[int(id)][2]})
    rjson = json.dumps(rlist2)
    response = HttpResponse()
    response['Content-Type'] = "text/javascript"
    response.write(rjson)
    return response
    #return render_to_response(request,'index.html',locals())





def update(request):
    return render_to_response('host_playbook.html')

def update_host_scripts(request):
    return render_to_response('host_scripts.html')

'''
def index(request):

    hosts = models.Host.objects.all()
    users = models.Host_User.objects.all()
    auth_users = models.User.objects.all()
    hid=''
    a_value=''
	#return render_to_response('index.html',{'login_user': request.user})
    for h in hosts:
        host_id=str(h.id)
        if 'id'+host_id in request.GET:
            child = subprocess.Popen(['/bin/bash', '-c', '/Users/jcc/PycharmProjects/test_shell/web/hostname.sh'],
                                 stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            out = child.stdout.readlines()
            hid=h.id
            for line in out:
                print line.strip()
                a = line.strip()
                a_value = locals()
    return render_to_response('index.html', {
        'hosts': hosts, 'login_user': request.user, 'users': users, 'auth_users': auth_users, 'a': a_value, 'hid': hid
    #return render_to_response('index.html',{
    #    'hosts': hosts,'login_user': request.user,'users':users,'auth_users':auth_users,
    })

def data(request, id):
    hosts = models.Host.objects.all()
    a=''
    #if "id" in request.GET:
    child = subprocess.Popen(['/bin/bash', '-c', '/Users/jcc/PycharmProjects/test_shell/web/hostname.sh'],
                                 stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out = child.stdout.readlines()
    for line in out:
        print line.strip()
        a1 = line.strip()
        a = a1
    rlist = [['Jack', 'Chinese',a], ['Mike', 'English','35'], ['Bob', 'Math','50'], ['Frank', 'Art','27'], ['Lucy', 'Music','26']]
    rlist2 = []
    rlist2.append({"name" : rlist[int(id)][0], "subject" : rlist[int(id)][1], "age" : rlist[int(id)][2]})
    rjson = json.dumps(rlist2)
    response = HttpResponse()
    response['Content-Type'] = "text/javascript"
    response.write(rjson)
    return response

def data(request, id):
    #rlist = [['Jack', 'Chinese'], ['Mike', 'English'], ['Bob', 'Math'], ['Frank', 'Art'], ['Lucy', 'Music']]
    rlist = [['Jack', 'Chinese','30'], ['Mike', 'English','35'], ['Bob', 'Math','50'], ['Frank', 'Art','27'], ['Lucy', 'Music','26']]
    rlist2 = []
    rlist2.append({"name" : rlist[int(id)][0], "subject" : rlist[int(id)][1], "age" : rlist[int(id)][2]})
    rjson = json.dumps(rlist2)
    response = HttpResponse()
    response['Content-Type'] = "text/javascript"
    response.write(rjson)
    return response
'''

def ajax_list(request):
    a = range(100)
    return HttpResponse(json.dumps(a), content_type='application/json')

# def ajax_dict(request):
#     name_dict = {'twz': 'Love python and Django', 'zqxt': 'I am teaching Django'}
#     return HttpResponse(json.dumps(name_dict), content_type='application/json')


# from .forms import AddForm
def ajax_dict(request):
    # if request.method == 'POST':  # 当提交表单时
    #
    #     form = AddForm(request.POST)  # form 包含提交的数据
    #
    #     if form.is_valid():  # 如果提交的数据合法
    #         a = form.cleaned_data['a']
    #         b = form.cleaned_data['b']
    #         return HttpResponse(str(int(a) + int(b)))

    # hosts = models.Host.objects.all()
    # hostgroup = models.HostGroup.objects.all()
    # hg_id = request.POST.get('hg')
    # print 'a---->{hg_id}' + str(hg_id)
    a = ''
    # a = models.Host.objects.filter(hostgroup=hg_id)
    # a = serializers.serialize("json", models.Host.objects.filter(hostgroup=hg_id))
    # print 'a---->{dict}'+a
    name_dict = {'twz': a}
    # return HttpResponse(json.dumps(name_dict), content_type='application/json')

def query(request):
    # a = request.GET['a']
    # a = request.POST.get('a')
    print 'Raw Data: "%s"' % request.body
    print 'a: "%s"' % request.POST.get('a')
    a = request.POST.get("a")
    print 'a-->'+str(a)
    # b = serializers.serialize("json", models.Host.objects.filter(hostgroup=a))
    b =  models.Host.objects.filter(hostgroup__name=a)
    host_ip = tuple(k.ip for k in b)
    ip_list = []
    for k in b:
        ip_list.append(k.ip)
    print 'ip_list===>',ip_list
    # print 'b--->str()'+str(host_ip)
    print 'b--->',host_ip
    host_ip_dict = {'host_ip': host_ip}
    # return HttpResponse(str(host_ip))
    return HttpResponse(json.dumps(host_ip_dict), content_type='application/json')

def queryhostgroup(request):
    # a = request.GET['a']
    # a = request.POST.get('a')
    print 'Raw Data: "%s"' % request.body
    print 'a: "%s"' % request.POST.get('a')
    a = request.POST.get("a")
    print 'a-->'+str(a)
    # b = serializers.serialize("json", models.Host.objects.filter(hostgroup=a))
    b =  models.Host.objects.filter(hostgroup__name=a)
    ip = tuple(k.ip for k in b)
    ip_list = []
    for k in b:
        ip_list.append(k.ip)
    print 'ip_list===>',ip_list
    # print 'b--->str()'+str(host_ip)
    print 'b--->',ip
    host_ip_dict = {'hosts_ip': ip}
    # return HttpResponse(str(host_ip))
    return HttpResponse(json.dumps(host_ip_dict), content_type='application/json')

def add(request):
    a = request.GET['a']
    b = request.GET['b']
    a = int(a)
    b = int(b)
    print 'a+b--->str()'+str(a+b)
    return HttpResponse(str(a+b))

# def ajax_dict(request):
#     hosts = models.Host.objects.all()
#     a = ''
#     child = subprocess.Popen(['/bin/bash', '-c', '/Users/jimmy/PycharmProjects/test_shell/web/hello.sh'],
#                              stdout=subprocess.PIPE, stderr=subprocess.PIPE)
#     out = child.stdout.readlines()
#     for line in out:
#         print line.strip()
#         a1 = line.strip()
#         a = a1
#     name_dict = {'twz': a}
#     return HttpResponse(json.dumps(name_dict), content_type='application/json')
'''
def ajax_list(request):
    a = range(100)
    return HttpResponse(json.dumps(a), content_type='application/json')

def ajax_dict(request):
    name_dict = {'twz': 'Love Python And Django', 'zqxt': 'I am teaching Django'}
    return HttpResponse(json.dumps(name_dict), content_type='application/json')
'''

#=============================================
from django.shortcuts import render,render_to_response
from django.http import HttpResponse
from django import forms
# from models import User
from django.contrib.auth.models import User

# Create your views here.
class UserForm(forms.Form):
    username = forms.CharField(label='用户名',max_length=50)
    password = forms.CharField(label='密码',widget=forms.PasswordInput())
    email = forms.EmailField(label='邮箱')
    first_name = forms.CharField(label='名')
    last_name = forms.CharField(label='姓')
    # is_superuser = forms.CharField(label='超级管理员')

def regist(request):
    if request.method == 'POST':
        userform = UserForm(request.POST)
        #user=User()
        if userform.is_valid():
            username = userform.cleaned_data['username']
            password = userform.cleaned_data['password']
            email = userform.cleaned_data['email']
            first_name = userform.cleaned_data['first_name']
            last_name = userform.cleaned_data['last_name']
            # is_superuser = userform.cleaned_data['is_superuser']

            # User.objects.create(username=username,password=password,email=email,first_name=first_name,last_name=last_name)
            # user = User.objects.create(username=username,password=password,email=email,first_name=first_name,last_name=last_name,is_superuser=is_superuser)
            user = User.objects.create(username=username,password=password,email=email,first_name=first_name,last_name=last_name)
            user.save()
            return HttpResponse("<h4>You've registed successfully! <a href='/login/'>click here</a> to go back to main page</h4>")
            #return HttpResponse('regist success!!!')
    else:
        userform = UserForm()
    return render_to_response('regist_user.html',{'userform':userform})


def run_cmd_old_is_test(request):
    hostgroup = models.HostGroup.objects.all()
    CMD = ['shell','ping','copy','script','cron','file','yum','user','group','git','service','setup','raw','synchronize','get_url']
    result_dict = '执行结果...'
    rt = ''
    status = ''
    if request.method == "POST":
        # var data = $.parseJSON({ "n":"task#100000@project","m": fun, "a": arg, "t": tgt})

        fun = request.POST.get('fun')
        arg = request.POST.get('arg')
        tgt = request.POST.get('tgt')
        print "Target: %s  Fun: %s  Arg: %s" % ( str(tgt), str(fun), str(arg) )
        result_dict = Api.runCmd(tgt, fun, arg, 'root', 5)

        u_result_dict = {}
        detail_result_dict = result_dict.get('detail')
        print 'detail_result_dict',detail_result_dict
        if detail_result_dict != {}:

            for d_result_dict in detail_result_dict:
                print 'd_result_dict',d_result_dict
            u_result_list = detail_result_dict['localhost'][:]
            stdout_list=[]
            for u_result_dict in u_result_list:
                if u_result_dict['rc'] == 0:
                    if u_result_dict['task_name'] == 'command':
                        stdout_list.append(u_result_dict['stdout'])
                        status = 'success'
                    elif u_result_dict['task_name'] == 'copy':
                        rt = 'copied success'
                        status = 'success'
                elif u_result_dict['rc'] == 1:
                    if u_result_dict['task_name'] == 'command':
                        stdout_list.append(u_result_dict['stderr'])
                        status = 'failed'
                    elif u_result_dict['task_name'] == 'copy':
                        rt = 'copied failed'
                        status = 'failed'
            print stdout_list

            msg = str(stdout_list)
            msg = msg.replace("[u'","")
            msg = msg.replace("']","")
            msg = msg.replace('\\t', ' ')
            msg = msg.replace('\\n', '<br>')
            rt += msg
            print rt
        else:
            rt = 'cannot found the host'
            status = 'failed'
    return render_to_response('host_command.html', {'login_user': request.user,'hostgroup': hostgroup,'cmds': CMD,'rt':rt,'status': status})


def ops_command(request):
    hostgroup = models.HostGroup.objects.all()
    CMD = ['shell', 'ping', 'copy', 'script', 'cron', 'file', 'yum', 'user', 'group', 'git', 'service', 'setup', 'raw',
           'synchronize', 'get_url']
    rt = ''
    status = ''
    url = 'http://192.168.109.174:8765/command'
    # if request.method == 'POST':
    #     print 'Raw Data: "%s"' % request.body
    #     # json_data = json.loads(request.body)
    #     # data = request['data']
    #     # print 'data-------->',data
    #     # var data = $.parseJSON({ "n":"task#100000@project","m": fun, "a": arg, "t": tgt})
    #     n = 'task#100000@project'
    #     m = request.POST.get('fun')
    #     a = request.POST.get('arg')
    #     t = request.POST.get('tgt')
    #     # print "Taskname: %s  Target: %s  Module: %s  Arg: %s" % (str(n),str(t), str(m), str(a))
    #     print "Taskname: %s  Target: %s  Module: %s  Arg: %s" % (n, t, m, a)
    #     # result_dict = Api.runCmd(tgt, fun, arg, 'root', 5)
    #     json_data=json.dumps({ 'n':n,'m': m, 'a': a, 't': t, 's':'','r':'True'})
    #     print 'json_data--->',json_data
    #
    #     # print 'json_data',json_data
    #     post = post_json(json_data)
    #     responses = json.load(post)
    #     print type(responses)
    #     for response in responses:
    #         print 'responses',responses
    #         print "response[detail]",responses[u'detail']
    #     # response = json.load(post)
    #     if responses['rc'] == 0:
    #         status = 'success'
    #         for host_res in responses['detail']:
    #             print '[success result]:', host_res, '\n<===============success===============> \n', \
    #             responses['detail'][host_res][0]['stdout']
    #     elif responses['rc'] != 0:
    #         status = 'failed'
    #         print responses
    #         for host_res in responses['detail']:
    #             if responses['detail'][host_res][0]['rc'] == 0:
    #                 print '[success result]:', host_res, '\n<===============success===============> \n', \
    #                 response['detail'][host_res][0]['stdout']
    #             if responses['detail'][host_res][0]['rc'] == 1:
    #                 if responses['detail'][host_res][0].has_key('stderr'):
    #                     print '[error result]:', host_res, '\n<===============error===============> \n', \
    #                     responses['detail'][host_res][0]['stderr']
    #                 elif response['detail'][host_res][0].has_key('msg'):
    #                     print '[error result]:', host_res, '\n<===============message===============> \n', \
    #                     responses['detail'][host_res][0]['msg']
    #                 else:
    #                     print '[error result]:', host_res, '\n<===============others===============> \n', \
    #                     responses['detail'][host_res][0]
    return render_to_response('host_command.html',
                              {'login_user': request.user, 'hostgroup': hostgroup, 'cmds': CMD})


def run_cmd(request):
    hostgroup = models.HostGroup.objects.all()
    CMD = ['shell', 'ping', 'copy', 'script', 'cron', 'file', 'yum', 'user', 'group', 'git', 'service', 'setup', 'raw',
           'synchronize', 'get_url']
    rt = {}
    status = ''
    #url = 'http://192.168.110.30:8765/command'
    if request.method == 'POST':
        print 'Raw Data: "%s"' % request.body
        # json_data = json.loads(request.body)
        # data = request['data']
        # print 'data-------->',data
        # var data = $.parseJSON({ "n":"task#100000@project","m": fun, "a": arg, "t": tgt})
        n = 'task#100000@project'
        m = request.POST.get('fun')
        a = request.POST.get('arg')
        t = request.POST.get('tgt')

        print "Taskname: %s  Target: %s  Module: %s  Arg: %s" % (n, t, m, a)
        # json_data={'n': n, 'm': m, 'a': a, 't': t, 's': '', 'r': 'True'}
        json_data={'n': n, 'm': m, 'a': a, 't': t, 's':'', 'r':'True'}
        #data = {'n':'task#id@project','m':'shell','a':"ifconfig eth0",'t':'all','s':'','r':'True'}
        print 'json_data--->',json_data

        # print 'json_data',json_data
        post = post_json(json_data)
        responses = json.load(post)
        print type(responses)
        for response in responses:
            print 'responses',responses
            print "response[detail]",responses[u'detail']
        # response = json.load(post)
        if responses['rc'] == 0:
            status = 'success'
            for host_res in responses['detail']:
                print '[success result]:', host_res, '\n<===============success===============> \n', \
                # responses['detail'][host_res][0]['stdout']
        elif responses['rc'] != 0:
            status = 'failed'
            print responses
            for host_res in responses['detail']:
                if responses['detail'][host_res][0]['rc'] == 0:
                    print '[success result]:', host_res, '\n<===============success===============> \n', \
                    responses['detail'][host_res][0]['stdout']
                if responses['detail'][host_res][0]['rc'] == 1:
                    if responses['detail'][host_res][0].has_key('stderr'):
                        print '[error result]:', host_res, '\n<===============error===============> \n', \
                        responses['detail'][host_res][0]['stderr']
                    elif responses['detail'][host_res][0].has_key('msg'):
                        print '[error result]:', host_res, '\n<===============message===============> \n', \
                        responses['detail'][host_res][0]['msg']
                    else:
                        print '[error result]:', host_res, '\n<===============others===============> \n', \
                        responses['detail'][host_res][0]
        rt = responses
    return render_to_response('host_command.html',{'login_user': request.user,'cmds': CMD,'rt': rt,'status': status})


def run_scripts(request):
    CMD = ['script']
    hostgroup = models.HostGroup.objects.all()
    id = range (1,11)
    global description
    description = []
    rt = {}
    status = ''
   
    data = {"n": "playbook_test#100000@project", "h": "all", "f": "/tmp/ansible-api/echo.yml", "s": "1", "c": 50}
    if request.method == 'POST':
        print 'Raw Data: "%s"' % request.body
        t = request.POST.get('tgt')
        print 'tgt----->',t
        time = request.POST.get('time')
        print 'time----->',time

        filename = request.POST.get('arg')
        print 'filename----------->',str(filename.split('/')[4])
        description.append('Filename:'+str(filename.split('/')[4]))
       
        #server='10.6.97.217'
        user = 'root'
        passwd = '1234.com'
        localpath = './media/'+filename
        print 'Localpath----------->', localpath
        description.append('Localpath:' + localpath)
        remotepath = '/tmp/'+str(filename.split('/')[4])
        description.append('Remotepath:' + remotepath)
        ssh = paramiko.SSHClient()
        print 'load host keys----------->'
        description.append('Load host keys ~/.ssh/known_hosts')
        ssh.load_host_keys(os.path.expanduser(os.path.join("~", ".ssh", "known_hosts")))
        print 'ready to connect server----------->',server
        description.append('Connect server:'+server + ',please wait...')
        ssh.connect(server, username=user, password=passwd)
        
        print 'open sftp----------->'
        description.append('Try to open sftp port on server:' + server + ',please wait...')
        sftp = ssh.open_sftp()
        print 'put file to remote server ----------->'
        description.append('Put playbook to remote server:' + server + '[/tmp/playbookname],please wait...')
        sftp.put(localpath, remotepath)
        sftp.close()
        ssh.close()
        print 'copy finished',localpath
        description.append('Finished,try to close connect to remote server.')

        rt = {}

        status = ''
        url = "http://server:8765/command"

        # json_data = json.loads(request.body)
        # data = request['data']
        # print 'data-------->',data
        # var data = $.parseJSON({ "n":"task#100000@project","m": fun, "a": arg, "t": tgt})
        n = 'task#100000@project'
        m = 'script'
        # a = request.POST.get('arg')
        a = remotepath
        # t = request.POST.get('tgt')

        print "Taskname: %s  Target: %s  Module: %s  Arg: %s" % (n, t, m, a)
        # json_data={'n': n, 'm': m, 'a': a, 't': t, 's': '', 'r': 'True'}
        json_data = {'n': n, 'm': m, 'a': remotepath, 't': t,'s': '', 'r': 'True'}
        print 'json_data--->', json_data


        #=======================================================
        # Testing for celery run a script,render callback to PE
        # print('Parent process %s.' % os.getpid())
        # if time:
        #     rt = run_task2(json_data,time)
            # print 'rt------->',rt

            # p = Process(target=run_task2(json_data,time))
            # p = Process(target=run_task2(json_data,time))
            # print('Child process will start.')
            # p.start()
            # p.join()
            # print('Child process end.')
            # run_task2(json_data,time)
            # r2 = run_task2(json_data,time)

        # print 'json_data',json_data
        # print 'I am here...'
        # print 'rt1------->', rt
        #=======================================================

        post = post_json(json_data)
        responses = json.load(post)
        print type(responses)
        for response in responses:
            # print 'responses', responses
            print "response[detail]", responses[u'detail']
        # response = json.load(post)
        if responses['rc'] == 0:
            status = 'success'
            for host_res in responses['detail']:
                print '[success result]:', host_res, '\n<===============success===============> \n', \
                    # responses['detail'][host_res][0]['stdout']
        elif responses['rc'] != 0:
            status = 'failed'
            print responses
            for host_res in responses['detail']:
                if responses['detail'][host_res][0]['rc'] == 0:
                    print '[success result]:', host_res, '\n<===============success===============> \n', \
                        responses['detail'][host_res][0]['stdout']
                if responses['detail'][host_res][0]['rc'] == 1:
                    if responses['detail'][host_res][0].has_key('stderr'):
                        print '[error result]:', host_res, '\n<===============error===============> \n', \
                            responses['detail'][host_res][0]['stderr']
                    elif responses['detail'][host_res][0].has_key('msg'):
                        print '[error result]:', host_res, '\n<===============message===============> \n', \
                            responses['detail'][host_res][0]['msg']
                    else:
                        print '[error result]:', host_res, '\n<===============others===============> \n', \
                            responses['detail'][host_res][0]
        rt = responses

    return render_to_response('host_scripts.html',{'login_user': request.user, 'cmds': CMD, 'rt': rt, 'status': status})


def run_playbook(request):
    hostgroup = models.HostGroup.objects.all()
    id = range (1,11)
    global description
    description = []
    rt = {}
    status = ''
    # url = 'http://192.168.51.167:8765/playbook'
    url = 'http://192.168.110.30:8765/playbook'
    data = {"n": "playbook_test#100000@project", "h": "all", "f": "/tmp/ansible-api/echo.yml", "s": "1", "c": 50}
    if request.method == 'POST':
        print 'Raw Data: "%s"' % request.body
        filename = request.POST.get('arg')
        print 'filename----------->',str(filename.split('/')[4])
        description.append('Filename:'+str(filename.split('/')[4]))

	#server='10.6.97.217'
        user = 'root'
        passwd = '1234.com'
        localpath = './media/'+filename
        print 'Localpath----------->', localpath
        description.append('Localpath:' + localpath)
        remotepath = '/tmp/'+str(filename.split('/')[4])
        description.append('Remotepath:' + remotepath)
        ssh = paramiko.SSHClient()
        print 'load host keys----------->'
        description.append('Load host keys ~/.ssh/known_hosts')
        ssh.load_host_keys(os.path.expanduser(os.path.join("~", ".ssh", "known_hosts")))
        print 'ready to connect server----------->'
        description.append('Connect server:'+server + ',please wait...')
        ssh.connect(server, username=user, password=passwd)
        print 'open sftp----------->'
        description.append('Try to open sftp port on server:' + server + ',please wait...')
        sftp = ssh.open_sftp()
        print 'put file to remote server ----------->'
        description.append('Put playbook to remote server:' + server + '[/tmp/playbookname],please wait...')
        sftp.put(localpath, remotepath)
        sftp.close()
        ssh.close()
        print 'copy finished',localpath
        description.append('Finished,try to close connect to remote server.')

        post = post_playbook({"n": "playbook_test#100000@project", "h": "all", "f": "/tmp/"+str(filename.split('/')[4]), "s": "1", "c": 50})
        #post = post_playbook({"n": "playbook_test#100000@project", "h": "all", "f": "/tmp/"+str(filename.split('/')[4])})
        description.append('Excuting playbook...')
        responses = json.load(post)
        print responses
        num = len(responses[u'detail'])
        detail_of_num = range(num)
        print 'detail_of_num',detail_of_num
        for response in responses:
            print 'responses',responses
            print "response[detail]",responses[u'detail']
        # description.append('Playbook detail:'+responses[u'detail'])
        if responses['rc'] == 0:
            status = 'success'
            for host_res in responses['detail']:
                print '[success result]:', host_res, '\n<===============success===============> \n', \
                # responses['detail'][host_res][0]['stdout']
        elif responses['rc'] != 0:
            status = 'failed'
            print responses
            for host_res in responses['detail']:
                if responses['detail'][host_res][0]['rc'] == 0:
                    print '[success result]:', host_res, '\n<===============success===============> \n', \
                    responses['detail'][host_res][0]['stdout']
                if responses['detail'][host_res][0]['rc'] == 1:
                    if responses['detail'][host_res][0].has_key('stderr'):
                        print '[error result]:', host_res, '\n<===============error===============> \n', \
                        responses['detail'][host_res][0]['stderr']
                    elif responses['detail'][host_res][0].has_key('msg'):
                        print '[error result]:', host_res, '\n<===============message===============> \n', \
                        responses['detail'][host_res][0]['msg']
                    else:
                        print '[error result]:', host_res, '\n<===============others===============> \n', \
                        responses['detail'][host_res][0]
        rt = responses
        description.append('Finished executing playbook.')
    return render_to_response('host_playbook.html',{'login_user': request.user,'rt': rt,'description':description})

def add_asset(request):

    print 'Raw Data: "%s"' % request.body
    f = request.POST.get('import_file')
    print 'f===>',f
    filename = 'media/' + f
    print 'filename===>',filename

    # upload execl
    def getAssetsData(fname=filename):
        bk = xlrd.open_workbook(fname)
        dataList = []
        try:
            server = bk.sheet_by_name("server")

            for i in range(1, server.nrows):
                dataList.append(server.row_values(i))
        except Exception, e:
            return []
        print 'dataList===>',dataList
        return dataList

    dataList = getAssetsData(fname=filename)
    # get host data list
    for data in dataList:
        assets = {
            'assets_type': data[0],
            'sn': data[1],
            'management_ip': data[4],
            'manufacturer': data[5],
            'model': data[6],
            'provider': data[7],
            'status': int(data[8]),
            'put_zone': int(data[9]),
            'group': int(data[10]),
            'business': int(data[11]),
        }
        if data[2]: assets['buy_time'] = xlrd.xldate.xldate_as_datetime(data[2], 0)
        if data[3]: assets['expire_date'] = xlrd.xldate.xldate_as_datetime(data[3], 0)
        if assets.get('assets_type') in ['vmser', 'server']:
            server_assets = {
                'ip': data[12],
                'keyfile': data[13],
                'username': data[14],
                'passwd': data[15],
                'hostname': data[16],
                'port': data[17],
                'raid': data[18],
                'line': data[19],
            }
        else:
            net_assets = {
                'ip': data[12],
                'bandwidth': data[13],
                'port_number': data[14],
                'firmware': data[15],
                'cpu': data[16],
                'stone': data[17],
                'configure_detail': data[18]
            }
        try:
            count = Asset.objects.filter(sn=assets.get('sn')).count()
            if count == 1:
                assetsObj = Asset.objects.get(sn=assets.get('sn'))
                Asset.objects.filter(sn=assets.get('sn')).update(**assets)
                if assets.get('assets_type') in ['vmser', 'server']:
                    Server.objects.filter(assets=assetsObj).update(**server_assets)
            else:
                assetsObj = Asset.objects.create(**assets)
                if assets.get('assets_type') in ['vmser', 'server']:
                    Server.objects.create(assets=assetsObj, **server_assets)
        except Exception, e:
            print e
    # return HttpResponseRedirect("/host_list/")
    # return JsonResponse({'msg': "操作成功 - edit by jimmy zhou", "code": 200, 'data': []})
    # response = {'status': 1}
    # return HttpResponse(json.dumps(response), content_type='application/json')
    # return redirect("/host_list/")
    # assets = models.Asset.objects.all()
    # servers = models.Server.objects.all()
    return render_to_response('host_list.html',{'login_user': request.user,'assets': assets,'servers': servers,'response':response})

# < -- droppable upload file by AJAX api start-->
from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.views.generic import FormView, DetailView, ListView
from .forms import ProfileImageForm
from .models import ProfileImage

class ProfileImageView(FormView):
    # template_name = 'profile_image_form.html'
    template_name = 'host_playbook.html'
    form_class = ProfileImageForm
    flag_upload = 'null'
    def form_valid(self, form):
        profile_image = ProfileImage(
            image=self.get_form_kwargs().get('files')['image'])
        profile_image.save()
        self.id = profile_image.id
        flag_upload ='success'
        # return HttpResponseRedirect(self.get_success_url())
        # return render_to_response('profile_image_form.html', {'image': profile_image,'flag_upload':flag_upload})
        return render_to_response('host_playbook.html', {'image': profile_image,'flag_upload':flag_upload})

class ScriptsProfileImageView(FormView):

    # template_name = 'profile_image_form.html'
    template_name = 'host_scripts.html'
    form_class = ProfileImageForm
    flag_upload = 'null'
    def form_valid(self, form):
        CMD = ['script']
        profile_image = ProfileImage(
            image=self.get_form_kwargs().get('files')['image'])
        profile_image.save()
        self.id = profile_image.id
        flag_upload ='success'
        # return HttpResponseRedirect(self.get_success_url())
        # return render_to_response('profile_image_form.html', {'image': profile_image,'flag_upload':flag_upload})
        return render_to_response('host_scripts.html', {'image': profile_image,'flag_upload':flag_upload, 'cmds': CMD})

class ScheduleScriptsProfileImageView(FormView):

    # template_name = 'profile_image_form.html'
    template_name = 'schedule_scripts.html'
    form_class = ProfileImageForm
    flag_upload = 'null'
    def form_valid(self, form):
        CMD = ['script']
        profile_image = ProfileImage(
            image=self.get_form_kwargs().get('files')['image'])
        profile_image.save()
        self.id = profile_image.id
        flag_upload ='success'
        # return HttpResponseRedirect(self.get_success_url())
        # return render_to_response('profile_image_form.html', {'image': profile_image,'flag_upload':flag_upload})
        return render_to_response('schedule_scripts.html', {'image': profile_image,'flag_upload':flag_upload, 'cmds': CMD})

class HostListProfileImageView(FormView):
    template_name = 'host_list.html'
    form_class = ProfileImageForm
    flag_upload = 'null'
    def form_valid(self, form):
        profile_image = ProfileImage(
            image=self.get_form_kwargs().get('files')['image'])
        profile_image.save()
        self.id = profile_image.id
        flag_upload ='success'
        return render_to_response('host_list.html', {'image': profile_image,'flag_upload':flag_upload})

def post_new(request):
    form = ProfileImageForm()
    return render(request, 'host_playbook.html', {'form': form})
# < -- droppable upload file by AJAX api end-->

def data(request, id):
    response=[]
    try:
        rlist = description
    # print 'description------------------>>>>>',description
        rjson = json.dumps(rlist)
        response = HttpResponse()
        response['Content-Type'] = "text/javascript"
        response.write(rjson)
    except:
        pass
    return response

# < -- Log command start-->
def log_cmd(request):
        #server='10.6.97.217'
        # uri = 'mongodb://192.168.109.112'
        uri = 'mongodb://'+server
        client = MongoClient(uri)
        db = client.ansible
        log_cmd_list=[]
        for i in db.adhoc.find():
            log_cmd_list.append(i)

        log_cmd_stderr_list = []
        log_cmd_stdout_list = []
        for i in log_cmd_list:
            if i['rc'] == 1:
                msg=i['msg']
                if msg.has_key('stderr'):
                    # print i['ctime'],msg['host'],msg['stderr']
                    log_cmd_stderr_list.append({'ctime':i['ctime'],'host':msg['host'],'stderr':msg['stderr']})
            elif i['rc'] == 0:
                msg = i['msg']
                if msg.has_key('stdout'):
                    # print i['ctime'], msg['host'], msg['stdout']
                    log_cmd_stdout_list.append({'ctime': i['ctime'], 'host': msg['host'], 'stdout': msg['stdout']})
        print 'log_cmd_stderr_list-->',log_cmd_stderr_list
        print 'log_cmd_stdout_list-->',log_cmd_stdout_list
	return render_to_response('log_command.html',{'login_user': request.user,'log_cmd_stderr_list':log_cmd_stderr_list,'log_cmd_stdout_list':log_cmd_stdout_list})

# < -- Log command start-->
def log_playbook(request):
        #server='10.6.97.217'
        #uri='mongodb://10.6.97.217'
        uri = 'mongodb://'+server
        client = MongoClient(uri)
        db = client.ansible
        log_playbook_list=[]
        for i in db.playbook.find():
            log_playbook_list.append(i)

        log_playbook_stderr_list = []
        log_playbook_stdout_list = []
        for i in log_playbook_list:
            if i['rc'] == 1:
                msg=i['msg']
                if msg.has_key('stderr'):
                    # print i['ctime'],msg['host'],msg['stderr']
                    log_playbook_stderr_list.append({'ctime':i['ctime'],'host':msg['host'],'stderr':msg['stderr']})
            elif i['rc'] == 0:
                msg = i['msg']
                if msg.has_key('stdout'):
                    # print i['ctime'], msg['host'], msg['stdout']
                    log_playbook_stdout_list.append({'ctime': i['ctime'], 'host': msg['host'], 'stdout': msg['stdout']})
        print 'log_playbook_stderr_list-->',log_playbook_stderr_list
        print 'log_playbook_stdout_list-->',log_playbook_stdout_list
	return render_to_response('log_playbook.html',{'login_user': request.user,'log_playbook_stderr_list':log_playbook_stderr_list,'log_playbook_stdout_list':log_playbook_stdout_list})

def schedule_scripts(request):
    CMD = ['script']
    hostgroup = models.HostGroup.objects.all()
    id = range (1,11)
    global description
    description = []
    rt = {}
    status = ''
    url = 'http://192.168.110.30:8765/playbook'
    data = {"n": "playbook_test#100000@project", "h": "all", "f": "/tmp/ansible-api/echo.yml", "s": "1", "c": 50}
    if request.method == 'POST':
        print 'Raw Data: "%s"' % request.body
        t = request.POST.get('tgt')
        print 'tgt----->',t
        time = request.POST.get('time')
        print 'time----->',time

        filename = request.POST.get('arg')
        print 'filename----------->',str(filename.split('/')[4])
        description.append('Filename:'+str(filename.split('/')[4]))
        #server='10.6.97.217'
        
        user = 'root'
        passwd = '1234.com'
        localpath = './media/'+filename
        print 'Localpath----------->', localpath
        description.append('Localpath:' + localpath)
        remotepath = '/tmp/'+str(filename.split('/')[4])
        description.append('Remotepath:' + remotepath)
        ssh = paramiko.SSHClient()
        print 'load host keys----------->'
        description.append('Load host keys ~/.ssh/known_hosts')
        ssh.load_host_keys(os.path.expanduser(os.path.join("~", ".ssh", "known_hosts")))
        print 'ready to connect server----------->'
        description.append('Connect server:'+server + ',please wait...')
        ssh.connect(server, username=user, password=passwd)
        print 'open sftp----------->'
        description.append('Try to open sftp port on server:' + server + ',please wait...')
        sftp = ssh.open_sftp()
        print 'put file to remote server ----------->'
        description.append('Put playbook to remote server:' + server + '[/tmp/playbookname],please wait...')
        sftp.put(localpath, remotepath)
        sftp.close()
        ssh.close()
        print 'copy finished',localpath
        description.append('Finished,try to close connect to remote server.')

        rt = {}

        status = ''
        url = 'http://192.168.110.82:8765/command'

        # json_data = json.loads(request.body)
        # data = request['data']
        # print 'data-------->',data
        # var data = $.parseJSON({ "n":"task#100000@project","m": fun, "a": arg, "t": tgt})
        n = 'task#100000@project'
        m = 'script'
        # a = request.POST.get('arg')
        a = remotepath
        # t = request.POST.get('tgt')

        print "Taskname: %s  Target: %s  Module: %s  Arg: %s" % (n, t, m, a)
        json_data={'n': n, 'm': m, 'a': a, 't': t, 's': '', 'r': 'True'}
        #json_data = {'n': n, 'm': m, 'a': remotepath, 't': t}
        print 'json_data--->', json_data


        #=======================================================
        # Testing for celery run a script,render callback to PE
        # print('Parent process %s.' % os.getpid())
        if time:
            # rt = run_task2(json_data,time)
            # print 'rt------->',rt

            # p = Process(target=run_task2(json_data,time))
            # p = Process(target=run_task2(json_data,time))
            # print('Child process will start.')
            # p.start()
            # p.join()
            # print('Child process end.')
            # run_task2(json_data,time)
            print 'Running celery task - scripts ...'
            rt = run_task2(json_data,time)


        print 'rt------->', rt
        #========================================================

    return render_to_response('schedule_scripts.html',{'login_user': request.user, 'cmds': CMD, 'rt': rt, 'status': status})


def schedule_details(request):


    from celery_tasks import app
    import celery
    from celery.result import AsyncResult
    i = app.control.inspect()
    scheduled = i.scheduled()
    schedule_dict = []
    # print 'scheduled---->',scheduled
    #if scheduled['celery@MacBookPro']:
    if scheduled['celery@node216']:
        # print 'scheduled task id---->',scheduled['celery@node216'][0]['request']['id']
        # print 'scheduled task---->',scheduled['celery@node216'][0]
        for i in scheduled['celery@node216']:
            # print 'scheduled task:eta|args|id====>',i['eta'],'|',i['request']['args'],'|',i['request']['id']
            eta = i['eta']
            args = i['request']['args']
            id = i['request']['id']

            result = celery.result.AsyncResult(id)
            state = result.state
            schedule_dict.append(
                {'eta':eta,'args':args,'id':id,'state':state}
            )
            print 'id======================>',id

            # if created:
            #     # means you have created a new person
            #     sche_det = ScheduleDetails.objects.create(eta=eta, args=args, sid=id, state=state)
            #     sche_det.save()
            # else:
            #     # person just refers to the existing one
            #     models.ScheduleDetails.objects.filter(sid=id).update(state=state)

            try:
                obj = ScheduleDetails.objects.get(sid=id)
                # result = celery.result.AsyncResult(id)
                # state = result.state
                # models.ScheduleDetails.objects.filter(sid=id).update(state=state)
            except ScheduleDetails.DoesNotExist:
                obj = ScheduleDetails(eta=eta, args=args, sid=id, state=state)
                obj.save()

    else:
        print 'not exist request & id'




    # try:
    from celery.result import AsyncResult
    Schedule = models.ScheduleDetails.objects.all().values('sid')
    print 'Schedule', Schedule
    list_of_schedule = Schedule[::1]
    print 'list_of_m', list_of_schedule
    status = ''
    for schedule_element in list_of_schedule:
        # print schedule_element['sid']
        # result = celery.result.AsyncResult(schedule_element['sid'])
        # state = result.state
        newid = schedule_element['sid']

        status = celery.result.AsyncResult(newid).state
        result = celery.result.AsyncResult(newid).result
        print schedule_element['sid'], status,result
        # models.ScheduleDetails.objects.filter(sid=newid).update(state=state)
        ScheduleDetails.objects.filter(sid=newid).update(state=status,result=result)
        # print 'upate sid'
    # except ScheduleDetails.DoesNotExist:
    #     print 'Does not exist id---->'

    schedule_dic = models.ScheduleDetails.objects.all()
    # print 'schedule_dic---->', schedule_dic

    # if request.method == 'POST':
    # print 'Raw Data: "%s"' % request.body
    id = request.POST.get("sid")
    # print 'sid===============>',request.POST.get("sid")

    return render_to_response('schedule_details.html',{'login_user': request.user, 'schedule_dic':schedule_dic })

def cancel_post_json_task(request):
    from celery_tasks import app
    import celery
    from celery.result import AsyncResult

    rt = {}
    status = ''

    if request.method == 'POST':
        print 'cancel_post_json_task Raw Data: "%s"' % request.body
        sid = request.POST.get("sid")
        print 'cancel_post_json_task sid =====>',sid



        result = celery.result.AsyncResult(sid)
        state = result.state
        print 'result,state =========>>>',result,state
    return HttpResponse(json.dumps(sid), content_type='application/json')
    # return HttpResponse(sid, content_type='application/json')
    # return render_to_response('schedule_details.html',{'login_user': request.user,'rt': rt,'status': status})
