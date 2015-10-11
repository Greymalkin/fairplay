from django.forms.models import BaseInlineFormSet
from django.contrib import admin
from django.db.models.signals import pre_save
from django.db.models import Count, Sum
from django.dispatch import receiver
from grappelli.forms import GrappelliSortableHiddenMixin

from . import models

from django.utils.translation import ugettext_lazy as _


def make_event_action(event):
    name = 'mark_%s' % event

    def action(modeladmin, req, qset):
        for item in qset:
            item.starting_event = event
            item.save()

    return (name, (action, name, "Set starting event to {}".format(event)))


class SessionFilter(admin.SimpleListFilter):
    # Human-readable title which will be displayed in the
    # right admin sidebar just above the filter options.
    title = _('session')

    # Parameter for the filter that will be used in the URL query.
    parameter_name = 'session'

    def lookups(self, request, model_admin):
        return [(s.id, s.name) for s in Session.objects.all()]

    def queryset(self, request, queryset):
        if self.value() is not None:
            return queryset.filter(division__session__id=self.value())
        else:
            return queryset


class AthleteEventAdmin(admin.ModelAdmin):
    fields = ('athlete', 'event', 'score',)
    list_display = ('athlete', 'event', 'score',)
    search_fields = ['athlete', 'id', ]

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(AthleteEventAdmin, self).get_queryset(request)
        meet = models.Meet.objects.filter(is_current_meet=True)
        return qs.filter(event__meet=meet)


class DivisionAdmin(admin.ModelAdmin):
    list_display = ('name', 'level', 'min_age', 'max_age')
    list_editable = ('min_age', 'max_age')
    ordering = ('level', 'min_age')
    exclude = ('meet',)

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(DivisionAdmin, self).get_queryset(request)
        meet = models.Meet.objects.filter(is_current_meet=True)
        return qs.filter(meet=meet)

class EventAdmin(admin.ModelAdmin):
    list_display = ('name', 'initials', 'order',)
    exclude = ('meet',)

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(EventAdmin, self).get_queryset(request)
        meet = models.Meet.objects.filter(is_current_meet=True)
        return qs.filter(meet=meet)


class SessionAdmin(admin.ModelAdmin):
    list_display = ('name',)
    filter_horizontal = ('divisions',)
    exclude = ('meet',)

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(SessionAdmin, self).get_queryset(request)
        meet = models.Meet.objects.filter(is_current_meet=True)
        return qs.filter(meet=meet)


class LEDSignAdmin(admin.ModelAdmin):
    list_display = ('sign_id', 'device', )



class MessageAdmin(admin.ModelAdmin):
    list_display = ('name', 'message', )



admin.site.register(models.Division, DivisionAdmin)
admin.site.register(models.LEDSign, LEDSignAdmin)
admin.site.register(models.Event, EventAdmin)
admin.site.register(models.AthleteEvent, AthleteEventAdmin)
admin.site.register(models.Message, MessageAdmin)
admin.site.register(models.Session, SessionAdmin)

@receiver(pre_save, sender=models.Division)
@receiver(pre_save, sender=models.Event)
@receiver(pre_save, sender=models.Session)
@receiver(pre_save, sender=models.TeamAward)
def save_current_meet(sender, instance, **kwargs):
    meet = models.Meet.objects.get(is_current_meet=True)
    instance.meet = meet
