#!/usr/bin/env python
# coding: utf-8

# A restful HTTP API for ansible by tornado
# Base on ansible 2.3.0.0
# Author: Jimmy Zhou

import sys,time
import urllib
import urllib2
import json
from salmon.settings import server

def post_json(data):
    stime = time.time()
  
    #url = 'http://10.6.97.217:8765/command'
    url = 'http://'+server+':8765/command'

    # data = {'n':'task#id@project','m':'shell','a':"ifconfig eth0",'t':'all','s':'','r':'True'}
    # data = {"n":"playbook_test#100000@project","h":"all","f":"/tmp/ansible-api/echo.yml","s":"1","c":50}
    json_data = json.dumps(data)
    print 'post_json_data===>',json_data
    req = urllib2.Request(url,json_data)
    response = urllib2.urlopen(req)
    etime = time.time()
    print '[duration]:', etime - stime,'s'
    return response

def post_playbook(json_data):
    stime = time.time()
    #url = 'http://10.6.97.217:8765/playbook'
    url = 'http://'+server+':8765/playbook'
    # data = {"n":"playbook_test#100000@project","h":"all","f":"/tmp/ansible-api/echo.yml","s":"1","c":50}
    json_data = json.dumps(json_data)
    print 'post_playbook_json_data===>',json_data
    req = urllib2.Request(url, json_data)
    response = urllib2.urlopen(req)
    etime = time.time()
    print '[duration]:', etime - stime,'s'
    return response


if __name__ == "__main__":
#     data = {"n": "playbook_test#100000@project", "h": "all", "f": "/tmp/ansible-api/echo.yml", "s": "1", "c": 50}
    data = {'n': 'task#100000@project', 'm': 'shell', 'a': "ifconfig eth0", 't': 'all', 's': '', 'r': 'True'}
    post = post_json(data)
    response = json.load(post)
    print response
