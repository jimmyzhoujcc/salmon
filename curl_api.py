#!/usr/bin/env python
# coding: utf-8

# A restful HTTP API for ansible by tornado
# Base on ansible 2.3.0.0
# Author: Jimmy Zhou

import sys
import urllib
import urllib2
import json


def post_json(data):
    # url = 'http://192.168.51.167:8765/command'
    url = 'http://192.168.110.208:8080/api/run/'
    data = 'host=192.168.110.208,192.168.110.207,192.168.110.211'
    # data = {'n':'task#id@project','m':'shell','a':"ifconfig eth0",'t':'all','s':'','r':'True'}
    # data = {"n":"playbook_test#100000@project","h":"all","f":"/tmp/ansible-api/echo.yml","s":"1","c":50}
    json_data = json.dumps(data)
    # print 'json_data',json_data
    # req = urllib2.Request(url,json_data)
    req = urllib2.Request(url,data)
    response = urllib2.urlopen(req)
    return response

def post_playbook(json_data):
    # url = 'http://192.168.109.174:8765/command'
    # url = 'http://192.168.109.174:8765/playbook'
    url = 'http://192.168.51.167:8765/playbook'
    # data = {'n':'task#id@project','m':'shell','a':"ifconfig eth0",'t':'all','s':'','r':'True'}
    # data = {'n':'task#id@project','m':'shell','a':"ifconfig eth0",'t':'all','s':'','r':'True'}
    # data = {"n":"playbook_test#100000@project","h":"all","f":"/tmp/ansible-api/echo.yml","s":"1","c":50}
    json_data = json.dumps(json_data)
    # print 'json_data',json_data
    req = urllib2.Request(url, json_data)
    response = urllib2.urlopen(req)
    return response


if __name__ == "__main__":
#     data = {"n": "playbook_test#100000@project", "h": "all", "f": "/tmp/ansible-api/echo.yml", "s": "1", "c": 50}
#     data = {'n': 'task#100000@project', 'm': 'shell', 'a': "ifconfig eth0", 't': 'all', 's': '', 'r': 'True'}
    data = sys.argv[1]
    # data="host=192.168.110.95,192.168.110.81,192.168.110.82"
    # print data
    response = post_json(data)
    # post = post_json(data)
    # response = json.load(post)
    # print type(response)
    a=''
    for re in response:
        a += re

    aa=a.replace("'","\"")
    b="'"+aa[:-1]+"'"
    print 'b------>',b
    # jo = json.loads(b)
    # print re_dict
#     if response['rc'] == 0:
#         for host_res in response['detail']:
#             print '[success result]:',host_res,'\n<===============success===============> \n',response['detail'][host_res][0]['stdout']
#     elif response['rc'] != 0:
#         print response
#         for host_res in response['detail']:
#             if response['detail'][host_res][0]['rc'] == 0:
#                 print '[success result]:',host_res,'\n<===============success===============> \n', response['detail'][host_res][0]['stdout']
#             if response['detail'][host_res][0]['rc'] == 1:
#                 if response['detail'][host_res][0].has_key('stderr'):
#                     print '[error result]:',host_res,'\n<===============error===============> \n', response['detail'][host_res][0]['stderr']
#                 elif response['detail'][host_res][0].has_key('msg'):
#                     print '[error result]:',host_res,'\n<===============message===============> \n', response['detail'][host_res][0]['msg']
#                 else:
#                     print '[error result]:',host_res,'\n<===============others===============> \n', response['detail'][host_res][0]