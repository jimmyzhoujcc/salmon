# -*- coding: utf-8 -*-
# Description:  Inspect celery task which is scheduled
# Author: Jimmy

from celery_tasks import app

i=app.control.inspect()
scheduled=i.scheduled()
eta_list = []
args_list = []
id_list = []
# print 'scheduled---->',scheduled
if scheduled['celery@MacBookPro']:
    # print 'scheduled task id---->',scheduled['celery@MacBookPro'][0]['request']['id']
    # print 'scheduled task---->',scheduled['celery@MacBookPro'][0]
    for i in scheduled['celery@MacBookPro']:
        # print 'scheduled task:eta|args|id====>',i['eta'],'|',i['request']['args'],'|',i['request']['id']
        eta_list.append(i['eta'])
        args_list.append(i['request']['args'])
        id_list.append(i['request']['id'])
else:
    print 'scheduled task id ----> None'


print 'eta_list---->',eta_list
print 'args_list---->',args_list
print 'id_list----->',id_list
# print 'scheduled task id---->',scheduled['celery@MacBookPro']['request']['id']
# def res_output(res):
    # print the task id
    # print res.task_id
    # d0931eb5-b41d-40c9-9c88-5b9fc7dadc1b

    # print the AsyncResult's status
    # print res.status
    # SUCCESS

    # print the result returned
    # print res.result
    # 4

    # if res.status == 'SUCCESS':
    #     print res.result
    #     return res.status


