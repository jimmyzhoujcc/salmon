#!/usr/bin/env python
# coding: utf-8

# A restful HTTP API for django rest
# Author: Jimmy Zhou

import sys
import urllib
import urllib2
import json

url_hostgroups = 'http://127.0.0.1:8000/api/hostgroups/'

def get(url):
    req = urllib2.Request(url_hostgroups)
    response = urllib2.urlopen(req)
    return response

if __name__ == "__main__":
    hostgroups = get(url_hostgroups)
    hostgroups_list =  json.loads(hostgroups.read())
    print 'hostgroups---->',hostgroups_list
    for hg in hostgroups_list:
        print hg['name'],hg['bind_hosts']