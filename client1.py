# -*- coding: utf-8 -*-
import threading,time
from threading import Timer
from datetime import datetime,timedelta
import celery
from celery_tasks import task2

# res1 = task1.add.apply_async(args=[3, 8], countdown=1)                           #  task1.add.delay(3, 8)
# res2 = task2.multiply.apply_async(args=[99, 100], eta=datetime(2018,02,8,1,50))   #  task2.multiply.delay(4, 9)
res1 = task2.multiply.apply_async(args=[1, 100], eta=datetime.utcnow() + timedelta(seconds=60))
res2 = task2.multiply.apply_async(args=[99, 100], eta=datetime.utcnow() + timedelta(seconds=60))
print '=================================================================='
# print 'Id\tTask_Id\t\t\t\t\tResult\tState'
print 'Id\tTask_Id\t\t\t\t\tState\tResult'
print '=================================================================='
# print '1\t',res1.id,'\t',res1.get()
# print '2\t',res2.id,'\t',res2.get
# (),res2.state
print '1\t',res1.id,'\t',res1.state,res1.get()
print '2\t',res2.id,'\t',res2.state,res2.get()

# grab the AsyncResult
# result = celery.result.AsyncResult(res2.id)

# def res_output(res):
#     # print the task id
#     # print res.task_id
#     # d0931eb5-b41d-40c9-9c88-5b9fc7dadc1b
#
#     # print the AsyncResult's status
#     # print res.status
#     # SUCCESS
#
#     # print the result returned
#     # print res.result
#     # 4
#
#     if res.status == 'SUCCESS':
#         print res.result
#         return res.status
#
#
# print 'Start detect state'
# while True:
#     time.sleep(0.1)
#     re = res_output(result)
#     if re == 'SUCCESS':
#         print re
#         break