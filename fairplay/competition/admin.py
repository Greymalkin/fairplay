import csv
import math

from django.forms.models import BaseInlineFormSet
from django.contrib import admin
from django.conf import settings
from django.db.models import Sum
from django.http import HttpResponse

from . import models
from meet.views import get_meet
from meet.admin import MeetDependentAdmin
from registration.models import Level

from django.utils.translation import ugettext_lazy as _

LED_SIGN_CODES = """
    The following are special codes you can use to customize the LED sign display<br>
    <strong>MODES (defaults to rotate)<strong><br>
    |MODE_ROTATE|
    |MODE_HOLD|
    |MODE_FLASH|
    |MODE_ROLL_UP|
    |MODE_ROLL_DOWN|
    |MODE_ROLL_LEFT|
    |MODE_ROLL_RIGHT|
    |MODE_WIPE_UP|
    |MODE_WIPE_DOWN|
    |MODE_WIPE_RIGHT|
    |MODE_SCROLL|
    |MODE_AUTO_MODE|
    |MODE_ROLL_IN|
    |MODE_ROLL_OUT|
    |MODE_WIPE_IN|
    |MODE_WIPE_OUT|
    |MODE_TWINKLE|
    |MODE_SPARKLE|
    |MODE_SNOW|
    |MODE_INTERLOCK|
    |MODE_SWITCH|

"""


def export_as_csv(self, request, queryset):
    """ Generic csv export admin action. """
    opts = self.model._meta
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename={}.csv'.format(str(opts).replace('.', '_'))
    writer = csv.writer(response)
    field_names = [field.name for field in opts.fields]
    # Write a first row with header information
    writer.writerow(field_names)
    # Write data rows
    for obj in queryset:
        writer.writerow([getattr(obj, field) for field in field_names])
    return response
export_as_csv.short_description = "Export selected objects as csv file"


# Filters

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


class LevelFilter(admin.SimpleListFilter):
    title = _('level')
    parameter_name = 'level'

    def lookups(self, request, model_admin):
        return [(s['level'], s['group']) for s in Level.objects.all().values('level', 'group').distinct().order_by('level')]

    def queryset(self, request, queryset):
        if self.value() is not None:
            return queryset.filter(level__level=self.value())
        else:
            return queryset


class LevelDivisionFilter(admin.SimpleListFilter):
    title = _('level division')
    parameter_name = 'level_division'

    def lookups(self, request, model_admin):
        return [(s.id, s.name) for s in Level.objects.all()]

    def queryset(self, request, queryset):
        if self.value() is not None:
            return queryset.filter(level__id=self.value())
        else:
            return queryset


class AgeDivisionFilter(admin.SimpleListFilter):
    title = _('age division')
    parameter_name = 'age_division'

    def lookups(self, request, model_admin):
        return [(s.id, s) for s in models.Division.objects.all()]

    def queryset(self, request, queryset):
        value = self.value()
        if queryset and value is not None:
            return queryset.filter(division__id=value)
        else:
            return queryset


class TeamFilter(admin.SimpleListFilter):
    title = _('team')
    parameter_name = 'team'

    def lookups(self, request, model_admin):
        return [(s.id, s.team) for s in models.Team.objects.all()]

    def queryset(self, request, queryset):
        value = self.value()
        if value is not None:
            return queryset.filter(team__id=value)
        else:
            return queryset


class StartingEventFilter(admin.SimpleListFilter):
    title = _('starting event')
    parameter_name = 'starting_event'

    def lookups(self, request, model_admin):
        lookups = [(s.id, s.name) for s in models.Event.objects.filter(active=True)]  # competition.Event
        lookups.append(('', '(None)'))
        return lookups

    def queryset(self, request, queryset):
        if self.value() is '':
            return queryset.filter(starting_event__isnull=True)
        elif self.value() is not None:
            return queryset.filter(starting_event__id=self.value())
        else:
            return queryset


class GymnastEventFilter(admin.SimpleListFilter):
    title = _('gymnast event')
    parameter_name = 'gymnast_event'

    def lookups(self, request, model_admin):
        lookups = [(s.id, s.name) for s in models.Event.objects.filter(active=True)]  # competition.Event
        return lookups

    def queryset(self, request, queryset):
        if self.value() is not None:
            return queryset.filter(event__id=self.value())
        else:
            return queryset


# Admins

class GymnastEventInlineFormset(BaseInlineFormSet):
    def __init__(self, *args, **kwargs):
        super(GymnastEventInlineFormset, self).__init__(*args, **kwargs)
        self.can_delete = False


class GymnastEventInlineAdmin(admin.TabularInline):
    model = models.GymnastEvent
    formset = GymnastEventInlineFormset
    extra = 0
    max_num = 0
    readonly_fields = ('event', )
    fields = ('event', 'score',)
    verbose_name_plural = 'Gymnast Events'


@admin.register(models.Gymnast)
class GymnastAdmin(MeetDependentAdmin):
    ''' Base admin for the Mens Artistic and Women's Artistic admins. '''
    search_fields = ['athlete_id', 'last_name', 'first_name']
    inlines = (GymnastEventInlineAdmin, )
    readonly_fields = ('overall_score', 'rank', 'place', 'tie_break', 'age', 'team')
    list_filter = (TeamFilter, SessionFilter, StartingEventFilter, AgeDivisionFilter, LevelFilter, LevelDivisionFilter)
    list_per_page = 50
    list_display = ['athlete_id', 'last_name', 'first_name', 'show_team', 'division', 'session', 'starting_event']

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(GymnastAdmin, self).get_fieldsets(request, obj)
        fieldsets += (
            (None, {'fields': ('discipline', 'athlete_id', 'usag', 'last_name', 'first_name', 'team', ), }),
            ('Meet',
                {'fields':
                    ('is_scratched',
                     'age',
                     'division',
                     'level',
                     'starting_event',
                     'overall_score',
                     'rank',
                     'place',
                     'tie_break', ), }), )
        return fieldsets

    def get_readonly_fields(self, request, obj=None):
        # copying this from MeetDependentAdmin because I need the empty value display to be different here (empty string)
        # models.Meet.objects.filter(is_current_meet=True)[0]
        # if self.fieldsets and self.fieldsets[0][1]['fields'][0] == 'meet' and request.session.get('meet', ''):
        if self.fieldsets and self.fieldsets[0][1]['fields'][0] == 'meet' and models.Meet.objects.filter(is_current_meet=True).count() == 1:
            self.readonly_fields += ('meet',)
            self.empty_value_display = ''
            return self.readonly_fields
        else:
            return []

    def session(self, gymnast):
        if gymnast.division:
            return models.Session.objects.get(divisions=gymnast.division).name
        return '-'
    session.admin_order_field = 'division__session__name'

    def get_queryset(self, request):
        qs = super(GymnastAdmin, self).get_queryset(request)
        qs = qs.annotate(aa=Sum('events__score'))
        return qs

    def all_around(self, obj):
        return '{:.1f}'.format(obj.aa)
    all_around.admin_order_field = 'aa'
    all_around.short_description = 'AA'

    def show_team(self, obj):
        return obj.team.team
    show_team.short_description = "Team"
    show_team.admin_order_field = 'team__team'

    def has_add_permission(self, request, obj=None):
            return False


@admin.register(models.MensArtisticGymnast)
class MensArtisticGymnastAdmin(GymnastAdmin):
    pass

    def get_list_display(self, request):
        result = ['athlete_id',
                  'last_name',
                  'first_name',
                  'show_team',
                  'division',
                  'session',
                  'starting_event',
                  'fx',
                  'ph',
                  'sr',
                  'vt',
                  'pb',
                  'hb']
        result += ['all_around', ]
        return result


@admin.register(models.WomensArtisticGymnast)
class WomensArtisticGymnastAdmin(GymnastAdmin):
    pass

    def get_list_display(self, request):
        result = ['athlete_id',
                  'last_name',
                  'first_name',
                  'show_team',
                  'division',
                  'session',
                  'starting_event',
                  'vt',
                  'ub',
                  'bb',
                  'fx']
        result += ['all_around', ]
        return result


@admin.register(models.TeamAward)
class TeamAwardAdmin(MeetDependentAdmin):
    list_display = ('name', 'award_count', 'number_qualified_teams', 'order',)
    filter_horizontal = ('levels',)
    list_editable = ('order',)

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(TeamAwardAdmin, self).get_fieldsets(request, obj)
        # If there's no active meet, hide fields until active meet has been set
        if request.session.get('meet', ''):
            fieldsets += ((None, {
                'fields': ('name', 'levels', 'award_count', 'order',),
                'description': ''}), )
        return fieldsets

    def number_qualified_teams(self, obj):
        qualified_teams = obj.qualified_teams()
        return qualified_teams.count()
    number_qualified_teams.short_description = '# Qualified Teams'


@admin.register(models.TeamAwardRank)
class TeamAwardRankAdmin(MeetDependentAdmin):
    list_display = ('team', 'team_award', 'rank', 'score')
    list_filter = ['team', 'team_award']

    def has_add_permission(self, request, obj=None):
        return False


@admin.register(models.TeamAwardRankEvent)
class TeamAwardRankEventAdmin(MeetDependentAdmin):
    list_display = ('team_award_rank', 'event', 'gymnast_event', 'rank')
    list_filter = ['team_award_rank__team', GymnastEventFilter]
    search_fields = ['gymnast_event__gymnast__first_name', 'gymnast_event__gymnast__last_name']

    def has_add_permission(self, request, obj=None):
        return False


@admin.register(models.GymnastEvent)
class GymnastEventAdmin(MeetDependentAdmin):
    list_display = ('gymnast', 'event', 'score', 'rank', 'place')
    list_filter = [GymnastEventFilter]
    search_fields = ['gymnast__first_name', 'gymnast__last_name', 'id', ]

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(GymnastEventAdmin, self).get_fieldsets(request, obj)
        # If there's no active meet, hide fields until active meet has been set
        if request.session.get('meet', ''):
            fieldsets += ((None, {
                'fields': ('gymnast', 'event', 'score', 'rank', 'place'),
                'description': ''}), )
        return fieldsets

    def has_add_permission(self, request, obj=None):
        return False


@admin.register(models.Division)
# TODO: Come back to this one
class DivisionAdmin(MeetDependentAdmin):
    list_display = ('name', 'level', 'num_gymnasts', 'min_age', 'max_age', 'event_award_count', 'all_around_award_count')
    list_editable = ('min_age', 'max_age', 'event_award_count', 'all_around_award_count')
    ordering = ('level', 'min_age')
    actions = ['meet_awards_percentage', ]
    list_filter = ['level']

    def meet_awards_percentage(self, request, queryset):
        # Make sure to exclude scratched gymnasts when running the award count
        for division in queryset:
            division.event_award_count = math.ceil(division.gymnasts.filter(is_scratched=False).count() * division.meet.event_award_percentage)
            division.all_around_award_count = math.ceil(division.gymnasts.filter(is_scratched=False).count() * division.meet.all_around_award_percentage)
            division.save()
    meet_awards_percentage.short_description = "Calculate AA & event awards from %%s in Meet admin"

    def get_queryset(self, request):
        # TODO: annotate query with num_gymnasts, so the column can be sortable in the admin
        qs = super(DivisionAdmin, self).get_queryset(request)
        return qs

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(DivisionAdmin, self).get_fieldsets(request, obj)
        # If there's no active meet, hide fields until active meet has been set
        if request.session.get('meet', ''):
            fieldsets += ((None, {
                'fields': ('level', 'name', 'short_name', 'min_age', 'max_age', 'event_award_count', 'all_around_award_count'),
                'description': ''}), )
        return fieldsets


@admin.register(models.Event)
class EventAdmin(admin.ModelAdmin):
    list_display = ('name', 'initials', 'order', 'is_mag', 'is_wag', 'active')
    actions = ['toggle_mag_wag']

    def toggle_mag_wag(self, request, queryset):
        for event in queryset:
            # Don't let this work on trampoline events
            if not (event.is_wag is False and event.is_mag is False):
                event.is_wag = False if event.is_wag else True
                event.is_mag = False if event.is_mag else True
                event.active = False if event.active else True
                event.save()
    toggle_mag_wag.short_description = "Switch active events, mens and womens"


@admin.register(models.Session)
class SessionAdmin(MeetDependentAdmin):
    list_display = ('name', 'num_gymnasts', 'warmup', 'session_start', 'timed_warmup_start', 'presentation_start', 'competition_start', )
    filter_horizontal = ('divisions',)

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(SessionAdmin, self).get_fieldsets(request, obj)
        # If there's no active meet, hide fields until active meet has been set
        if request.session.get('meet', ''):
            fieldsets += ((None, {
                'fields': ('name',
                           'divisions',
                           'warmup',
                           'session_start',
                           'timed_warmup_start',
                           'presentation_start',
                           'competition_start'),
                'description': ''}), )
        return fieldsets


@admin.register(models.ScoreRankEvent)
class ScoreRankEventAdmin(MeetDependentAdmin):
    list_display = ('gymnast', 'fx', 'ph', 'sr', 'vt', 'pb', 'hb', 'ub', 'bb')
    search_fields = ['gymnast__last_name', 'gymnast__first_name', 'gymnast__usag']


@admin.register(models.LEDSign)
class LEDSignAdmin(admin.ModelAdmin):
    list_display = ('name', 'device', 'connect')

    def connect(self, obj):
        return '<a href="#" onClick="connectSign({});">Connect Sign</a>'.format(obj.device)
    connect.allow_tags = True

    class Media:
        js = ("{}js/ledsign.js".format(settings.STATIC_URL),)


class LEDShowMessageInline(admin.TabularInline):
    model = models.LEDShowMessage
    fields = ('led_sign', 'message')
    extra = 0
    min_num = 6


@admin.register(models.LEDShow)
class LEDShowAdmin(admin.ModelAdmin):
    model = models.LEDShow
    list_display = ('name',)
    inlines = (LEDShowMessageInline, )
    fieldsets = ((None, {
        'fields': ('name',),
        'description': LED_SIGN_CODES}), )
