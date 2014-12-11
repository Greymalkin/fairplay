from django.forms.models import BaseInlineFormSet
from django.contrib import admin
from grappelli.forms import GrappelliSortableHiddenMixin

from django.db.models import Count

from .models import (
    AgeGroup, Level, Athlete, Event, Team, LEDSign, AthleteEvent
)


class AthleteEventAdmin(admin.ModelAdmin):
    model = AthleteEvent
    fields = ('athlete', 'event', 'difficulty_score', 'execution_score')
    list_display = ('athlete', 'event', 'difficulty_score', 'execution_score', 'total_score')


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
    list_display = ('athlete_id', 'last_name', 'first_name', 'team', 'level', 'age_group',)


class AgeGroupAdmin(admin.ModelAdmin):
    model = AgeGroup
    list_display = ('group', )


class LevelAdmin(admin.ModelAdmin):
    model = Level
    list_display = ('level', )


class LEDSignAdmin(admin.ModelAdmin):
    model = LEDSign
    list_display = ('sign_id', 'device', )


class EventAdmin(admin.ModelAdmin):
    model = Event
    list_display = ('name', 'order', )

admin.site.register(AgeGroup, AgeGroupAdmin)
admin.site.register(Level, LevelAdmin)
admin.site.register(Team, TeamAdmin)
admin.site.register(LEDSign, LEDSignAdmin)
admin.site.register(Event, EventAdmin)
admin.site.register(AthleteEvent, AthleteEventAdmin)
admin.site.register(Athlete, AthleteAdmin)
