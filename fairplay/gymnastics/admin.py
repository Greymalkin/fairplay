from django.forms.models import BaseInlineFormSet
from django.contrib import admin
from grappelli.forms import GrappelliSortableHiddenMixin

from django.db.models import Count

from .models import (
    Group, Athlete, Event, Team, LEDSign, AthleteEvent, Message, TeamAward,
    Session, SessionEvent
)


class AthleteEventAdmin(admin.ModelAdmin):
    model = AthleteEvent
    fields = ('athlete', 'event', 'difficulty_score', 'execution_score')
    list_display = ('athlete', 'event', 'difficulty_score', 'execution_score',
                    'total_score')
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
    fields = ('event', 'difficulty_score', 'execution_score')


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
    fields = ('athlete_id', 'last_name', 'first_name', 'team', 'group')
    list_display = ('athlete_id', 'last_name', 'first_name', 'team', 'group',)
    search_fields = ['athlete_id', 'id', 'last_name', 'first_name']
    list_filter = ('team', 'group')


class GroupAdmin(admin.ModelAdmin):
    model = Group


class LEDSignAdmin(admin.ModelAdmin):
    model = LEDSign
    list_display = ('sign_id', 'device', )


class EventAdmin(admin.ModelAdmin):
    model = Event
    list_display = ('name', 'order', 'starting_teams', 'starting_athletes')


class MessageAdmin(admin.ModelAdmin):
    model = Message
    list_display = ('name', 'message', )


class SessionEventInlineAdmin(admin.StackedInline):
    model = SessionEvent
    extra = 1
    fields = ('event', 'teams',)
    classes = ('grp-collapse grp-open',)
    inline_classes = ('grp-collapse grp-open',)
    filter_horizontal = ('teams',)


class SessionAdmin(admin.ModelAdmin):
    model = Session
    inlines = (SessionEventInlineAdmin, )
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
