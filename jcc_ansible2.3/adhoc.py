#!/usr/bin/env python
# -*- coding=utf-8 -*-

"""
# Usage: python adhoc.py '{"hosts": [{"hostname": "192.168.110.29", "port": "22", "username": "root","password": "1234.com"},{"hostname": "192.168.110.30", "port": "22", "username": "root","password": "123.com"}],"module_name":"shell","module_args":"hostname && uname"}'
# Usage: python adhoc.py '{"hosts": [{"hostname": "192.168.51.183", "port": "22", "username": "root","password": "1234.com"},{"hostname": "192.168.51.167", "port": "22", "username": "root","password": "123.com"}],"module_name":"shell","module_args":"hostname && uname"}'
"result_json_data": {
    "failed": {},
    "success": {
        "192.168.110.29": {
            "_ansible_parsed": true,
            "stderr_lines": [],
            "cmd": "hostname && uname",
            "end": "2018-02-27 06:19:17.663178",
            "_ansible_no_log": false,
            "stdout": "node1\nLinux",
            "rc": 0,
            "start": "2018-02-27 06:19:17.659626",
            "stderr": "",
            "delta": "0:00:00.003552",
            "stdout_lines": [
                "node1",
                "Linux"
            ]
        },
        "192.168.110.30": {
            "_ansible_parsed": true,
            "stderr_lines": [],
            "cmd": "hostname && uname",
            "end": "2018-02-27 06:19:17.160229",
            "_ansible_no_log": false,
            "stdout": "node5\nLinux",
            "rc": 0,
            "start": "2018-02-27 06:19:17.156436",
            "stderr": "",
            "delta": "0:00:00.003793",
            "stdout_lines": [
                "node5",
                "Linux"
            ]
        }
    },
    "unreachable": {}
}
"""

import sys
import json
from runner import Runner
from pprint import pprint

if __name__ == "__main__":
    """
        Base on Ansible 2.2.0
        Arguments:
            1. host_dict         # dict object,pls see below example
            2. module_name       # ansible module
            3. module_args       # module arguments

        host dict example:
        host_dict = {
        "group1": {
        #'hosts': ["192.168.51.167", "192.168.51.178","192.168.51.183"],
        'hosts': hosts_list,
        'vars': {'host': 'var_value'}
        }
    }
    """
    sys.path.append("../")
    #data = sys.argv[1]
    #host_json = json.dumps(data)
    host_json = json.loads(sys.argv[1])
    #host_dict = [
    #    {"hostname": "192.168.110.13", "port": "22", "username": "root", "password": "123.com"},
    #    {"hostname": "192.168.110.29", "port": "22", "username": "root", "password": "1234.com"},
    #    {"hostname": "192.168.110.30", "port": "22", "username": "root", "password": "123.com"},
    #]
    host_list = ["192.168.51.167","192.168.51.178","192.168.51.183"]
    #host_json={"hosts": [{"hostname": "192.168.110.29", "port": "22", "username": "root","password": "1234.com"},{"hostname": "192.168.110.30", "port": "22", "username": "root","password": "123.com"}],"module_name":"shell","module_args":"hostname && uname"}
    host_dict = host_json['hosts']
    module_name = host_json['module_name']
    module_args = host_json['module_args']
    runner = Runner(resource=host_dict)
    runner.run_adhoc(host_list, module_name, module_args)
    result_json_data = runner.get_adhoc_result()
    print '"result_json_data":',result_json_data
