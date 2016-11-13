import requests
import csv

from collections import OrderedDict
from dateutil import parser
from django.conf import settings
from django.contrib.admin import SimpleListFilter
from django.contrib.admin.models import LogEntry
from django.db.models import Count, Max
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib import admin, messages
from django.core.urlresolvers import reverse
from django import forms
from django.forms.models import BaseInlineFormSet
from django.http import HttpResponse
from django.shortcuts import render
from django.utils.translation import ugettext_lazy as _

from meet.admin import MeetDependentAdmin, MeetFilter

from competition.models import Event, GymnastEvent, Division, Session, update_rankings
from . import models
from . import forms as actionforms


def make_event_action(event):
    name = 'mark_{}'.format(event.initials)

    def action(modeladmin, req, qset):
        for item in qset:
            item.starting_event = event
            item.save()

    return (name, (action, name, "Set starting event to {}".format(event)))

# Filters


class StartingEventFilter(admin.SimpleListFilter):
    title = _('starting event')
    parameter_name = 'starting_event'

    def lookups(self, request, model_admin):
        lookups = [(s.id, s.name) for s in Event.objects.all()] #competition.Event
        lookups.append(('', '(None)'))
        return lookups

    def queryset(self, request, queryset):
        if self.value() is '':
            return queryset.filter(starting_event__isnull=True)
        elif self.value() is not None:
            return queryset.filter(starting_event__id=self.value())
        else:
            return queryset


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


class HighLevelFilter(SimpleListFilter):
    title = ('Level')
    parameter_name = 'level'

    def lookups(self, request, model_admin):
        qs = model_admin.get_queryset(request)
        return [(i, i) for i in qs.values_list('level__group', flat=True).distinct('level__group').order_by('level__group', 'level__order')]

    def queryset(self, request, queryset):
        if self.value():
            return queryset.filter(level__group=self.value())


class LevelFilter(SimpleListFilter):
    title = ('Level Division')
    parameter_name = 'level_div'

    def lookups(self, request, model_admin):
        qs = model_admin.get_queryset(request)
        return [(i, i) for i in qs.values_list('level__name', flat=True)
                                  .distinct().order_by('level__order')]

    def queryset(self, request, queryset):
        if self.value():
            return queryset.filter(level__name=self.value())


class GymnastMissingUsagFilter(SimpleListFilter):
    title = ('Missing USAG#')
    parameter_name = 'no_usag'

    def lookups(self, request, model_admin):
        return (('none', ('No USAG#')),)

    def queryset(self, request, queryset):
        if self.value() == 'none':
            return queryset.filter(usag='') | queryset.filter(usag__isnull=True)


class GymnastMissingDobFilter(SimpleListFilter):
    title = ('Missing Birth Date')
    parameter_name = 'no_dob'

    def lookups(self, request, model_admin):
        return (('none', ('No Birth Date')),)

    def queryset(self, request, queryset):
        if self.value() == 'none':
            return queryset.filter(dob__isnull=True)


class CoachMissingUsagFilter(SimpleListFilter):
    title = ('Missing USAG#')
    parameter_name = 'no_usag'

    def lookups(self, request, model_admin):
        return (('none', ('Missing USAG#s')),)

    def queryset(self, request, queryset):
        if self.value() == 'none':
            return (queryset.filter(usag='')
                    | queryset.filter(usag__isnull=True)
                    | queryset.filter(usag_expire_date='')
                    | queryset.filter(usag_expire_date__isnull=True)
                    | queryset.filter(safety_expire_date='')
                    | queryset.filter(safety_expire_date=True)
                    | queryset.filter(background_expire_date='')
                    | queryset.filter(background_expire_date=True))


# Admins


class LevelAdmin(MeetDependentAdmin):
    list_display = ('name', 'group', 'level', 'order')
    list_editable = ('order',)

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(LevelAdmin, self).get_fieldsets(request, obj)
        # If there's no active meet, hide fields until active meet has been set
        if request.session.get('meet', ''):
            fieldsets += ((None, {
                'fields': ('name', 'group', 'level', 'order'),
                'description': ''}), )
        return fieldsets


class CoachAdmin(MeetDependentAdmin):
    list_display = ('last_name', 'first_name', 'usag', 'team', 'has_usag', 'is_verified')
    list_filter = (MeetFilter, CoachMissingUsagFilter, 'team')
    search_fields = ('last_name', 'first_name', 'usag')
    # raw_id_fields = ('team',)
    # autocomplete_lookup_fields = {'fk': ['team']}

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(CoachAdmin, self).get_fieldsets(request, obj)
        # If there's no active meet, hide fields until active meet has been set
        if request.session.get('meet', ''):
            fieldsets += ((None, {
                'fields': ('first_name', 'last_name', 'usag', 'team', 'is_flagged', 'is_verified',
                           'usag_expire_date', 'safety_expire_date', 'background_expire_date', 'notes'),
                'description': ''}),
            )
        return fieldsets

    def has_usag(self, obj):
        missing = False
        if obj.usag_expire_date and obj.safety_expire_date and obj.background_expire_date:
            missing = True
        return missing
    has_usag.short_description = "USAG?"
    has_usag.boolean = True

    def has_add_permission(self, request, obj=None):
            return False


class GymnastEventInlineFormset(BaseInlineFormSet):
    def __init__(self, *args, **kwargs):
        super(GymnastEventInlineFormset, self).__init__(*args, **kwargs)
        self.can_delete = False


class GymnastEventInlineAdmin(admin.TabularInline):
    model = GymnastEvent
    formset = GymnastEventInlineFormset
    extra = 0
    max_num = 0
    readonly_fields = ('event', )
    fields = ('event', 'score',)
    classes = ('grp-collapse grp-closed', 'grp-collapse grp-open',)
    inline_classes = ('grp-collapse grp-closed',)


class GymnastAdmin(MeetDependentAdmin):
    list_display = ('last_name',
                    'first_name',
                    'show_team',
                    'athlete_id',
                    'usag',
                    'dob',
                    'level',
                    'age',
                    # 'division',
                    'show_age_division',
                    'shirt',
                    'session',
                    'starting_event',
                    'is_scratched',
                    'is_flagged',
                    'is_verified')
    list_filter = ['team',
                   GymnastMissingUsagFilter,
                   GymnastMissingDobFilter,
                   HighLevelFilter,
                   LevelFilter,
                   'team__team_awards',
                   StartingEventFilter,
                   SessionFilter,
                   'is_scratched',
                   'is_flagged', ]
    search_fields = ('last_name', 'first_name', 'usag', 'athlete_id')
    readonly_fields = ('team', 'age')
    raw_id_fields = ('team',)
    ordering = ('last_name', 'first_name')
    inlines = [GymnastEventInlineAdmin]

    def get_fieldsets(self, request, obj=None):
        # If there's no active meet, hide fields until active meet has been set
        fieldsets = super(GymnastAdmin, self).get_fieldsets(request, obj)
        if request.session.get('meet', ''):
            fieldsets += ((None, {'fields': ('team', 'first_name', 'last_name', 'usag', 'discipline', 'level', 'dob', 'age', 'shirt', 'notes'), }),
                         ('Checks', {'classes': ('grp-collapse grp-closed',),
                                     'fields': ('is_us_citizen', 'is_scratched', 'is_flagged', 'is_verified',), }),
                         ('Meet', {'classes': ('grp-collapse grp-closed',),
                                   'fields': ('athlete_id', 'age', 'division', 'starting_event', 'overall_score', 'tie_break', 'rank'), }), )
        return fieldsets

    def get_readonly_fields(self, request, obj=None):
        # copying this from MeetDependentAdmin because I need the empty value display to be different here (empty string)
        if self.fieldsets and self.fieldsets[0][1]['fields'][0] == 'meet' and models.Meet.objects.filter(is_current_meet=True).count() == 1:
            self.readonly_fields += ('meet',)
            self.empty_value_display = ''
            return self.readonly_fields
        else:
            return []

    def show_team(self, obj):
        return obj.team.team
    show_team.short_description = "Team"
    show_team.admin_order_field = 'team__team'

    def show_age_division(self, obj):
        return obj.division
    show_age_division.short_description = "Age Div."
    show_age_division.admin_order_field = 'division'

    def session(self, gymnast):
        return Session.objects.get(divisions=gymnast.division).name
    session.admin_order_field = 'division__session__name'

    def set_shirt_action(self, modeladmin, request, queryset):
        if 'do_action' in request.POST:
            form = actionforms.ShirtChoiceForm(request.POST)
            if form.is_valid():
                shirt = form.cleaned_data.get('shirt')
                updated = queryset.update(shirt=shirt)
                messages.success(request, '{} shirt sizes were updated'.format(updated))
                return
        else:
            form = actionforms.ShirtChoiceForm()

        return render(
            request,
            'admin/registration/action_tshirt.html',
            {'title': u'Choose tshirt size',
                'objects': queryset,
                'form': form})
    set_shirt_action.short_description = u'Update shirt size'

    def verify_with_usag(self, modeladmin, request, queryset):
        credentials = {
            'user': settings.USAG_USER,
            'pass': settings.USAG_PASS
        }

        members = []
        for member in queryset:
            if member.usag:
                members.append(member.usag)
            else:
                member.notes = 'missing usag id'
                member.is_flagged = True
                member.save()

        usag_max = settings.USAG_MAX_VERIFY
        chunks = [members[x:x + usag_max] for x in range(0, len(members), usag_max)]

        verified_count = 0
        failed_count = 0

        with requests.Session() as s:
            login = s.post(settings.USAG_LOGIN_URL, credentials)

            if login.status_code == 200:
                for chunk in chunks:

                    member_data = settings.USAG_VERIFY_DATA.copy()
                    member_data['memNumbers'] = ','.join(chunk)

                    r = s.post(settings.UASG_VERIFY_URL, member_data)
                    s.headers.update({'Accept': 'application/json, text/javascript, */*;'})

                    try:
                        rows = r.json()['aaData']
                        print('rows {}'.format(rows))

                        for row in rows:
                            division = level_division = ''
                            (usag_id, last_name, first_name, dob, member_type, level, club_id, club, club_status, status) = row

                            # handles jd level
                            if len(level) == 2:
                                pass
                            else:
                                # handles the old way of USAG levels, MLEVEL10
                                try:
                                    level = int(level[6:])
                                except:
                                    # handles the new way of USAG levels with divisions M7D1
                                    try:
                                        division = level[-2:]
                                        level = level[:-2]
                                        level = level[1:]
                                        level_division = '{}{}'.format(level, division)
                                    except:
                                        level = None

                            dob = parser.parse(dob).date()

                            try:
                                gymnast = models.Gymnast.objects.get(usag=usag_id)
                                notes = ""
                                valid = True
                                # print('*** {} and {} and {}'.format(str(gymnast.level.group), "".join(gymnast.level.name.split()).lower(), '{}{}'.format(level, division.lower()) ))

                                if last_name.lower() != gymnast.last_name.lower():
                                    valid = False
                                    notes += "Last name does not match USAG last name (USAG: {})\n".format(last_name)

                                if dob != gymnast.dob:
                                    valid = False
                                    notes += "Date of birth does not match USAG date of birth (USAG: {})\n".format(dob)

                                if str(level).lower() != str(gymnast.level.group).lower():
                                    valid = False
                                    notes += "Level does not match USAG level (USAG: {})\n".format(level)

                                if level_division and level_division.lower() != "".join(gymnast.level.name.split()).lower():
                                    valid = False
                                    notes += "Compulsory division does not match USAG level (USAG: {})\n".format(level_division)

                                if status.lower() != 'active':
                                    valid = False
                                    notes += "USAG member is not active (USAG: {})\n".format(status)

                                gymnast.notes = notes
                                gymnast.is_verified = valid
                                gymnast.is_flagged = not valid
                                gymnast.save()

                                if (valid):
                                    verified_count += 1
                                else:
                                    failed_count += 1

                            except:
                                failed_count += 1

                    except:
                        messages.error(request, 'Could not parse data from USAG verification service!')
                messages.success(request, 'Verified {} gymnasts, flagged {} gymnasts for review'.format(verified_count, failed_count))
            else:
                messages.error(request, 'Could not connect with USAG verification service. Check credentials.')
    verify_with_usag.short_description = "Verify selected gymnasts with USAG"

    def update_age(self, modeladmin, request, queryset):
        ''' competition age is based on gymnast age as of 5/31/yyyy '''
        rows_updated = 0
        for gymnast in queryset:
            if gymnast.dob is not None:
                gymnast.age = gymnast.competition_age
                gymnast.save()
                rows_updated += 1
            else:
                gymnast.age = None
                gymnast.save()

        if rows_updated == 1:
            message_bit = '1 gymnast\'s competition age was'
        else:
            message_bit = '{} gymnast\'s competition ages were'.format(rows_updated)
        messages.success(request, '{} updated'.format(message_bit))
    update_age.short_description = "Update competition age"

    def set_verified(self, modeladmin, request, queryset):
        rows_updated = queryset.update(is_verified=True)
        if rows_updated == 1:
            message_bit = '1 gymnast was'
        else:
            message_bit = '{} gymnasts were'.format(rows_updated)
        messages.success(request, '{} verified'.format(message_bit))
    set_verified.short_description = "Mark selected gymnasts as verified"

    # TODO: This should happen on save, not as an admin action
    def sort_into_divisions(self, modeladmin, request, queryset):
        ''' Admin action meant to be performed once on all athletes at once.
            However, it can be performed multiple times without harm, and also on only a few athletes.
        '''
        divisions_by_level = {}
        rows_updated = queryset.count()

        # Build dictionary of all divisions
        divisions = Division.objects.all()
        for d in divisions:
            if d.level not in divisions_by_level:
                divisions_by_level[d.level] = {}
            if d.min_age not in divisions_by_level[d.level]:
                for age in range(d.min_age, d.max_age + 1):
                    divisions_by_level[d.level][age] = d

        # Calc comptition age and retrieve correct division for age + level combination
        for gymnast in queryset:
            if gymnast.dob:
                try:
                    gymnast.division = divisions_by_level[gymnast.level][gymnast.competition_age]
                    gymnast.save()
                except:
                    messages.error(request, 'No division found for age: {1}, level: {2} ({0})'.format(gymnast, gymnast.competition_age, gymnast.level))

        if rows_updated == 1:
            message_bit = '1 age division was'
        else:
            message_bit = '{} age divisions were'.format(rows_updated)

        messages.success(request, '{} updated'.format(message_bit))
    sort_into_divisions.short_description = "Set age division"

    def set_athlete_id(self, modeladmin, request, queryset):
        ''' Admin action meant to be performed once on all athletes at once.
            However, it can be performed multiple times without harm, and also on only a few athletes.
        '''
        queryset = queryset.exclude(athlete_id__isnull=False, is_scratched=True).order_by('level', 'team', 'last_name')
        rows_updated = queryset.count()
        level_max_athlete_id = {}

        for a in queryset:
            # Check to see if we've calculated the max id for this level before.  If so, grab that id.
            if a.level.level not in level_max_athlete_id:
                max_id = models.Gymnast.objects.filter(level__level=a.level.level).aggregate(Max('athlete_id'))
                max_id = 0 if not max_id['athlete_id__max'] else max_id['athlete_id__max']
                # First one: ID begins with level number. level 4 = 4000
                print('**** level {} {}'.format(a.level.level, max_id))
                if max_id == 0:
                    # Accomodate the JD level
                    if a.level.level == 999:
                        max_id = 3 * 1000
                    elif a.level.level == 10:
                        max_id = 1000
                    else:
                        max_id = (int(a.level.level) * 1000)
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

    def create_events(self, modeladmin, req, qset):
        events = Event.objects.all() #competition.Event

        post_save.disconnect(
            None,
            sender=GymnastEvent,
            dispatch_uid='update_rankings')

        for gymnast in qset:
            print('creating events for {}'.format(gymnast))
            for event in events:
                ae, created = GymnastEvent.objects.get_or_create(event=event, gymnast=gymnast, meet=gymnast.meet)
                if gymnast.is_scratched:
                    ae.score = 0
                    ae.save()

        post_save.connect(
            update_rankings,
            sender=GymnastEvent,
            dispatch_uid='update_rankings')

    def clear_event(self, modeladmin, request, queryset):
        for item in queryset:
            item.starting_event = None
            item.save()
    clear_event.short_description = "Set starting event to empty"

    def get_actions(self, request):
        actions = [make_event_action(q) for q in Event.objects.all()] #competition.Event
        actions.insert(0, ('create_events', (self.create_events, 'create_events', 'Create events')))
        actions.insert(0, ('set_shirt_action', (self.set_shirt_action, 'set_shirt_action', 'Update shirt size')))
        actions.insert(0, ('set_athlete_id', (self.set_athlete_id, 'set_athlete_id', 'Set athlete id')))
        actions.insert(0, ('sort_into_divisions', (self.sort_into_divisions, 'sort_into_divisions', 'Set age division')))
        actions.insert(0, ('update_age', (self.update_age, 'update_age', 'Set competition age')))
        actions.insert(0, ('verify_with_usag', (self.verify_with_usag, 'verify_with_usag', 'Verify USAG info')))
        actions.append(('clear_event', (self.clear_event, 'clear_event', 'Set starting event to (None)')))
        return OrderedDict(actions)

    def has_add_permission(self, request, obj=None):
            return False


class CoachInline(admin.StackedInline):
    model = models.Coach
    exclude = ('notes', 'is_flagged', 'is_verified', 'meet')
    classes = ('grp-collapse grp-closed', 'grp-collapse grp-open',)
    inline_classes = ('grp-collapse grp-open',)
    extra = 1


class GymnastInline(admin.StackedInline):
    model = models.Gymnast
    ordering = ('is_scratched', 'level', 'last_name', 'first_name')
    readonly_fields = ('age',)
    fields = ('first_name',
              'last_name',
              'per_gymnast_cost',
              'discipline',
              'usag',
              'dob',
              'age',
              'is_us_citizen',
              'shirt',
              'level',
              'is_scratched',
              'is_flagged',
              'is_verified',
              'notes')
    classes = ('grp-collapse grp-closed', 'grp-collapse grp-open',)
    inline_classes = ('grp-collapse grp-closed',)
    extra = 1

    class Media:
        js = ('{}js/competitionAge.js'.format(settings.STATIC_URL),
              '{}js/moment.min.js'.format(settings.STATIC_URL))


class TeamAdmin(MeetDependentAdmin):
    list_display = ('team', 'gym', 'usag', 'contact_name', 'num_gymnasts', 'show_paid_in_full', 'city', 'state')
    list_filter = ('qualified', 'team_awards')
    filter_horizontal = ('team_awards', )
    readonly_fields = ('gymnast_cost', 'total_cost', 'team_award_cost',)
    search_fields = ('gym', 'team', 'usag')
    inlines = [CoachInline, GymnastInline]
    actions = ['export_with_notes', 'export_with_session']

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(TeamAdmin, self).get_fieldsets(request, obj)
        # If there's no active meet, hide fields until active meet has been set
        if request.session.get('meet', ''):
            fieldsets += ((None, {'fields': ('gym',
                                             'team',
                                             'usag',
                                             'per_team_award_cost',
                                             'team_awards',), }),
                         ('Payment', {'fields': ('gymnast_cost',
                                                 'team_award_cost',
                                                 'total_cost',
                                                 'paid_in_full', ), }),
                         ('Contact', {'fields': ('first_name',
                                                 'last_name',
                                                 'phone',
                                                 'email',
                                                 'address_1',
                                                 'address_2',
                                                 'city',
                                                 'state',
                                                 'postal_code',
                                                 'notes', ),
                                      'classes': ('grp-collapse grp-closed',), }), )
        return fieldsets

    def get_queryset(self, request):
        qs = super(TeamAdmin, self).get_queryset(request)
        return qs.annotate(num_gymnasts=Count('gymnasts'))

    def get_readonly_fields(self, request, obj=None):
        # copying this from MeetDependentAdmin because I need the empty value display to be different here (empty string)
        if self.fieldsets and self.fieldsets[0][1]['fields'][0] == 'meet' and models.Meet.objects.filter(is_current_meet=True).count() == 1:
            self.readonly_fields += ('meet',)
            self.empty_value_display = ''
            return self.readonly_fields
        else:
            return []

    def num_gymnasts(self, obj):
        return obj.gymnasts.filter(is_scratched=False).count()
    num_gymnasts.short_description = 'Team Size'
    num_gymnasts.admin_order_field = 'num_gymnasts'

    def export_with_session(self, request, queryset):
        """ Generic csv export admin action. """
        opts = self.model._meta
        response = HttpResponse(content_type='text/csv')
        team_name = queryset[0].team
        response['Content-Disposition'] = 'attachment; filename={}_bwi_roster.csv'.format(team_name)
        writer = csv.writer(response)

        field_names = ['team',
                       'last_name',
                       'first_name',
                       'usag',
                       'dob',
                       'age',
                       'shirt',
                       'is_scratched',
                       'level',
                       'division', ]
        with_session = field_names.copy()
        with_session.append('Session')
        # Write a first row with header information
        writer.writerow(with_session)

        # Write data rows
        for obj in queryset:
            gymnasts = models.Gymnast.objects.filter(team=obj).order_by('is_scratched', 'level', 'division', 'last_name')
            for gymnast in gymnasts:
                field_values = [getattr(gymnast, field) for field in field_names]
                try:
                    field_values.append(gymnast.division.session.first())
                except:
                    field_values.append(None)
                writer.writerow(field_values)
        return response
    export_with_session.short_description = "Export with session, as csv file"

    def export_with_notes(self, request, queryset):
        """ Generic csv export admin action. """
        opts = self.model._meta
        response = HttpResponse(content_type='text/csv')
        team_name = queryset[0].team
        response['Content-Disposition'] = 'attachment; filename={}_bwi_roster.csv'.format(team_name)
        writer = csv.writer(response)
        field_names = ['team',
                       'last_name',
                       'first_name',
                       'usag',
                       'dob',
                       'age',
                       'shirt',
                       'is_scratched',
                       'level',
                       'notes', ]
        # Write a first row with header information
        writer.writerow(field_names)
        # Write data rows
        for obj in queryset:
            gymnasts = models.Gymnast.objects.filter(team=obj).order_by('is_scratched', 'level', 'last_name')
            for gymnast in gymnasts:
                field_values = [getattr(gymnast, field) for field in field_names]
                writer.writerow(field_values)
        return response
    export_with_notes.short_description = "Export with notes, as csv file"

    def show_paid_in_full(self, obj):
        return obj.paid_in_full
    show_paid_in_full.short_description = "Paid in Full"


class LogAdmin(admin.ModelAdmin):
    """Create an admin view of the history/log table"""
    list_display = ('action_time', 'user', 'content_type', 'change_message', 'is_addition', 'is_change', 'is_deletion')
    list_filter = ['action_time', 'user', 'content_type']
    ordering = ('-action_time',)
    readonly_fields = ['user', 'content_type', 'object_id', 'object_repr', 'action_flag', 'change_message']

    # We don't want people changing this historical record:
    def has_add_permission(self, request):
        return False

    def has_change_permission(self, request, obj=None):
        # returning false causes table to not show up in admin page :-(
        # I guess we have to allow changing for now
        return True

    def has_delete_permission(self, request, obj=None):
        return False
LogEntry.is_addition.boolean = True
LogEntry.is_change.boolean = True
LogEntry.is_deletion.boolean = True


class PricingAdmin(MeetDependentAdmin):
    pass

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(PricingAdmin, self).get_fieldsets(request, obj)
        fieldsets += ((None, {
            'fields': ('name', 'price'),
            'description': ''}),
        )
        return fieldsets


admin.site.register(LogEntry, LogAdmin)
admin.site.register(models.Gymnast, GymnastAdmin)
admin.site.register(models.Level, LevelAdmin)
admin.site.register(models.Coach, CoachAdmin)
admin.site.register(models.Team, TeamAdmin)
admin.site.register(models.ShirtSize)
