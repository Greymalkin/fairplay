import registration.models

from django import template
from django.conf import settings

register = template.Library()

@register.filter
def division_age_counts(value, age=None):
    ''' pass in a level, return number of not scratched gmnasts at an age, for a specific level division'''
    return value.division_age_count(age)

@register.filter
def group_age_counts(value, age=None):    
    ''' pass in a level, return number of not scratched gmnasts at an age '''
    return value.group_age_count(age)

@register.filter
def team_awards_teams(value):
	''' pass in an award, return teams that registered for receiving it, and number of gymnasts on the team'''
	return value.registered_teams()