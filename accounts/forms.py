# -*- coding:utf-8 -*-
# !/usr/bin/env python
# Time 2018-01-11 14:00
# Author ymzhou
# Email ymzhou@aaa.com
#coding=utf-8

# from django import forms
# class AddForm(forms.Form):
#     a = forms.IntegerField()
#     b = forms.IntegerField()


# from django.shortcuts import render,render_to_response
# from django.http import HttpResponse

# from models import User
# from django.contrib.auth.models import User
#
# # Create your views here.
# class UserForm(forms.Form):
#     username = forms.CharField(label='用户名',max_length=50)
#     password = forms.CharField(label='密码',widget=forms.PasswordInput())
#     email = forms.EmailField(label='邮箱')
#
# def regist(request):
#     if request.method == 'POST':
#         userform = UserForm(request.POST)
#         if userform.is_valid():
#             username = userform.cleaned_data['username']
#             password = userform.cleaned_data['password']
#             email = userform.cleaned_data['email']
#
#             User.objects.create(username=username,password=password,email=email)
#             User.save()
#
#             return HttpResponse('regist success!!!')
#     else:
#         userform = UserForm()
#     return render_to_response('regist_user.html',{'userform':userform})

# < -- droppable upload file by AJAX api start-->
from django import forms
from .models import *
class ProfileImageForm(forms.Form):
    image = forms.FileField(label='Select a profile Image')
# < -- droppable upload file by AJAX api end-->
