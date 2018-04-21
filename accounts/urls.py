#coding=utf-8

"""mysite URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.9/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include, url
from django.contrib import admin
from accounts import views
from celery_tasks import views as celery_views
# < -- droppable upload file by AJAX api start-->
from django.conf.urls.static import static
from django.conf import settings
from views import *
# < -- droppable upload file by AJAX api end-->
import rest_views

admin.autodiscover()
urlpatterns = [

    # url(r'^accounts/login/$', 'django.contrib.auth.views.login', {'template_name': 'login.html'}),
    url(r'^account_login/$', views.account_login),
    url(r'^login/$', views.login),
    url(r'^logout/$', views.logout),
    url(r'^pie/$', views.pie),
    url(r'^profile/$', views.profile),
    url(r'^hosts/$', views.table),
    url(r'^host_list/$', views.host_list,name='host_list'),
    url(r'^add_asset/$', views.add_asset),
    url(r'^log_cmd/$', views.log_cmd),
    url(r'^log_playbook/$', views.log_playbook),
    url(r'^schedule_details/$', views.schedule_details),
    url(r'^cancel_post_json_task/$', views.cancel_post_json_task),
    # url(r'^schedule_detail/$', celery_views.schedule_detail),
    url(r'^charts/$', views.charts),
    url(r'^host_manager/$', views.host_manager),
    url(r'^regist/$', views.regist),
    url(r'^documents/$', views.documents),
    #url(r'test_shell$',views.checkurl),
    url(r'^$', views.index),
    #url(r'/?(id3=collect_log)$',views.index),
    #url(r'^data/(?P<id>\d+)/$', views.checkurl),
    url(r'^data/(?P<id>\d+)/$', views.data),
    url(r'^ajax_list/$', views.ajax_list, name='ajax-list'),
    url(r'^ajax_dict/$', views.ajax_dict, name='ajax-dict'),
    url(r'^add/$', views.add, name='add'),
    url(r'^query/$', views.query, name='query'),
    url(r'^queryhostgroup/$', views.queryhostgroup, name='queryhostgroup'),
    url(r'^ops_command/$', views.ops_command, name='ops_command'),
    url(r'^run_cmd/$', views.run_cmd, name='run_cmd'),
    url(r'^run_scripts/$', views.run_scripts, name='run_scripts'),
    url(r'^run_playbook/$', views.run_playbook, name='run_playbook'),

    url(r'^schedule_scripts/$', views.schedule_scripts, name='schedule_scripts'),

    url(r'^data/(?P<id>\d+)/$', views.data),
    url(r'^update/', views.update),


    # < -- droppable upload file by AJAX api start-->
    url(r'^upload/', ProfileImageView.as_view(), name='profile_image_upload'),
    url(r'^scripts_upload/', ScriptsProfileImageView.as_view(), name='scripts_profile_image_upload'),
    url(r'^schedule_scripts_upload/', ScheduleScriptsProfileImageView.as_view(), name='schedule_scripts_profile_image_upload'),
    url(r'^host_list_upload/', HostListProfileImageView.as_view(), name='host_list_upload'),
    # url(r'^upload/', ProfileImageView.as_view(), name='profile_image_upload'),
    # url(r'^uploaded/(?P<pk>\d+)/$', ProfileDetailView.as_view(),name='profile_image'),
    # < -- droppable upload file by AJAX api end->
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

# < -- droppable upload file by AJAX api start-->
# if settings.DEBUG:
#     urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
# < -- droppable upload file by AJAX api end-->