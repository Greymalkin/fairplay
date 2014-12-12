from django.forms.models import BaseInlineFormSet
from django.contrib import admin
from grappelli.forms import GrappelliSortableHiddenMixin

from django.db.models import Count

from .models import (
    Group, Athlete, Event, Team, LEDSign, AthleteEvent, Message, TeamAward,
    Session,
)

from django.utils.translation import ugettext_lazy as _

def make_event_action(event):
    name = 'mark_%s' % event
    action = lambda modeladmin, req, qset: qset.update(starting_event=event)
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
            return queryset.filter(group__session__id=self.value())
        else:
            return queryset


class AthleteEventAdmin(admin.ModelAdmin):
    model = AthleteEvent
    fields = ('athlete', 'event', 'score',)
    list_display = ('athlete', 'event', 'score',)
    search_fields = ['athlete', 'id', ]


class AthleteEventInlineFormset(BaseInlineFormSet):
    def __init__(self, *args, **kwargs):
        super(AthleteEventInlineFormset, self).__init__(*args, **kwargs)
        self.can_delete = False


class AthleteEventInlineAdmin(admin.TabularInline):
    model = AthleteEvent
    formset = AthleteEventInlineFormset
    extra = 0
    max_num = 0
    readonly_fields = ('event', )
    fields = ('event', 'score',)


class AthleteInlineAdmin(GrappelliSortableHiddenMixin, admin.TabularInline):
    model = Athlete
    extra = 1
    sortable_field_name = 'position'


class TeamAdmin(admin.ModelAdmin):
    model = Team
    inlines = (AthleteInlineAdmin,)
    list_display = ('name', 'team_size', 'qualified')
    list_display = ('name', 'team_size')
    search_fields = ['name', 'id', ]
    list_filter = ('qualified',)

    def queryset(self, request):
        qs = super(TeamAdmin, self).queryset(request)
        qs = qs.annotate(Count('athletes'))
        return qs

    def team_size(self, obj):
        return obj.athletes__count
    team_size.admin_order_field = 'team_size'


class TeamAwardAdmin(admin.ModelAdmin):
    model = TeamAward
    list_display = ('name', )
    filter_horizontal = ('groups',)


class AthleteAdmin(admin.ModelAdmin):
    model = Athlete
    inlines = (AthleteEventInlineAdmin, )
    fields = ('athlete_id', 'last_name', 'first_name',
              'team', 'group', 'starting_event')
    search_fields = ['athlete_id', 'last_name', 'first_name']
    list_filter = ('team', 'group', SessionFilter, 'starting_event',)
    list_per_page = 50

    def get_actions(self, request):
        return dict([make_event_action(q) for q in Event.objects.all()])

    def session(self, athlete):
        return Session.objects.get(groups=athlete.group).name

    def get_list_display(self, request):
        result = ['athlete_id', 'last_name', 'first_name', 'team', 'group', 'starting_event']
        events = Event.objects.all()
        result += [e.initials for e in events]
        return result

    def __getattr__(self, attr):
        event = Event.objects.get(initials=attr)

        def get_score(athlete):
            return AthleteEvent.objects.get(event=event, athlete=athlete).score
        get_score.short_description = attr

        return get_score


class GroupAdmin(admin.ModelAdmin):
    model = Group


class LEDSignAdmin(admin.ModelAdmin):
    model = LEDSign
    list_display = ('sign_id', 'device', )


class EventAdmin(admin.ModelAdmin):
    model = Event
    list_display = ('name', 'initials', 'order',)


class MessageAdmin(admin.ModelAdmin):
    model = Message
    list_display = ('name', 'message', )


class SessionAdmin(admin.ModelAdmin):
    model = Session
    list_display = ('name',)
    filter_horizontal = ('groups',)

admin.site.register(Group, GroupAdmin)
admin.site.register(Team, TeamAdmin)
admin.site.register(LEDSign, LEDSignAdmin)
admin.site.register(Event, EventAdmin)
admin.site.register(AthleteEvent, AthleteEventAdmin)
admin.site.register(Athlete, AthleteAdmin)
admin.site.register(Message, MessageAdmin)
admin.site.register(TeamAward, TeamAwardAdmin)
admin.site.register(Session, SessionAdmin)
