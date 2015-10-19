from django.forms.models import BaseInlineFormSet
from django.contrib import admin
from django.conf import settings
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
        return [(s.id, s.name) for s in models.Session.objects.all()]

    def queryset(self, request, queryset):
        if self.value() is not None:
            return queryset.filter(division__session__id=self.value())
        else:
            return queryset


class AthleteEventInlineFormset(BaseInlineFormSet):
    def __init__(self, *args, **kwargs):
        super(AthleteEventInlineFormset, self).__init__(*args, **kwargs)
        self.can_delete = False


class AthleteEventInlineAdmin(admin.TabularInline):
    model = models.AthleteEvent
    formset = AthleteEventInlineFormset
    extra = 0
    max_num = 0
    readonly_fields = ('event', )
    fields = ('event', 'score',)


class AthleteAdmin(admin.ModelAdmin):
    search_fields = ['athlete_id', 'last_name', 'first_name']
    inlines = (AthleteEventInlineAdmin, )
    fields = ('usag', 'athlete_id', 'is_scratched', 'last_name', 'first_name',
              'dob', 'team', 'division', 'starting_event', )
    list_filter = ('team', 'division', SessionFilter, 'starting_event', 'is_scratched')
    list_per_page = 50

    def get_actions(self, request):
        return dict([make_event_action(q) for q in models.Event.objects.all()])

    def session(self, athlete):
        return models.Session.objects.get(divisions=athlete.division).name

    def get_queryset(self, request):
        qs = super(AthleteAdmin, self).get_queryset(request)
        qs = qs.annotate(aa=Sum('events__score'))
        return qs

    def get_list_display(self, request):
        result = ['athlete_id', 'last_name', 'first_name', 'show_team', 'division', 'starting_event']
        events = models.Event.objects.all()
        result += [e.initials for e in events]
        result += ['all_around', ]
        return result

    def all_around(self, obj):
        return obj.aa
    all_around.admin_order_field = 'aa'
    all_around.short_description = 'AA'

    def __getattr__(self, attr):
        event = models.Event.objects.get(initials=attr)

        def get_score(athlete):
            return athlete.events.get(event=event).score
        get_score.short_description = attr.upper()
        return get_score

    def show_team(self, obj):
        return obj.team.team
    show_team.short_description = "Team"
    show_team.admin_order_field = 'team__team'


class AthleteInlineAdmin(admin.TabularInline):
    model = models.Athlete
    extra = 1
    fields = ('athlete_id', 'last_name', 'first_name', 'starting_event')


class TeamAwardAdmin(admin.ModelAdmin):
    list_display = ('name', 'order', )
    filter_horizontal = ('divisions', 'levels')
    exclude = ('meet',)
    list_editable = ('order',)

    class Media:
        css = {
            "all": ("{}css/filter-horizontal-adjustment.css".format(settings.STATIC_URL),)
        }


class AthleteEventAdmin(admin.ModelAdmin):
    fields = ('gymnast', 'event', 'score',)
    list_display = ('gymnast', 'event', 'score',)
    search_fields = ['gymnast', 'id', ]

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
admin.site.register(models.Athlete, AthleteAdmin)
admin.site.register(models.TeamAward, TeamAwardAdmin)
admin.site.register(models.TeamAwardRank)


@receiver(pre_save, sender=models.TeamAward)
@receiver(pre_save, sender=models.Division)
@receiver(pre_save, sender=models.Event)
@receiver(pre_save, sender=models.Session)
@receiver(pre_save, sender=models.TeamAward)
def save_current_meet(sender, instance, **kwargs):
    meet = models.Meet.objects.get(is_current_meet=True)
    instance.meet = meet
