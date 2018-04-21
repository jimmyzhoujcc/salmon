from django.contrib.auth.models import User, Group
from rest_framework import status
from rest_framework import permissions
from .permissions import IsOwnerOrReadOnly
from rest_framework import viewsets
from serializers import *
from models import *
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from rest_framework.response import Response

class UserViewSet(viewsets.ModelViewSet):
    """
    This Viewset Automatically Provides Actions:
      - GET:   list
      - POST:  create
      - PUT:   update
      - DELETE:destroy
    """
    queryset = User.objects.all()
    serializer_class = UserSerializer

    permission_classes = [permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly, ]

    def perform_create(self, serializer):
        """Sets the user profile to the logged in user."""
        serializer.save()


class GroupViewSet(viewsets.ModelViewSet):
    """
    This Viewset Automatically Provides Actions:
      - GET:   list
      - POST:  create
      - PUT:   update
      - DELETE:destroy
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer

    def perform_create(self, serializer):
        """Sets group."""
        serializer.save()

class HostViewSet(viewsets.ModelViewSet):
    """
    This Viewset Automatically Provides Actions:
      - GET:   list
      - POST:  create
      - PUT:   update
      - DELETE:destroy
    """
    queryset = Host.objects.all()
    serializer_class = HostSerializer

    permission_classes = [permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly, ]
    # permission_classes = [IsOwnerOrReadOnly, ]

    # @method_decorator(csrf_exempt)
    # @csrf_exempt
    def perform_create(self, serializer):
        """Sets host."""
        serializer.save()

class HostGroupViewSet(viewsets.ModelViewSet):
    """
    This Viewset Automatically Provides Actions:
      - GET:   list
      - POST:  create
      - PUT:   update
      - DELETE:destroy
    """
    queryset = HostGroup.objects.all()
    serializer_class = HostGroupSerializer

    def perform_create(self, serializer):
        """Sets hostgroup."""
        serializer.save()

class HostUserViewSet(viewsets.ModelViewSet):
    """
    This Viewset Automatically Provides Actions:
      - GET:   list
      - POST:  create
      - PUT:   update
      - DELETE:destroy
    """
    queryset = HostUser.objects.all()
    serializer_class = HostUserSerializer

    def perform_create(self, serializer):
        """Sets hostuser."""
        serializer.save()

class AssetViewSet(viewsets.ModelViewSet):
    """
    This Viewset Automatically Provides Actions:
      - GET:   list
      - POST:  create
      - PUT:   update
      - DELETE:destroy
    """
    queryset = Asset.objects.all()
    serializer_class = AssetSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly, ]

    def perform_create(self, serializer):
        """Sets asset."""
        serializer.save()

class ServerViewSet(viewsets.ModelViewSet):
    """
    This Viewset Automatically Provides Actions:
      - GET:   list
      - POST:  create
      - PUT:   update
      - DELETE:destroy
    """
    queryset = Server.objects.all()
    serializer_class = ServerSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly, ]

    def perform_create(self, serializer):
        """Sets server."""
        serializer.save()