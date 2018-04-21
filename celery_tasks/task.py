#!/usr/bin/env python
# encoding: utf-8

# from __future__ import absolute_import
# import time
#
# from celery import Celery
# from celery import Task
#
# app = Celery('salmon', backend='redis://192.168.109.112:6379/0',broker='redis://192.168.109.112:6379/0')
#
#
# # @app.task
# # def add(pri):
# #     print "add called with pri: {}".format(pri)
# #     # time.sleep(5)
# #     return pri
# #
# #
# # @app.task
# # def add(x, y):
# #     return x + y
#
# class MyTask(Task):
#     def on_success(self, retval, task_id, args, kwargs):
#         print 'Task done - result: {0}'.format(retval)
#         return super(MyTask, self).on_success(retval, task_id, args, kwargs)
#
#     def on_failure(self, exc, task_id, args, kwargs, einfo):
#         print 'Task fail - reason: {0}'.format(exc)
#         return super(MyTask, self).on_failure(exc, task_id, args, kwargs, einfo)
#
#
# @app.task(base=MyTask)
# def add(x, y):
#     return x + y

#========================================================================================================
from __future__ import absolute_import, unicode_literals
import time
from celery_tasks import app
import sys
import urllib
import urllib2
import yaml
import json

# def json_load_byteified(file_handle):
#     return _byteify(
#         json.load(file_handle, object_hook=_byteify),
#         ignore_dicts=True
#     )
#
# def json_loads_byteified(json_text):
#     return _byteify(
#         json.loads(json_text, object_hook=_byteify),
#         ignore_dicts=True
#     )
#
# def _byteify(data, ignore_dicts = False):
#     # if this is a unicode string, return its string representation
#     if isinstance(data, unicode):
#         return data.encode('utf-8')
#     # if this is a list of values, return list of byteified values
#     if isinstance(data, list):
#         return [ _byteify(item, ignore_dicts=True) for item in data ]
#     # if this is a dictionary, return dictionary of byteified keys and values
#     # but only if we haven't already byteified it
#     if isinstance(data, dict) and not ignore_dicts:
#         return {
#             _byteify(key, ignore_dicts=True): _byteify(value, ignore_dicts=True)
#             for key, value in data.iteritems()
#         }
#     # if it's anything else, return it in its original form
#     return data




# @app.task(serializer='pickle')
@app.task
# def post_json(data):
def post_json(a,m,t,n):
    #data={'a': a, 'm': m, 't': t, 'n': n}
    data={'a': a, 'm': m, 't': t, 'n': n, "s":"","r":"True"}
    # data={"n":"task#100000@salmon","m":"shell","a":"ifconfig eth0","t":"all","s":"","r":"True"}
    # print 'data=======>',data
    url = 'http://10.6.97.217:8765/command'
    # url = 'http://192.168.51.167:8765/command'
    # url = 'http://192.168.109.174:8765/playbook'
    # data = {'n':'task#id@project','m':'shell','a':"ifconfig eth0",'t':'all','s':'','r':'True'}
    # data = {'n':'task#id@project','m':'shell','a':"ifconfig eth0",'t':'all','s':'','r':'True'}
    # data = {"n":"playbook_test#100000@project","h":"all","f":"/tmp/ansible-api/echo.yml","s":"1","c":50}
    json_data = json.dumps(data)
    print 'json_data=======>',json_data
    # print 'json_data',json_data
    req = urllib2.Request(url,json_data)
    # req = urllib2.Request(url,data)
    response = urllib2.urlopen(req)
    # print 'response',response
    # print 'response_json_load========>',json.load(response)[u'detail']
    # response = json.dumps(json.load(response)[u'detail'])
    response = json.dumps(json.load(response))
    return response


@app.task
def post_playbook(json_data):
    url = 'http://10.6.97.217:8765/playbook'
    # url = 'http://192.168.51.167:8765/playbook'
    # url = 'http://192.168.109.112:8765/playbook'
    # data = {'n':'task#id@project','m':'shell','a':"ifconfig eth0",'t':'all','s':'','r':'True'}
    # data = {'n':'task#id@project','m':'shell','a':"ifconfig eth0",'t':'all','s':'','r':'True'}
    # data = {"n":"playbook_test#100000@project","h":"all","f":"/tmp/ansible-api/echo.yml","s":"1","c":50}
    json_data = json.dumps(json_data)
    # print 'json_data',json_data
    req = urllib2.Request(url, json_data)
    response = urllib2.urlopen(req)
    # return response
