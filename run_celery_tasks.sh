#!/usr/bin/env bash

/usr/local/bin/celery -A celery_tasks worker --loglevel=info &
