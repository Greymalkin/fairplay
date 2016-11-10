import registration.models

from django import template
from django.utils.safestring import mark_safe

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


@register.simple_tag
def team_rotation_gymnasts(team=None, session=None, event=None, warmup=None):
    ''' Return the gymnasts at the first event for warmup or competition'''
    if warmup:
        event = event.warmup_event_endhere
    gymnasts = team.team_rotation_gymnasts(session, event).order_by('last_name')
    html = ''
    for g in gymnasts:
        html += '{1}, {0}</br>'.format(g.first_name, g.last_name)
    return mark_safe(html)


@register.simple_tag
def team_rotation_count(team=None, session=None, event=None, warmup=None):
    ''' Return the gymnasts at the first event for warmup or competition'''
    if warmup:
        event = event.warmup_event_endhere
    return team.team_rotation_gymnasts(session, event).count()


@register.simple_tag
def event_rotation_count(session=None, event=None, warmup=None):
    ''' Return the gymnasts at the first event for warmup or competition'''
    if warmup:
        event = event.warmup_event_endhere
    return registration.models.Gymnast.event_rotation_gymnasts(session, event).count()


@register.filter
def level_coaches(value):
    ''' return coaches on teams with gymnasts registered at a particular level '''
    return registration.models.Level.level_coaches(value)


@register.simple_tag
def level_coaches_count(level):
    ''' return total number of coaches on teams with gymnasts registered at a
        particular level, regardless of team '''
    return registration.models.Level.level_coaches_count(level)
