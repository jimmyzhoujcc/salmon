#!/usr/bin/env python
# encoding: utf-8

# from __future__ import absolute_import
from tasks import add

# add.apply_async((1, ), priority=1)
# add.apply_async((1, ), priority=7)
# add.apply_async((2, ), priority=6)
# add.apply_async((3, ), priority=5)
# add.apply_async((4, ), priority=8)
# add.apply_async((5, ), priority=9)

# after 5 seconds, execute task
# add.apply_async(("after 5 seconds, execute task", ), countdown=5)

# At 2018-02-07 08:41:00, execute task
# add.apply_async(args=("At xxxx-xx-xx xx:xx:xx, execute task", ), eta=datetime(2018,2,7,8,57,0))

# At 2018-02-07 08:41:00, execute task
# add.apply_async((1,2),eta=datetime(2018,2,7,9,28,0))
# add.apply_async((2,6), countdown=5)

result = add.apply_async((88888,6), countdown=5)
print 'task_status----->',result.status
print 'task_id----->',result.id
print 'task_result----->',result.get()