from django.contrib.auth.models import User, Group
from rest_framework import serializers
from .models import *

class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ('url', 'username', 'email', 'groups')


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ('url', 'name')

class HostSerializer(serializers.HyperlinkedModelSerializer):
    # ip = serializers.CharField(read_only=False)
    # name = serializers.CharField(read_only=False)
    # ip = serializers.CharField(allow_blank=True, max_length=15, required=False)
    # name = serializers.CharField(allow_blank=True, max_length=15, required=False)

    class Meta:
        model = Host
        # fields = ('url', 'ip', 'name', 'location','visible','create_at','update_at')
        fields = ('url', 'ip', 'name')

class HostGroupSerializer(serializers.HyperlinkedModelSerializer):
    # bind_hosts = serializers.PrimaryKeyRelatedField(many=True, queryset=Host.objects.all())
    bind_hosts = serializers.StringRelatedField(many=True)

    class Meta:
        model = HostGroup
        # fields = ('url', 'name', 'bind_hosts')
        fields = ('name', 'bind_hosts')

class HostUserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = HostUser
        fields = ('url', 'user','group')

class AssetSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Asset
        fields = ('url','assets_type','sn','buy_time','expire_date','management_ip',
                  'manufacturer','provider','model','status','put_zone','group','project')

class ServerSerializer(serializers.HyperlinkedModelSerializer):
    assets = serializers.PrimaryKeyRelatedField(many=False, queryset=Asset.objects.all())

    class Meta:
        model = Server
        fields = ('url','ip','hostname','username','passwd','keyfile','port',
                  'cpu','cpu_number','vcpu_number','cpu_core','disk_total','ram_total',
                  'kernel','selinux','swap','raid','system','assets')