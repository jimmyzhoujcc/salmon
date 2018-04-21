from __future__ import absolute_import
from celery_tasks import app
import celery
import time
from celery.result import AsyncResult

def tt():
    TIME_ZONE = 'Asia/Shanghai'
    print time.asctime()
    print 'd2046170-cc6a-4331-bb20-4102223faaf7',celery.result.AsyncResult('d2046170-cc6a-4331-bb20-4102223faaf7').state
    print '82e4c088-bd38-4088-a846-a291e5f4fead',celery.result.AsyncResult('82e4c088-bd38-4088-a846-a291e5f4fead').state
    print '8e938ffe-d506-4da9-a593-389ef662fbea',celery.result.AsyncResult('8e938ffe-d506-4da9-a593-389ef662fbea').state
    print '0dbcc819-1aca-49dd-a087-68b672f4448e',celery.result.AsyncResult('0dbcc819-1aca-49dd-a087-68b672f4448e').state
    print '3fe251c9-b535-40bc-8b9e-d5f0f9c6f370',celery.result.AsyncResult('3fe251c9-b535-40bc-8b9e-d5f0f9c6f370').state
    print '3fe251c9-b535-40bc-8b9e-d5f0f9c6f370',celery.result.AsyncResult('3fe251c9-b535-40bc-8b9e-d5f0f9c6f370').result
    print '22c6893f-573c-43a5-960e-485c5edc1f95',celery.result.AsyncResult('22c6893f-573c-43a5-960e-485c5edc1f95').state
    print '22c6893f-573c-43a5-960e-485c5edc1f95',celery.result.AsyncResult('22c6893f-573c-43a5-960e-485c5edc1f95').result

if __name__ == "__main__":
    CELERY_TIMEZONE = 'Asia/Shanghai'
    # CELERY_TIMEZONE = 'UTC'
    # TIME_ZONE = 'Asia/Shanghai'
    tt()