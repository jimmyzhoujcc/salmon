# -*- coding: utf-8 -*-
from __future__ import absolute_import
from celery import Celery, platforms
from salmon.settings import server

platforms.C_FORCE_ROOT = True
#BROKER_URL = 'redis://10.6.97.217:6379/0'
BROKER_URL = 'redis://'+server+':6379/0'

#CELERY_RESULT_BACKEND = 'redis://10.6.97.217:6379/0'
CELERY_RESULT_BACKEND = 'redis://'+server+':6379/0'

CELERY_TIMEZONE='Asia/Shanghai'
CELERY_IMPORTS = (
    'celery_tasks.task',
    'celery_tasks.task2',
)
