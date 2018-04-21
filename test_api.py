from flask import *
import os
#from rolelistdir import listRoles
import subprocess
import sys
sys.path.append("../")
from playbook_runner import PlaybookRunner
from pprint import pprint

ROLES_DIR = "roles"
IGNORED_FILES = [".md", ".j2", "Vagrantfile", "meta", ".cfg", "handlers", "defaults", "vars", "LICENCE", "files", "templates", "spec", "Rakefile", "Gemfile"]
app = Flask(__name__)

@app.route('/', methods = ['GET'])
def index():
    """Welcome to Ansible API"""
    return jsonify({'hello': 'Hello world'})

@app.route('/api/', methods = ['GET'])
def apiIndex():
    """These are the available APIS."""
    func_list = {}
    for rule in app.url_map.iter_rules():
        if rule.endpoint != 'static':
            func_list[rule.rule] = app.view_functions[rule.endpoint].__doc__
    return jsonify(func_list)

@app.route('/api/run/', methods = ['GET','POST'])
def runPlay():
    """Run an Ansible Playbook"""
#     if request.method == 'POST':
#         p = request.values.get("play")
#         r = request.values.get("role")
#         h = request.values.get("host")
#         #process = subprocess.Popen(["/usr/bin/ansible-playbook", "--limit=" + str(h), os.path.join(ROLES_DIR,r,p)])
#         process = subprocess.Popen(["/usr/bin/python", "adhoc.py"])
#         r = jsonify({'RunningPlay': {'name': p}})
#         #return r
#         print type(process)
#         print 'process------>',process
#         return process
#     else:
#        return '''To use this API
# curl --request POST \
#   --url http://127.0.0.1:8080/api/run/ \
#   --data 'role=test' \
#   --data 'play=hello.yml' \
#   --data 'host=localhost'
#        '''
    host_dict = {
        "group1": {
            'hosts': ["192.168.51.167", "192.168.51.178"],
            'vars': {'host': 'var_value'}
        }
    }

    runner = PlaybookRunner(
        # playbook_path="two_play.yml",
        playbook_path="debug.yml",
        hosts=host_dict,
    )

    try:
        results = runner.run()
        pprint(results)
    except Exception as e:
        print e

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)