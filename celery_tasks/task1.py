import time
from celery_tasks import app

@app.task
def add(x, y):
    return x + y