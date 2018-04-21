# -*- coding: utf-8 -*-
from django.shortcuts import render,render_to_response
from django.http import HttpResponseRedirect, HttpResponse
from django.contrib import auth
from accounts.models import *
from django.core import serializers

def schedule_detail(request):

    '''
    from celery_tasks import app
    import celery
    from celery.result import AsyncResult
    i = app.control.inspect()
    scheduled = i.scheduled()
    schedule_dict = []
    # print 'scheduled---->',scheduled
    if scheduled['celery@MacBookPro']:
        # print 'scheduled task id---->',scheduled['celery@MacBookPro'][0]['request']['id']
        # print 'scheduled task---->',scheduled['celery@MacBookPro'][0]
        for i in scheduled['celery@MacBookPro']:
            # print 'scheduled task:eta|args|id====>',i['eta'],'|',i['request']['args'],'|',i['request']['id']
            eta = i['eta']
            args = i['request']['args']
            id = i['request']['id']

            result = celery.result.AsyncResult(id)
            state = result.state
            schedule_dict.append(
                {'eta':eta,'args':args,'id':id,'state':state}
            )
            print 'id======================>',id

            # if created:
            #     # means you have created a new person
            #     sche_det = ScheduleDetails.objects.create(eta=eta, args=args, sid=id, state=state)
            #     sche_det.save()
            # else:
            #     # person just refers to the existing one
            #     models.ScheduleDetails.objects.filter(sid=id).update(state=state)

            try:
                obj = ScheduleDetails.objects.get(sid=id)
                # result = celery.result.AsyncResult(id)
                # state = result.state
                # models.ScheduleDetails.objects.filter(sid=id).update(state=state)
            except ScheduleDetails.DoesNotExist:
                obj = ScheduleDetails(eta=eta, args=args, sid=id, state=state)
                obj.save()

    else:
        print 'not exist request & id'




    # try:
    from celery.result import AsyncResult
    Schedule = models.ScheduleDetails.objects.all().values('sid')
    print 'Schedule', Schedule
    list_of_schedule = Schedule[::1]
    print 'list_of_m', list_of_schedule
    status = ''
    for schedule_element in list_of_schedule:
        # print schedule_element['sid']
        # result = celery.result.AsyncResult(schedule_element['sid'])
        # state = result.state
        newid = schedule_element['sid']

        status = celery.result.AsyncResult(newid).state
        result = celery.result.AsyncResult(newid).result
        print schedule_element['sid'], status,result
        # models.ScheduleDetails.objects.filter(sid=newid).update(state=state)
        ScheduleDetails.objects.filter(sid=newid).update(state=status)
        print 'upate sid'
    # except ScheduleDetails.DoesNotExist:
    #     print 'Does not exist id---->'

    schedule_dic = models.ScheduleDetails.objects.all()
    print 'schedule_dic---->', schedule_dic

    '''

    # CELERY_TIMEZONE = 'UTC'
    TIME_ZONE = 'Asia/Shanghai'
    from test_celery_result import tt
    tt()


    # return render_to_response('schedule_details.html',{'login_user': request.user, 'schedule_dic':schedule_dic })
    return render_to_response('schedule_details.html',{'login_user': request.user })