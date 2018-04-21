#!/usr/bin/env python
# coding: utf-8

# A restful HTTP API for django rest
# Author: Jimmy Zhou

import sys
import urllib
import urllib2
import json
import requests

url_post_asset = 'http://127.0.0.1:8000/api/assets/'
url_post_server = 'http://127.0.0.1:8000/api/servers/'

'''
curl -X post http://127.0.0.1:8000/api/assets/ \
-u jcc:1234.com \
-d '{"assets_type":"server","sn":"sn004","buy_time":"2018-03-05","expire_date":"2020-03-04","management_ip":"192.168.100.4","manufacturer":"Dell","provider":"Dell Inc.","model":"Poweredge R730","status":0,"put_zone":1,"group":1,"project":1}' \
-H 'content-type: Application/json'

curl -X post http://127.0.0.1:8000/api/servers/ \
-u jcc:1234.com -d '{"ip":"192.168.100.2","hostname":"192.168.100.2","username":"root","passwd":"!QAZ2wsx","keyfile":0,"port":"22","cpu":null,"cpu_number":null,"vcpu_number":null,"cpu_core":null,"disk_total":null,"ram_total":null,"kernel":null,"selinux":null,"swap":null,"raid":null,"system":null,"assets":2}' \
-H 'content-type: application/json'

import requests
url = 'http://opencenter.com/myview/bandwidth-origin'                           ##定义http请求的地址，即1
headers = {'Accept': "application/xml",'Date':'Fri, 14 Apr 2017 02:07:17 GMT'}  ##定义header头，用dict方式定义，即3
data = {'channel': 'vod.tv.cn', 'dataformat': 'json','date':'2017-04-13'}       ##定义参数，同样用dict定义，即4
res = requests.post(url, data=data, headers=headers, auth=('tv2', 'sign'))      ##post请求，且认证user=‘tv2’，password=‘sign’
print res.text                                                                  ##就能看到打印结果了。
'''
headers = {'Accept': "application/json"}
asset_data={"assets_type":"server",
      "sn":"sn005",
      "buy_time":"2018-03-05",
      "expire_date":"2020-03-04",
      "management_ip":"192.168.100.5",
      "manufacturer":"Dell",
      "provider":"Dell Inc.",
      "model":"Poweredge R730",
      "status":0,
      "put_zone":1,
      "group":1,
      "project":1
      }

server_data={"ip":"192.168.100.3",
      "hostname":"192.168.100.3",
             "username":"root",
             "passwd":"!QAZ2wsx",
             "keyfile":0,
             "port":"22",
             "assets":23}
#response = requests.post(url_post_asset, data=asset_data, headers=headers, auth=('jcc', '1234.com'))
#print response.text

response = requests.post(url_post_server, data=server_data, headers=headers, auth=('jcc', '1234.com'))
print response.text