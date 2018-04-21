import time
from celery_tasks import app

@app.task
def multiply(x, y):
    return x * y