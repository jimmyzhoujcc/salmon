# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2018-02-25 07:17
from __future__ import unicode_literals

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0016_host_user'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Host_User',
            new_name='HostUser',
        ),
    ]
