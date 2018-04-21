# -*- coding: utf-8 -*-
from datetime import datetime,timedelta
import pytz
import json
from celery_tasks import task,task2

def run_task2(arg,time):

    print 'arg[n]',arg['n']
    time_list = time.split('/')
    print 'time_list=====>', time_list
    print 'year:', time_list[0]
    print  'month:', time_list[1]
    print 'day:', time_list[2]
    print 'hour:', int(time_list[3])
    print 'minute:', int(time_list[4])

    year = time_list[0]
    month = time_list[1]
    day = time_list[2]
    hour = str(int(time_list[3]))
    minute = time_list[4]
    # etime = datetime(int(time_list[0]), int(time_list[1]), int(time_list[2]), int(time_list[3]), int(time_list[4]))
    dt = datetime(int(time_list[0]), int(time_list[1]), int(time_list[2]), int(time_list[3]), int(time_list[4]))
    utc = pytz.timezone('UTC')
    shanghai = pytz.timezone('Asia/Shanghai')
    dt_shanghai = shanghai.localize(dt)
    dt_utc = utc.normalize(dt_shanghai)
    print 'dt_shangahi,dt_utc',dt_shanghai,dt_utc


    # res2 = task2.multiply.apply_async(args=[4, 9], eta=datetime(2018,2,8,12,50,0))
    res2 = task2.multiply.apply_async(args=[4, 9], eta=datetime.utcnow() + timedelta(seconds=1))
    # res2 = task2.multiply.apply_async(args=[1000, 19], eta=etime)
    print '======================================================='
    print 'Id\tTask_Id\t\t\t\t\tResult\t'
    print '======================================================='
    print '1\t',res2.id,'\t',res2.get(),res2.state
    print '======================================================='
    # return res2.get()


    para = {"n":arg['n'],"m":arg['m'],"a":arg['a'],"t":arg['t']}
    print 'json_dumps para',json.dumps(para)
    # res = task.post_json.apply_async(kwargs={"n":arg['n'],"m":arg['m'],"a":arg['a'],"t":arg['t']},eta=etime)
    res = task.post_json.apply_async(kwargs=para,eta=dt_shanghai)
    # res = task.post_json.apply_async(kwargs=para)
    print '======================================================='
    print 'Id\tTask_Id\t\t\t\t\tResult'
    print '======================================================='
    # print '1\t', res.id, '\t', res.get()
    print '======================================================='
    # return res.get()
    return res.id