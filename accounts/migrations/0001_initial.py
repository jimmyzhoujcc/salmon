# -*- coding: utf-8 -*-
# Generated by Django 1.11.3 on 2018-01-10 10:51
from __future__ import unicode_literals

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(choices=[('admin', 'Admin'), ('superuser', 'Superuser'), ('user', 'User')], max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Host',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ip', models.CharField(max_length=15)),
                ('name', models.CharField(max_length=15)),
                ('location', models.CharField(blank=True, max_length=15, null=True)),
                ('version', models.CharField(blank=True, max_length=10, null=True)),
                ('comment', models.CharField(blank=True, max_length=50, null=True)),
                ('path', models.CharField(max_length=100)),
                ('visible', models.BooleanField()),
                ('create_at', models.DateTimeField()),
                ('update_at', models.DateTimeField()),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='accounts.Category')),
            ],
        ),
        migrations.CreateModel(
            name='Host_User',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(blank=True, max_length=10, null=True)),
                ('status', models.BooleanField()),
                ('manager', models.CharField(blank=True, max_length=10, null=True)),
                ('department', models.CharField(blank=True, max_length=10, null=True)),
                ('comment', models.CharField(blank=True, max_length=50, null=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.AddField(
            model_name='host',
            name='supervisor',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='accounts.Host_User'),
        ),
    ]
