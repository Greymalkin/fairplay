import csv
import math

from datetime import date, timedelta
from collections import OrderedDict

from django import forms
from django.forms.models import BaseInlineFormSet
from django.contrib import admin, messages
from django.conf import settings
from django.db.models.signals import pre_save, post_save
from django.db.models import Count, Sum, Max
from django.dispatch import receiver
from django.http import HttpResponse
from grappelli.forms import GrappelliSortableHiddenMixin

from . import models
from meet.models import Meet
from registration.models import Level

from django.utils.translation import ugettext_lazy as _

MEET = Meet.objects.filter(is_current_meet=True)


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


def make_event_action(event):
    name = 'mark_%s' % event

    def action(modeladmin, req, qset):
        for item in qset:
            item.starting_event = event
            item.save()

    return (name, (action, name, "Set starting event to {}".format(event)))


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


class SessionFilter(admin.SimpleListFilter):
    # Human-readable title which will be displayed in the
    # right admin sidebar just above the filter options.
    title = _('session')

    # Parameter for the filter that will be used in the URL query.
    parameter_name = 'session'

    def lookups(self, request, model_admin):
        return [(s.id, s.name) for s in models.Session.objects.filter(meet=MEET)]

    def queryset(self, request, queryset):
        if self.value() is not None:
            return queryset.filter(division__session__id=self.value())
        else:
            return queryset


class LevelFilter(admin.SimpleListFilter):
    title = _('level')
    parameter_name = 'level'

    def lookups(self, request, model_admin):
        return [(s.id, s.level) for s in Level.objects.filter(meet=MEET)]

    def queryset(self, request, queryset):
        if self.value() is not None:
            return queryset.filter(level__id=self.value())
        else:
            return queryset


class DivisionFilter(admin.SimpleListFilter):
    title = _('division')
    parameter_name = 'division'

    def lookups(self, request, model_admin):
        return [(s.id, s.name) for s in models.Division.objects.filter(meet=MEET)]

    def queryset(self, request, queryset):
        value = self.value()
        if value is not None:
            return queryset.filter(division__id=value)
        else:
            return queryset


class TeamFilter(admin.SimpleListFilter):
    title = _('team')
    parameter_name = 'team'

    def lookups(self, request, model_admin):
        return [(s.id, s.team) for s in models.Team.objects.filter(meet=MEET)]

    def queryset(self, request, queryset):
        value = self.value()
        if value is not None:
            return queryset.filter(team__id=value)
        else:
            return queryset


class StartingEventFilter(admin.SimpleListFilter):
    title = _('starting event')
    parameter_name = 'event'

    def lookups(self, request, model_admin):
        lookups = [(s.id, s.name) for s in models.Event.objects.filter(meet=MEET)]
        lookups.append(('', '(None)'))
        return lookups

    def queryset(self, request, queryset):
        if self.value() is '':
            return queryset.filter(starting_event__isnull=True)
        elif self.value() is not None:
            return queryset.filter(starting_event__id=self.value())
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
    fields = ('usag', 'athlete_id', 'is_scratched', 'last_name', 'first_name', 'team',
              'dob', 'age', 'division', 'starting_event', 'overall_score', 'rank', 'tie_break' )
    readonly_fields = ('overall_score', 'rank', 'tie_break')
    list_filter = (TeamFilter, DivisionFilter, LevelFilter, SessionFilter, StartingEventFilter)
    list_per_page = 50

    def get_actions(self, request):
        actions = [make_event_action(q) for q in models.Event.objects.filter(meet=MEET)]
        actions.insert(0, ('create_events', (self.create_events, 'create_events', '03. Create events for athlete')))
        actions.insert(0, ('sort_into_divisions', (self.sort_into_divisions, 'sort_into_divisions', '02. Set age division')))
        actions.insert(0, ('set_athlete_id', (self.set_athlete_id, 'set_athlete_id', '01. Set athlete id')))
        actions.append(('clear_event', (self.clear_event, 'clear_event', 'Set starting event to (None)')))
        actions.append(('export_as_csv', (export_as_csv, 'export_as_csv', 'Export selected objects as csv file')))
        actions.append(('export_with_session', (self.export_with_session, 'export_with_session', 'Export selected gymnasts as csv file with session')))
        return OrderedDict(actions)

    def create_events(self, modeladmin, req, qset):
        events = models.Event.objects.filter(meet=qset[0].meet)

        post_save.disconnect(
            None,
            sender=models.AthleteEvent,
            dispatch_uid='update_rankings')

        for athlete in qset:
            print('creating events for {}'.format(athlete))
            for event in events:
                ae = models.AthleteEvent.objects.get_or_create(event=event, gymnast=athlete)
                if athlete.is_scratched:
                    ae.score = 0
                    ae.save()

        post_save.connect(
            models.update_rankings,
            sender=models.AthleteEvent,
            dispatch_uid='update_rankings')

    def clear_event(self, modeladmin, request, queryset):
        for item in queryset:
            item.starting_event = None
            item.save()
    clear_event.short_description = "Set starting event to empty"

    def session(self, athlete):
        return models.Session.objects.get(divisions=athlete.division).name
    session.admin_order_field = 'division__session__name'

    def get_queryset(self, request):
        qs = super(AthleteAdmin, self).get_queryset(request)
        qs = qs.annotate(aa=Sum('events__score'))
        return qs

    def get_list_display(self, request):
        result = ['athlete_id', 'last_name', 'first_name', 'show_team', 'division', 'session', 'starting_event']
        events = models.Event.objects.filter(meet=MEET)
        result += [e.initials for e in events]
        result += ['all_around', ]
        return result

    def all_around(self, obj):
        return obj.aa
    all_around.admin_order_field = 'aa'
    all_around.short_description = 'AA'

    def __getattr__(self, attr):
        event = models.Event.objects.get(initials=attr, meet=MEET)
        def get_score(athlete):
            return athlete.events.get(event=event).score
        get_score.short_description = attr.upper()
        return get_score

    def show_team(self, obj):
        return obj.team.team
    show_team.short_description = "Team"
    show_team.admin_order_field = 'team__team'

    def set_athlete_id(self, modeladmin, request, queryset):
        ''' Admin action meant to be performed once on all athletes at once.
            However, it can be performed multiple times without harm, and also on only a few athletes.
        '''
        queryset = queryset.exclude(athlete_id__isnull=False, is_scratched=True).order_by('level', 'team', 'last_name')
        rows_updated = queryset.count()
        level_max_athlete_id = {}

        for a in queryset:
            # Check to see if we've calculated the max id for this level before.  If so, grab that id.
            if a.level.level  not in level_max_athlete_id:
                max_id = models.Athlete.objects.filter(level=a.level, meet=a.meet).aggregate(Max('athlete_id'))
                max_id = 0 if not max_id['athlete_id__max'] else max_id['athlete_id__max']
                # First one: ID begins with level number. level 4 = 400
                if max_id == 0:
                    max_id = (int(a.level.level) * 100)
            else:
                max_id = level_max_athlete_id[a.level.level]

            # Up the max id by one and save to athlete
            max_id += 1
            level_max_athlete_id[a.level.level] = max_id
            a.athlete_id = max_id
            a.save()

        if rows_updated == 1:
            message_bit = '1 athelete id was'
        else:
            message_bit = '{} athlete ids were'.format(rows_updated)

        messages.success(request, '{} updated'.format(message_bit))
    set_athlete_id.short_description = "Set athlete id"

    def sort_into_divisions(self, model_admin, request, queryset):
        ''' Admin action meant to be performed once on all athletes at once.
            However, it can be performed multiple times without harm, and also on only a few athletes.
        '''
        meet = Meet.objects.get(is_current_meet=True)
        divisions_by_level = {}
        rows_updated = queryset.count()

        # Build dictionary of all divisions
        divisions = models.Division.objects.filter(meet=meet)
        for d in divisions:
            if d.level.level not in divisions_by_level:
                divisions_by_level[d.level.level] = {}
            if d.min_age not in divisions_by_level[d.level.level]:
                for age in range(d.min_age, d.max_age+1):
                    divisions_by_level[d.level.level][age] = d

        # Calc comptition age and retrieve correct division for age + level combination
        for athlete in queryset:
            if athlete.dob:
                try:
                    age = self.competition_age(athlete, meet)
                    athlete.division = divisions_by_level[athlete.level.level][age]
                    athlete.save()
                except:
                    messages.error(request, 'No division found for age: {1}, level: {2} ({0})'.format(athlete, age, athlete.level))

        if rows_updated == 1:
            message_bit = '1 athelete division was'
        else:
            message_bit = '{} athlete divisions were'.format(rows_updated)

        messages.success(request, '{} updated'.format(message_bit))
    sort_into_divisions.short_description = "Set athlete id"

    @staticmethod
    def competition_age(gymnast, meet):
        if meet.date.month > 8:
            year = meet.date.year
        else:
            year = meet.date.year - 1
        cutoff = date(year, settings.COMPETITION_MONTH, settings.COMPETITION_DATE)
        age = (cutoff - gymnast.dob) // timedelta(days=365.2425)
        return age

    def export_with_session(self, modeladmin, request, queryset):
        """ Generic csv export admin action. """
        opts = self.model._meta
        response = HttpResponse(content_type='text/csv')
        team_name = queryset[0].team.team
        response['Content-Disposition'] = 'attachment; filename={}_bwi_roster.csv'.format(team_name)
        writer = csv.writer(response)
        field_names = ['team', 'usag', 'last_name', 'first_name', 'dob', 'age', 'shirt',  'meet', 'level', 'division', ]
        with_session = field_names.copy()
        with_session.append('Session')
        # Write a first row with header information
        writer.writerow(with_session)
        # Write data rows
        for obj in queryset:
            field_values = [getattr(obj, field) for field in field_names]
            field_values.append(obj.division.session.first())
            writer.writerow(field_values)
        return response
    export_with_session.short_description = "Export selected gymnasts as csv file with session"


class AthleteInlineAdmin(admin.TabularInline):
    model = models.Athlete
    extra = 1
    fields = ('athlete_id', 'last_name', 'first_name', 'starting_event')


class TeamAwardForm(forms.ModelForm): 
    def __init__(self, *args, **kwargs):
        super(TeamAwardForm, self).__init__(*args, **kwargs)
        wtf = Level.objects.filter(meet=MEET);
        self.fields['levels'].widget.choices = [(choice.id, choice.level) for choice in wtf]


class TeamAwardAdmin(admin.ModelAdmin):
    form = TeamAwardForm
    list_display = ('name', 'award_count', 'order', )
    filter_horizontal = ('levels',)
    exclude = ('meet',)
    list_editable = ('order',)

    class Media:
        css = {
            "all": ("{}css/filter-horizontal-adjustment.css".format(settings.STATIC_URL),)
        }


class TeamAwardRankAdmin(admin.ModelAdmin):
    list_display = ('team', 'team_award', 'rank', 'score')

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(TeamAwardRankAdmin, self).get_queryset(request)
        return qs.filter(team_award__meet=MEET)


class TeamAwardRankAthleteEventAdmin(admin.ModelAdmin):
    list_display = ('team_award_rank', 'event', 'athlete_event', 'rank')

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(TeamAwardRankAthleteEventAdmin, self).get_queryset(request)
        return qs.filter(event__meet=MEET)


class AthleteEventAdmin(admin.ModelAdmin):
    fields = ('gymnast', 'event', 'score',)
    list_display = ('gymnast', 'event', 'score',)
    search_fields = ['gymnast', 'id', ]

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(AthleteEventAdmin, self).get_queryset(request)
        meet = models.Meet.objects.filter(is_current_meet=True)
        return qs.filter(event__meet=meet)


def meet_awards_percentage(modeladmin, request, queryset):
    meet = models.Meet.objects.filter(is_current_meet=True)[0]
    for division in queryset:
        division.event_award_count = math.ceil(len(division.athletes.all()) * meet.event_award_percentage)
        division.all_around_award_count = math.ceil(len(division.athletes.all()) * meet.all_around_award_percentage)
        division.save()
meet_awards_percentage.short_description = "Set to meet awards percentage"


class DivisionAdmin(admin.ModelAdmin):
    list_display = ('name', 'level', 'num_gymnasts', 'min_age', 'max_age', 'event_award_count', 'all_around_award_count')
    list_editable = ('min_age', 'max_age', 'event_award_count', 'all_around_award_count')
    ordering = ('level', 'min_age')
    exclude = ('meet',)
    actions = [meet_awards_percentage, ]

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


class SessionForm(forms.ModelForm): 
    def __init__(self, *args, **kwargs):
        super(SessionForm, self).__init__(*args, **kwargs)
        meet = Meet.objects.filter(is_current_meet=True)
        wtf = models.Division.objects.filter(meet=meet);
        self.fields['divisions'].widget.choices = [(choice.id, choice.__str__()) for choice in wtf]


class SessionAdmin(admin.ModelAdmin):
    form = SessionForm
    list_display = ('name', 'num_gymnasts', 'warmup')
    filter_horizontal = ('divisions',)
    exclude = ('meet',)

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(SessionAdmin, self).get_queryset(request)
        meet = models.Meet.objects.filter(is_current_meet=True)
        return qs.filter(meet=meet)

    class Media:
        css = {
            "all": ("{}css/filter-horizontal-adjustment.css".format(settings.STATIC_URL),)
        }


class LEDSignAdmin(admin.ModelAdmin):
    list_display = ('name', 'device', 'connect')

    def connect(self, obj):
        return '<a href="#" onClick="connectSign({});">Connect Sign</a>'.format(obj.device)

    connect.allow_tags = True

    class Media:
        js = ("/static/js/ledsign.js",)


class LEDShowMessageInline(admin.TabularInline):
    model = models.LEDShowMessage
    fields = ('led_sign', 'message')
    extra = 0
    min_num = 6


class LEDShowAdmin(admin.ModelAdmin):
    model = models.LEDShow
    list_display = ('name',)
    inlines = (LEDShowMessageInline, )
    fieldsets = ((None, {
        'fields': ('name',),
        'description': LED_SIGN_CODES
    }),
    )


# admin.site.register(models.Division, DivisionAdmin)
# admin.site.register(models.LEDSign, LEDSignAdmin)
# admin.site.register(models.Event, EventAdmin)
# admin.site.register(models.AthleteEvent, AthleteEventAdmin)
# admin.site.register(models.LEDShow, LEDShowAdmin)
# admin.site.register(models.Session, SessionAdmin)
# admin.site.register(models.Athlete, AthleteAdmin)
# admin.site.register(models.TeamAward, TeamAwardAdmin)
# admin.site.register(models.TeamAwardRank, TeamAwardRankAdmin)
# admin.site.register(models.TeamAwardRankAthleteEvent, TeamAwardRankAthleteEventAdmin)
# admin.site.add_action(export_as_csv)


# @receiver(pre_save, sender=models.TeamAward, dispatch_uid='save_current_meet_award')
# @receiver(pre_save, sender=models.Division, dispatch_uid='save_current_meet_division')
# @receiver(pre_save, sender=models.Event, dispatch_uid='save_current_meet_event')
# @receiver(pre_save, sender=models.Session, dispatch_uid='save_current_meet_session')
# @receiver(pre_save, sender=models.TeamAward, dispatch_uid='save_current_meet_teamaward')
# @receiver(pre_save, sender=models.Athlete, dispatch_uid='save_current_meet_athlete')
# def save_current_meet(sender, instance, **kwargs):
#     meet = models.Meet.objects.get(is_current_meet=True)
#     instance.meet = meet
