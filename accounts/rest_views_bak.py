from django.contrib.auth.models import User, Group
from rest_framework import status
from rest_framework import permissions
from .permissions import IsOwnerOrReadOnly
from rest_framework import viewsets
from serializers import UserSerializer, GroupSerializer,HostSerializer,HostGroupSerializer,HostUserSerializer
from models import *
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
        serializer.save(self.request.user)


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer

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

    # permission_classes = [permissions.IsAuthenticatedOrReadOnly, IsOwnerOrReadOnly, ]
    permission_classes = [IsOwnerOrReadOnly, ]

    def perform_create(self, serializer):
        """Sets host."""
        serializer.save(self.request.user)

    # def create(self, request, *args, **kwargs):
    #     serializer = HostSerializer(data=request.data)
    #
    #     if serializer.is_valid():
    #         # try:
    #         serializer.save()
    #         return Response(serializer.data, status=status.HTTP_201_CREATED)
    #         # except Exception as e:
    #         #     return str(e)
    #     else:
    #         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


class HostGroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows hostgroup to be viewed or edited.
    """
    queryset = HostGroup.objects.all()
    serializer_class = HostGroupSerializer

class HostUserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows hostgroup to be viewed or edited.
    """
    queryset = HostUser.objects.all()
    serializer_class = HostUserSerializer