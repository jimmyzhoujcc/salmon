#!/usr/bin/env python
# -*- coding=utf-8 -*-
# Base on Ansible2.2.0 API
# Author:   Sixfans
# Date:     2018-03-02

import json
from collections import namedtuple
from ansible.parsing.dataloader import DataLoader
from ansible.vars import VariableManager
from ansible.playbook.play import Play
from ansible.executor.task_queue_manager import TaskQueueManager
from ansible.plugins.callback import CallbackBase
import ansible.constants as C
from ansible.errors import AnsibleError
from ansible.utils.vars import load_extra_vars
from ansible.utils.vars import load_options_vars
# from myinventory import MyInventory
from ansible.inventory import Inventory,Host,Group

class MyInventory(Inventory):
    """
    this is my ansible inventory object.
    """

    def __init__(self, resource, loader, variable_manager):
        """
        resource的数据格式是一个列表字典，比如
            {
                "group1": {
                    "hosts": [{"hostname": "10.0.0.0", "port": "22", "username": "test", "password": "pass"}, ...],
                    "vars": {"var1": value1, "var2": value2, ...}
                }
            }
                                         如果你只传入1个列表，这默认该列表内的所有主机属于my_group组,比如
            [{"hostname": "10.0.0.0", "port": "22", "username": "test", "password": "pass"}, ...]
        """
        self.resource = resource
        self.inventory = Inventory(loader=loader, variable_manager=variable_manager, host_list=[])
        self.dynamic_inventory()

    def add_dynamic_group(self, hosts, groupname, groupvars=None):
        """
            add hosts to a group
        """
        my_group = Group(name=groupname)

        # if group variables exists, add them to group
        if groupvars:
            for key, value in groupvars.iteritems():
                my_group.set_variable(key, value)

                # add hosts to group
        for host in hosts:
            # set connection variables
            hostname = host.get("hostname")
            hostip = host.get('ip', hostname)
            hostport = host.get("port")
            username = host.get("username")
            password = host.get("password")
            ssh_key = host.get("ssh_key")
            my_host = Host(name=hostname, port=hostport)
            my_host.set_variable('ansible_ssh_host', hostip)
            my_host.set_variable('ansible_ssh_port', hostport)
            my_host.set_variable('ansible_ssh_user', username)
            my_host.set_variable('ansible_ssh_pass', password)
            my_host.set_variable('ansible_ssh_private_key_file', ssh_key)

            # set other variables
            for key, value in host.iteritems():
                if key not in ["hostname", "port", "username", "password"]:
                    my_host.set_variable(key, value)
                    # add to group
            my_group.add_host(my_host)

        self.inventory.add_group(my_group)

    def dynamic_inventory(self):
        """
            add hosts to inventory.
        """
        if isinstance(self.resource, list):
            self.add_dynamic_group(self.resource, 'default_group')
        elif isinstance(self.resource, dict):
            for groupname, hosts_and_vars in self.resource.iteritems():
                self.add_dynamic_group(hosts_and_vars.get("hosts"), groupname, hosts_and_vars.get("vars"))

# Debug flag: debug="false"|"true"
debug="false"

__all__ = ["Runner"]

# free to report host to `known_hosts` file.
C.HOST_KEY_CHECKING = False

# class Options
Options = namedtuple("Options", ['connection',
                                 'module_path',
                                 'private_key_file',
                                 'remote_user',
                                 'timeout',
                                 'forks',
                                 'become',
                                 'become_method',
                                 'become_user',
                                 'check',
                                 'extra_vars',]
                    )

class ResultCallback(CallbackBase):
    """
    Custom Callback
    """
    def __init__(self):
        self.host_ok = {}
        self.host_unreachable = {}
        self.host_failed = {}

    def v2_runner_on_unreachable(self, result):
        for remove_key in ('changed', 'invocation'):
            if remove_key in result._result:
                del result._result[remove_key]
        data = "{host} | UNREACHABLE! => {stdout}".format(host=result._host.get_name(),
                                                          stdout=json.dumps(result._result, indent=4))
        if debug == "true":
            print data
        self.host_unreachable[result._host.get_name()] = result

    def v2_runner_on_ok(self, result, *args, **kwargs):
        for remove_key in ('changed', 'invocation'):
            if remove_key in result._result:
                del result._result[remove_key]
        if result._result.has_key('rc') and result._result.has_key('stdout'):
            data = "{host} | SUCCESS | rc={rc} >> \n{stdout}".format(host=result._host.get_name(),
                                                                                     rc=result._result.get('rc'),
                                                                                     stdout=result._result.get(
                                                                                        'stdout'))
        else:
            data = "{host} | SUCCESS >> {stdout}".format(host=result._host.get_name(),
                                                                         stdout=json.dumps(result._result, indent=4))
        if debug == "true":
            print data
        self.host_ok[result._host.get_name()] = result

    def v2_runner_on_failed(self, result, *args, **kwargs):
        for remove_key in ('changed', 'invocation'):
            if remove_key in result._result:
                del result._result[remove_key]
        if result._result.has_key('rc') and result._result.has_key('stdout'):
            data = "{host} | FAILED | rc={rc} >> \n{stdout}".format(host=result._host.get_name(),
                                                                    rc=result._result.get('rc'),
                                                                    stdout=result._result.get('stdout'))
        else:
            data = "{host} | FAILED! => {stdout}".format(host=result._host.get_name(),
                                                         stdout=json.dumps(result._result, indent=4))
        if debug == "true":
            print data
        self.host_failed[result._host.get_name()] = result
    # ** end ResultCallback() **

class Runner(object):
    """
    This is a General object for parallel execute modules.
    Base on Ansible 2.2.0
    Arguments:
        - inventory         # list object,format:[ip1,ip2,ip3...],default_path:/etc/ansible/hosts
        - module_name       # ansible module
        - module_args       # module arguments
        - forks             # default fork 5
        - timeout           # default 10s
        - pattern           # match pattern,hostname,default:all
        - remote_user       # default:root
        - private_key_files
    """
#==============================================================
    """
    def __init__(
        self,
        hosts=C.DEFAULT_HOST_LIST,
        module_name=C.DEFAULT_MODULE_NAME,    # * command
        module_args=C.DEFAULT_MODULE_ARGS,    # * 'cmd args'
        forks=C.DEFAULT_FORKS,                # 5
        timeout=C.DEFAULT_TIMEOUT,            # SSH timeout = 10s
        pattern="all",                        # all
        remote_user=C.DEFAULT_REMOTE_USER,    # root
        module_path=None,                     # dirs of custome modules
        connection_type="smart",
        become=None,
        become_method=None,
        become_user=None,
        check=False,
        passwords=None,
        extra_vars = None,
        private_key_file=None
    ):

        #init ansible arguments

        self.pattern = pattern
        self.variable_manager = VariableManager()
        self.loader = DataLoader()
        self.module_name = module_name
        self.module_args = module_args
        self.check_module_args()
        self.gather_facts = 'no'
        self.resultcallback = ResultCallback()
        self.options = Options(
            connection=connection_type,
            timeout=timeout,
            module_path=module_path,
            forks=forks,
            become=become,
            become_method=become_method,
            become_user=become_user,
            check=check,
            remote_user=remote_user,
            extra_vars=extra_vars or [],
            private_key_file=private_key_file,
        )

        self.variable_manager.extra_vars = load_extra_vars(loader=self.loader, options=self.options)
        self.variable_manager.options_vars = load_options_vars(self.options)

        self.passwords = passwords or {}
        self.inventory = MyInventory(host_list=hosts)
        self.variable_manager.set_inventory(self.inventory)

        # ansible ad-hoc (it means not include playbook)
        # module_name: ansible module_name
        # module_args: ansible module_args
        self.play_source = dict(
            name="ad-hoc",
            hosts=self.pattern,
            gather_facts=self.gather_facts,
            tasks=[dict(action=dict(
                module=self.module_name, args=self.module_args))]
        )

        self.play = Play().load(
            self.play_source, variable_manager=self.variable_manager,
            loader=self.loader)

        self.runner = TaskQueueManager(
            inventory=self.inventory,
            variable_manager=self.variable_manager,
            loader=self.loader,
            options=self.options,
            passwords=self.passwords,
            stdout_callback=self.resultcallback
        )
        # ** end __init__() **

    def run_adhoc(self):
        if not self.inventory.list_hosts("all"):
            raise AnsibleError("Inventory is empty.")

        if not self.inventory.list_hosts(self.pattern):
            raise AnsibleError(
                "pattern: %s  dose not match any hosts." % self.pattern)

        try:
            self.runner.run(self.play)
        except Exception as e:
            raise Exception(e)
        finally:
            if self.runner:
                self.runner.cleanup()
            if self.loader:
                self.loader.cleanup_all_tmp_files()
    # ** end run() **

    def check_module_args(self):
        if self.module_name in C.MODULE_REQUIRE_ARGS and not self.module_args:
            err = "No argument passed to '%s' module." % self.module_name
            raise AnsibleError(err)
    # ** end check_module_args() **

        """
#===============================================================
    def __init__(self, resource, *args, **kwargs):
        self.resource = resource
        self.inventory = None
        self.variable_manager = None
        self.loader = None
        self.options = None
        self.passwords = None
        self.callback = None
        self.__initializeData(kwargs)
        self.results_raw = {}

    def __initializeData(self, kwargs):
        """ 初始化ansible """
        Options = namedtuple('Options', ['connection', 'module_path', 'forks', 'timeout', 'remote_user',
                                         'ask_pass', 'private_key_file', 'ssh_common_args', 'ssh_extra_args',
                                         'sftp_extra_args',
                                         'scp_extra_args', 'become', 'become_method', 'become_user', 'ask_value_pass',
                                         'verbosity',
                                         'check', 'listhosts', 'listtasks', 'listtags', 'syntax'])

        self.variable_manager = VariableManager()
        self.loader = DataLoader()
        self.options = Options(connection='smart', module_path=None, forks=100, timeout=10,
                               remote_user=kwargs.get('remote_user', 'root'), ask_pass=False, private_key_file=None,
                               ssh_common_args=None,
                               ssh_extra_args=None, sftp_extra_args=None, scp_extra_args=None, become=None,
                               become_method=kwargs.get('become_method', 'sudo'),
                               become_user=kwargs.get('become_user', 'root'),
                               verbosity=kwargs.get('verbosity', None), check=False, listhosts=False,
                               listtasks=False, listtags=False, syntax=False, ask_value_pass=False, )

        self.passwords = dict(sshpass=None, becomepass=None)
        self.inventory = MyInventory(self.resource, self.loader, self.variable_manager).inventory
        self.variable_manager.set_inventory(self.inventory)
        # -------------------------------------------------------

    def run_adhoc(self, host_list, module_name, module_args):
        play_source = dict(
            name="adhoc",
            hosts=host_list,
            gather_facts='no',
            tasks=[dict(action=dict(module=module_name, args=module_args))]
        )

        play = Play().load(play_source, variable_manager=self.variable_manager, loader=self.loader)
        self.callback = ResultCallback()
        try:
            tqm = TaskQueueManager(
                inventory=self.inventory,
                variable_manager=self.variable_manager,
                loader=self.loader,
                options=self.options,
                passwords=self.passwords,
            )

            tqm._stdout_callback = self.callback
            tqm.run(play)
        except Exception as err:
            raise Exception(err)
        finally:
            if tqm is not None:
                tqm.cleanup()

    def get_adhoc_result(self):
        self.results_raw = {'success': {}, 'failed': {}, 'unreachable': {}}
        for host, result in self.callback.host_ok.items():
            self.results_raw['success'][host] = result._result

        for host, result in self.callback.host_failed.items():
            self.results_raw['failed'][host] = result._result

        for host, result in self.callback.host_unreachable.items():
            self.results_raw['unreachable'][host] = result._result

        return json.dumps(self.results_raw,indent=4)

        def handle_cmdb_data(self,data):
        '''处理setup返回结果方法'''
        data_list = []
        for k,v in json.loads(data).items():
            if k == "success":
                for x,y in v.items():
                    cmdb_data = {}
                    data = y.get('ansible_facts')
                    disk_size = 0
                    cpu = data['ansible_processor'][-1]
                    for k,v in data['ansible_devices'].items():
                        if k[0:2] in ['sd','hd','ss','vd']:
                            disk = int((int(v.get('sectors')) * int(v.get('sectorsize')))/1024/1024)
                            disk_size = disk_size + disk
                    cmdb_data['serial'] = data['ansible_product_serial'].split()[0]
                    cmdb_data['ip'] = x
                    cmdb_data['cpu'] = cpu.replace('@','')
                    cmdb_data['ram_total'] = int(data['ansible_memtotal_mb'])
                    cmdb_data['disk_total'] = int(disk_size)
                    cmdb_data['system'] =  data['ansible_distribution'] + ' ' + data['ansible_distribution_version'] + ' ' + data['ansible_userspace_bits']
                    cmdb_data['model'] = data['ansible_product_name'].split(':')[0]
                    cmdb_data['cpu_number'] = data['ansible_processor_count']
                    cmdb_data['vcpu_number'] = data['ansible_processor_vcpus']
                    cmdb_data['cpu_core'] = data['ansible_processor_cores']
                    cmdb_data['hostname'] = data['ansible_hostname']
                    cmdb_data['kernel'] = str(data['ansible_kernel'])
                    cmdb_data['manufacturer'] = data['ansible_system_vendor']
                    if data['ansible_selinux']: 
                        cmdb_data['selinux'] = data['ansible_selinux'].get('status')
                    else: 
                        cmdb_data['selinux'] = 'disabled'
                    cmdb_data['swap'] = int(data['ansible_swaptotal_mb']) 
                    #获取网卡资源
                    nks = []
                    for nk in data.keys():
                        if re.match(r"^ansible_(eth|bind|eno|ens|em)\d+?",nk):
                            device = data.get(nk).get('device')
                            try:
                                address = data.get(nk).get('ipv4').get('address')
                            except:
                                address = 'unkown'
                            macaddress = data.get(nk).get('macaddress')
                            module = data.get(nk).get('module')
                            mtu = data.get(nk).get('mtu')
                            if data.get(nk).get('active'):active = 1
                            else:active = 0
                            nks.append({"device":device,"address":address,"macaddress":macaddress,"module":module,"mtu":mtu,"active":active})
                    cmdb_data['status'] = 0
                    cmdb_data['nks'] = nks
                    data_list.append(cmdb_data)    
            elif  k == "unreachable":
                for x,y in v.items():
                    cmdb_data = {}
                    cmdb_data['status'] = 1
                    cmdb_data['ip'] = x
                    data_list.append(cmdb_data)
        if data_list:
            return  data_list
        else:
            return False
