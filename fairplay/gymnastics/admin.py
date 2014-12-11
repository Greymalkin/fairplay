from django.forms.models import BaseInlineFormSet
from django.contrib import admin
from grappelli.forms import GrappelliSortableHiddenMixin

from django.db.models import Count

from .models import (
    Group, Athlete, Event, Team, LEDSign, AthleteEvent, TeamAwards
)


class AthleteEventAdmin(admin.ModelAdmin):
    model = AthleteEvent
    fields = ('athlete', 'event', 'difficulty_score', 'execution_score')
    list_display = ('athlete', 'event', 'difficulty_score', 'execution_score', 'total_score')
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
    list_display = ('name', 'initial_event', 'team_size')
    search_fields = ['name', 'id', ]
    list_filter = ('initial_event',)

    def queryset(self, request):
        qs = super(TeamAdmin, self).queryset(request)
        qs = qs.annotate(Count('athletes'))
        return qs

    def team_size(self, obj):
        return obj.athletes__count

    team_size.admin_order_field = 'team_size'


class AthleteAdmin(admin.ModelAdmin):
    model = Athlete
    inlines = (AthleteEventInlineAdmin, )
    list_display = ('athlete_id', 'last_name', 'first_name', 'team', 'group',)
    search_fields = ['athlete_id', 'id', 'last_name', 'first_name']
    list_filter = ('team', 'group')


class GroupAdmin(admin.ModelAdmin):
    model = Group
    list_display = ('level', 'age_group',)


class LEDSignAdmin(admin.ModelAdmin):
    model = LEDSign
    list_display = ('sign_id', 'device', )


class EventAdmin(admin.ModelAdmin):
    model = Event
    list_display = ('name', 'order', )

class TeamAwardsAdmin(admin.ModelAdmin):
    model = TeamAwards
    list_display = ('name', )
    filter_horizontal = ('teams', 'groups')


admin.site.register(Group, GroupAdmin)
admin.site.register(Team, TeamAdmin)
admin.site.register(LEDSign, LEDSignAdmin)
admin.site.register(Event, EventAdmin)
admin.site.register(AthleteEvent, AthleteEventAdmin)
admin.site.register(Athlete, AthleteAdmin)
admin.site.register(TeamAwards, TeamAwardsAdmin)