# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2018-02-25 07:24
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0018_hostgroup_bind_users'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='hostgroup',
            name='bind_users',
        ),
        migrations.AddField(
            model_name='hostgroup',
            name='bind_users',
            field=models.ManyToManyField(blank=True, to='accounts.HostUser'),
        ),
    ]
