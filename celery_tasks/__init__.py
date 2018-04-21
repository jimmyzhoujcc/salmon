# -*- coding: utf-8 -*-
from celery import Celery
app = Celery('salmon')                                    # Celery instance
app.config_from_object('celery_tasks.celeryconfig')       # load configuration module by Celery instance