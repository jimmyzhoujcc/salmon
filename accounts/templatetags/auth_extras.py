from django import template
from django.contrib.auth.models import Group

register = template.Library()

# @register.filter(name='has_group')
# def has_group(user, group_name):
#     group = Group.objects.get(name=group_name)
#     return True if group in user.groups.all() else False

@register.filter(name='has_group')
def has_group(user, group_name):
    users_in_group = Group.objects.get(name="Host_Manager_Group").user_set.all()

    for i in users_in_group:
        if i.get_username() == user:
            return True

