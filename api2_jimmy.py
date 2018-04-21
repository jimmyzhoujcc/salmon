#!/usr/bin/env python
import sys
import json
from collections import namedtuple
from ansible.parsing.dataloader import DataLoader
from ansible.vars.manager import VariableManager
from ansible.inventory.manager import InventoryManager
from ansible.playbook.play import Play
from ansible.executor.task_queue_manager import TaskQueueManager
from ansible.plugins.callback import CallbackBase

Ansible_Host = sys.argv[1]
Ansible_Module = sys.argv[2]
Ansible_Args = sys.argv[3]


class ResultCallback(CallbackBase):
    """A sample callback plugin used for performing an action as results come in

    If you want to collect all results into a single object for processing at
    the end of the execution, look into utilizing the ``json`` callback plugin
    or writing your own custom callback plugin
    """
    def v2_runner_on_ok(self, result, **kwargs):
    # def v2_runner_on_ok(self, result):
        """Print a json representation of the result

        This method could store the result in an instance attribute for retrieval later
        """
        host = result._host
	"""
	This will print json result, if you need
	"""

        if result._result.get('ansible_facts', False):
            msg = result._result.get('ansible_facts')
            print json.dumps(msg,indent=4)
            # print(json.dumps({host.name: result._result}, indent=4))
        elif result._result.get('changed', False):
            result_dict = result._result
            u_result_list = result_dict['stdout_lines']
            result_list = "\n".join(u_result_list)
            print result_list

Options = namedtuple('Options', ['connection', 'module_path', 'forks', 'become', 'become_method', 'become_user', 'check', 'diff'])
# initialize needed objects
loader = DataLoader()
options = Options(connection='local', module_path='/path/to/mymodules', forks=100, become=None, become_method=None, become_user=None, check=False,
                  diff=False)
passwords = dict(vault_pass='secret')

# Instantiate our ResultCallback for handling results as they come in
results_callback = ResultCallback()

# create inventory and pass to var manager
inventory = InventoryManager(loader=loader, sources=['localhost'])
variable_manager = VariableManager(loader=loader, inventory=inventory)

# create play with tasks
play_source =  dict(
        name = "Ansible Play",
        #hosts = 'localhost',
        hosts = Ansible_Host,
        gather_facts = 'no',
        tasks = [
            # dict(action=dict(module=Ansible_Module, args=Ansible_Args), register='shell_out'),
            dict(action=dict(module=Ansible_Module, args=Ansible_Args), register='shell_out'),
            #dict(action=dict(module='shell', args='ls'), register='shell_out'),
            #dict(action=dict(module='debug', args=dict(msg='{{shell_out.stdout}}')))
         ]
    )
play = Play().load(play_source, variable_manager=variable_manager, loader=loader)

# actually run it
tqm = None
try:
    tqm = TaskQueueManager(
              inventory=inventory,
              variable_manager=variable_manager,
              loader=loader,
              options=options,
              passwords=passwords,
              stdout_callback=results_callback,  # Use our custom callback instead of the ``default`` callback plugin
          )
    result = tqm.run(play)
finally:
    if tqm is not None:
        tqm.cleanup()

"""
example:    python api2_jimmy.py localhost shell "cat /etc/hosts | grep -v '#' | grep -v '^\$'"
            python api2_jimmy.py localhost setup "filter=ansible_en0"
"""
