# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2018-02-28 10:26
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0024_auto_20180228_1816'),
    ]

    operations = [
        migrations.AlterField(
            model_name='host',
            name='ip',
            field=models.CharField(max_length=15, unique=True),
        ),
    ]
