# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2018-02-25 07:34
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0019_auto_20180225_1524'),
    ]

    operations = [
        migrations.AddField(
            model_name='hostuser',
            name='department',
            field=models.CharField(blank=True, max_length=10, null=True),
        ),
    ]
