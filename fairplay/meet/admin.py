import datetime
from copy import deepcopy, copy
from django.db.models.signals import pre_save, post_save
from django.contrib import admin, messages
from . import models
from registration.models import Level, Team, Coach
from competition.models import Event, TeamAward, AthleteEvent

class MeetAdmin(admin.ModelAdmin):
    list_display = ('short_name', 'host', 'date', 'is_current_meet',)
    actions = ['copy_meet']

    def save_model(self, request, obj, form, change):
        # only alllow a single default
        if obj.is_current_meet:
            self.model.objects.all().exclude(id=obj.id).update(is_current_meet=False)
        obj.save()

    def copy_meet(self, request, queryset):
        current_meet = queryset[0]
        levels = Level.objects.filter(meet=current_meet)
        events = Event.objects.filter(meet=current_meet)
        awards = TeamAward.objects.filter(meet=current_meet)

        new_meet = deepcopy(current_meet)
        new_meet.name = 'New MEET!'
        new_meet.short_name = 'New MEET!'
        new_meet.is_current_meet = False
        new_meet.date = datetime.datetime.today()
        new_meet.id = None
        new_meet.save()

        for level in levels:
            old_obj = copy(level) 
            old_obj.id = None 
            old_obj.meet = new_meet
            pre_save.disconnect(receiver=None, sender=Level, dispatch_uid='save_current_meet_level')
            old_obj.save()

        for event in events:
            old_obj = copy(event) 
            old_obj.id = None 
            old_obj.meet = new_meet
            pre_save.disconnect(receiver=None, sender=Event, dispatch_uid='save_current_meet_event')
            post_save.disconnect(receiver=None, sender=AthleteEvent, dispatch_uid='update_rankings')
            post_save.disconnect(receiver=None, sender=Event, dispatch_uid='populate_event')
            old_obj.save()
            # post_save.connect(receiver=None, sender=AthleteEvent, dispatch_uid='update_rankings')

        messages.success(request, 'New meet {} copied from {}'.format(new_meet.name, current_meet.name))

admin.site.register(models.Meet, MeetAdmin)
