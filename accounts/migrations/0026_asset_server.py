# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2018-03-04 10:14
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0025_auto_20180228_1826'),
    ]

    operations = [
        migrations.CreateModel(
            name='Asset',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('assets_type', models.CharField(choices=[(b'server', '\u670d\u52a1\u5668'), (b'vmser', '\u865a\u62df\u673a')], default=b'server', max_length=100, verbose_name=b'\xe8\xb5\x84\xe4\xba\xa7\xe7\xb1\xbb\xe5\x9e\x8b')),
                ('name', models.CharField(max_length=100, unique=True, verbose_name=b'\xe8\xb5\x84\xe4\xba\xa7\xe7\xbc\x96\xe5\x8f\xb7')),
                ('sn', models.CharField(blank=True, max_length=100, null=True, verbose_name=b'\xe8\xae\xbe\xe5\xa4\x87\xe5\xba\x8f\xe5\x88\x97\xe5\x8f\xb7')),
                ('buy_time', models.DateField(blank=True, null=True, verbose_name=b'\xe8\xb4\xad\xe4\xb9\xb0\xe6\x97\xb6\xe9\x97\xb4')),
                ('expire_date', models.DateField(blank=True, null=True, verbose_name='\u8fc7\u4fdd\u4fee\u671f')),
                ('management_ip', models.GenericIPAddressField(blank=True, null=True, verbose_name='\u7ba1\u7406IP')),
                ('manufacturer', models.CharField(blank=True, max_length=100, null=True, verbose_name=b'\xe5\x88\xb6\xe9\x80\xa0\xe5\x95\x86')),
                ('provider', models.CharField(blank=True, max_length=100, null=True, verbose_name=b'\xe4\xbe\x9b\xe8\xb4\xa7\xe5\x95\x86')),
                ('model', models.CharField(blank=True, max_length=100, null=True, verbose_name=b'\xe8\xb5\x84\xe4\xba\xa7\xe5\x9e\x8b\xe5\x8f\xb7')),
                ('status', models.SmallIntegerField(blank=True, null=True, verbose_name=b'\xe7\x8a\xb6\xe6\x80\x81')),
                ('put_zone', models.SmallIntegerField(blank=True, null=True, verbose_name=b'\xe6\x94\xbe\xe7\xbd\xae\xe5\x8c\xba\xe5\x9f\x9f')),
                ('group', models.SmallIntegerField(blank=True, null=True, verbose_name=b'\xe4\xbd\xbf\xe7\x94\xa8\xe7\xbb\x84')),
                ('business', models.SmallIntegerField(blank=True, null=True, verbose_name=b'\xe4\xb8\x9a\xe5\x8a\xa1\xe7\xb1\xbb\xe5\x9e\x8b')),
                ('project', models.SmallIntegerField(blank=True, null=True, verbose_name=b'\xe9\xa1\xb9\xe7\x9b\xae\xe7\xb1\xbb\xe5\x9e\x8b')),
                ('create_date', models.DateTimeField(auto_now_add=True)),
                ('update_date', models.DateTimeField(auto_now_add=True)),
            ],
            options={
                'db_table': 'salmon_asset',
                'verbose_name': '\u603b\u8d44\u4ea7\u8868',
                'verbose_name_plural': '\u603b\u8d44\u4ea7\u8868',
                'permissions': (('can_read_assets', '\u8bfb\u53d6\u8d44\u4ea7\u6743\u9650'), ('can_change_assets', '\u66f4\u6539\u8d44\u4ea7\u6743\u9650'), ('can_add_assets', '\u6dfb\u52a0\u8d44\u4ea7\u6743\u9650'), ('can_delete_assets', '\u5220\u9664\u8d44\u4ea7\u6743\u9650')),
            },
        ),
        migrations.CreateModel(
            name='Server',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('ip', models.CharField(blank=True, max_length=100, null=True, unique=True)),
                ('hostname', models.CharField(blank=True, max_length=100, null=True)),
                ('username', models.CharField(blank=True, max_length=100, null=True)),
                ('passwd', models.CharField(blank=True, max_length=100, null=True)),
                ('keyfile', models.SmallIntegerField(blank=True, null=True)),
                ('port', models.DecimalField(blank=True, decimal_places=0, max_digits=6, null=True)),
                ('line', models.SmallIntegerField(blank=True, null=True)),
                ('cpu', models.CharField(blank=True, max_length=100, null=True)),
                ('cpu_number', models.SmallIntegerField(blank=True, null=True)),
                ('vcpu_number', models.SmallIntegerField(blank=True, null=True)),
                ('cpu_core', models.SmallIntegerField(blank=True, null=True)),
                ('disk_total', models.CharField(blank=True, max_length=100, null=True)),
                ('ram_total', models.IntegerField(blank=True, null=True)),
                ('kernel', models.CharField(blank=True, max_length=100, null=True)),
                ('selinux', models.CharField(blank=True, max_length=100, null=True)),
                ('swap', models.CharField(blank=True, max_length=100, null=True)),
                ('raid', models.SmallIntegerField(blank=True, null=True)),
                ('system', models.CharField(blank=True, max_length=100, null=True)),
                ('create_date', models.DateTimeField(auto_now_add=True)),
                ('update_date', models.DateTimeField(auto_now_add=True)),
                ('assets', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='accounts.Asset')),
            ],
            options={
                'db_table': 'salmon_server',
                'verbose_name': '\u670d\u52a1\u5668\u8d44\u4ea7\u8868',
                'verbose_name_plural': '\u670d\u52a1\u5668\u8d44\u4ea7\u8868',
                'permissions': (('can_read_server_assets', '\u8bfb\u53d6\u670d\u52a1\u5668\u8d44\u4ea7\u6743\u9650'), ('can_change_server_assets', '\u66f4\u6539\u670d\u52a1\u5668\u8d44\u4ea7\u6743\u9650'), ('can_add_server_assets', '\u6dfb\u52a0\u670d\u52a1\u5668\u8d44\u4ea7\u6743\u9650'), ('can_delete_server_assets', '\u5220\u9664\u670d\u52a1\u5668\u8d44\u4ea7\u6743\u9650')),
            },
        ),
    ]
