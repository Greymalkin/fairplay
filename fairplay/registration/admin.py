import requests
import csv
import datetime

from collections import OrderedDict
from django.conf import settings
from django.contrib.admin import SimpleListFilter
from django.contrib.admin.models import LogEntry
from django.db.models import Count, Max, Q
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib import admin, messages
from django.core.urlresolvers import reverse
from django.forms.models import BaseInlineFormSet
from django.forms import TextInput, Textarea
from django.http import HttpResponse
from django.utils.safestring import mark_safe
from django.shortcuts import render
from django.utils.translation import ugettext_lazy as _

from meet.admin import MeetDependentAdmin

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


class DisciplineFilter(admin.SimpleListFilter):
    title = _('discipline')
    parameter_name = 'discipline'

    def lookups(self, request, model_admin):
        lookups = [('mag', 'Men\'s Artistic'), ('wag', 'Women\'s Artistic')]
        return lookups

    def queryset(self, request, queryset):
        if self.value() is not None:
            return queryset.filter(discipline=self.value())
        return queryset


class StartingEventFilter(admin.SimpleListFilter):
    title = _('starting event')
    parameter_name = 'starting_event'

    def lookups(self, request, model_admin):
        lookups = [(s.id, s.name) for s in Event.objects.filter(active=True)]  # competition.Event
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


# Admins


@admin.register(models.Level)
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


@admin.register(models.Coach)
class CoachAdmin(MeetDependentAdmin):
    list_display = ('last_name', 'first_name', 'usag', 'team', 'has_usag', 'is_verified')
    list_filter = ['team']
    search_fields = ('last_name', 'first_name', 'usag')
    actions = ['export_as_csv']

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
    has_usag.short_description = "Safety/Exp/Bkgnd"
    has_usag.boolean = True

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
    export_as_csv.short_description = "Export as csv file"

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
    verbose_name_plural = 'Gymnast Events'


class GymnastNoteInlineAdmin(admin.TabularInline):
    model = models.GymnastNotes
    extra = 0
    exclude = ['meet']
    verbose_name_plural = 'Internal Notes'
    readonly_fields = ['created']
    fields = ['author', 'note', 'created']
    classes = ('grp-collapse grp-open', 'grp-collapse grp-closed', )
    inline_classes = ('grp-collapse grp-open',)

    def created(self, obj):
        return obj.created


@admin.register(models.Gymnast)
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
                   DisciplineFilter,
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
    readonly_fields = ('link_team', 'age')
    raw_id_fields = ('team',)
    ordering = ('last_name', 'first_name')
    inlines = [GymnastNoteInlineAdmin, GymnastEventInlineAdmin]

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(GymnastAdmin, self).get_fieldsets(request, obj)
        # If there's no active meet, hide fields until active meet has been set
        if request.session.get('meet', ''):
            fieldsets += (
                (None, {'fields': (
                    'link_team',
                    ('first_name', 'last_name'),
                    ('usag', 'discipline',),
                    ('dob', 'age',),
                    'level',
                    'shirt',
                    ('is_us_citizen', 'is_verified', 'is_scratched', 'is_flagged',), ), }),
                (None, {'fields': ('notes',), }),
                ('Meet', {'classes': (
                    'grp-collapse grp-closed',),
                    'fields': (
                        'athlete_id', 'age', 'division', 'starting_event', 'overall_score', 'tie_break', 'rank'), }), )

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

    def link_team(self, obj):
        url = reverse('admin:%s_%s_change' % (
            obj._meta.app_label, 'team'), args=[obj.team.id])
        return mark_safe(u'<a href="{}">{}</a>'.format(url, obj.team.team))
    link_team.short_description = "Team"

    def show_age_division(self, obj):
        return obj.division
    show_age_division.short_description = "Age Div."
    show_age_division.admin_order_field = 'division'

    def session(self, gymnast):
        if gymnast.division:
            return Session.objects.get(divisions=gymnast.division).name
        return '-'
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

    # TODO: This method of updating competition age only works for MAG.
    #       WAG is a completely different story
    def update_age(self, modeladmin, request, queryset):
        ''' competition age is based on gymnast age as of 5/31/yyyy '''
        rows_updated = 0
        for gymnast in queryset:
            if not gymnast.meet.date:
                messages.warning(request, 'Set a date in the Meet admin for when the {} meet will occur.'.format(request.session['meet']['short_name']))
            else:
                if gymnast.dob is not None:
                    gymnast.age = gymnast.competition_age_mag
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

    def set_scratched(self, modeladmin, request, queryset):
        rows_updated = queryset.update(is_scratched=True)
        if rows_updated == 1:
            message_bit = '1 gymnast was'
        else:
            message_bit = '{} gymnasts were'.format(rows_updated)
        messages.success(request, '{} scratched'.format(message_bit))
    set_scratched.short_description = "Scratch gymnasts"

    # TODO: This should happen on save, not as an admin action
    def sort_into_divisions(self, modeladmin, request, queryset):
        ''' Admin action meant to be performed once on all athletes at once.
            However, it can be performed multiple times without harm, and also on only a few athletes.
        '''
        for gymnast in queryset:
            if gymnast.age and gymnast.level:
                d = Division.objects.filter(level=gymnast.level).filter(Q(min_age__lte=gymnast.age) & Q(max_age__gte=gymnast.age)).first()

                if not d:
                    messages.error(request, 'No {2} age {1} division exists for {0}'.format(gymnast, gymnast.age, gymnast.level))
                else:
                    gymnast.division = d
                    gymnast.save()

            else:
                messages.error(request, 'Age or level missing for gymnast {}'.format(gymnast))

        messages.success(request, 'Gymnast age divisions updated.')
    sort_into_divisions.short_description = "Set age division"

    def set_athlete_id(self, modeladmin, request, queryset):
        ''' Admin action meant to be performed once on all athletes at once.
            However, it can be performed multiple times without harm, and also on only a few athletes.
        '''
        queryset = queryset.exclude(athlete_id__isnull=False, is_scratched=True).order_by('level', 'team', 'last_name')
        rows_updated = queryset.count()

        # add gymnast events so scoring will work
        events = Event.objects.filter(active=True)  # competition.Event
        # turn off scoring though, we're not doing that right now
        post_save.disconnect(
            None,
            sender=GymnastEvent,
            dispatch_uid='update_rankings')

        level_max_athlete_id = {}

        for a in queryset:
            print('setting athlete id and creating events for {}'.format(a))

            # Check if this athlete has an id already
            if not a.athlete_id:

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
                        elif a.level.level > 10:
                            max_id = (int(a.level.level) + 5) * 100
                        else:
                            max_id = (int(a.level.level) * 1000)
                else:
                    max_id = level_max_athlete_id[a.level.level]

                # Up the max id by one and save to athlete
                max_id += 1
                level_max_athlete_id[a.level.level] = max_id
                a.athlete_id = max_id
                a.save()

            # filter for events only in this gymnast's discipline
            for event in events.filter(is_mag=a.is_mag, is_wag=a.is_wag):
                ae, created = GymnastEvent.objects.get_or_create(event=event, gymnast=a, meet=a.meet)
                if a.is_scratched:
                    ae.score = 0
                    ae.save()

        if rows_updated == 1:
            message_bit = '1 athelete id was'
        else:
            message_bit = '{} athlete ids were'.format(rows_updated)

        post_save.connect(
            update_rankings,
            sender=GymnastEvent,
            dispatch_uid='update_rankings')

        messages.success(request, '{} updated'.format(message_bit))
    set_athlete_id.short_description = "Set athlete id"

    def clear_athlete_id(self, modeladmin, request, queryset):
        for a in queryset:
            a.athlete_id = None
            a.save()
        messages.success(request, '{} athlete ids cleared'.format(queryset.count()))
    clear_athlete_id.short_description = 'Clear athlete id'

    # TODO: This was rolled up into set athlete id.  Don't think there's a need for it as a stand alone any longer.
    def create_events(self, modeladmin, req, qset):
        events = Event.objects.filter(active=True)  # competition.Event

        post_save.disconnect(
            None,
            sender=GymnastEvent,
            dispatch_uid='update_rankings')

        for gymnast in qset:
            print('creating events for {}'.format(gymnast))
            # filter for events only in this gymnast's discipline
            for event in events.filter(is_mag=gymnast.is_mag, is_wag=gymnast.is_wag):
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
        actions = [make_event_action(q) for q in Event.objects.filter(active=True)]  # competition.Event
        # actions.insert(0, ('create_events', (self.create_events, 'create_events', 'Create events')))
        actions.insert(0, ('clear_athlete_id', (self.clear_athlete_id, 'clear_athlete_id', 'Clear athlete id')))
        actions.insert(0, ('set_shirt_action', (self.set_shirt_action, 'set_shirt_action', 'Update shirt size')))
        actions.insert(0, ('set_athlete_id', (self.set_athlete_id, 'set_athlete_id', 'Set athlete id')))
        actions.insert(0, ('sort_into_divisions', (self.sort_into_divisions, 'sort_into_divisions', 'Set age division')))
        actions.insert(0, ('update_age', (self.update_age, 'update_age', 'Set competition age')))
        actions.insert(0, ('set_scratched', (self.set_scratched, 'set_scratched', 'Scratch gymnast')))
        actions.append(('clear_event', (self.clear_event, 'clear_event', 'Set starting event to (None)')))
        return OrderedDict(actions)

    def has_add_permission(self, request, obj=None):
            return False


class CoachInline(admin.StackedInline):
    model = models.Coach
    exclude = ('notes', 'is_flagged', 'is_verified', 'meet')
    classes = ('grp-collapse grp-closed', 'grp-collapse grp-open',)
    inline_classes = ('grp-collapse grp-open',)
    extra = 0


class GymnastInline(admin.StackedInline):
    model = models.Gymnast
    ordering = ('is_scratched', 'level', 'last_name', 'first_name')
    readonly_fields = ('age', 'edit', 'show_notes')
    fieldsets = (
        (None, {'fields': (
            'per_gymnast_cost',
            ('first_name', 'last_name'),
            ('usag', 'discipline',),
            ('dob', 'age',),
            'level',
            'shirt',
            ('is_us_citizen', 'is_verified', 'is_scratched', 'is_flagged',),
            'show_notes',
            'edit', ), }),
    )
    classes = ('grp-collapse grp-closed', 'grp-collapse grp-open',)
    inline_classes = ('grp-collapse grp-closed',)
    extra = 0

    class Media:
        js = ('{}js/competitionAge.js'.format(settings.STATIC_URL),
              '{}js/moment.min.js'.format(settings.STATIC_URL))

    def edit(self, obj):
        if not obj.id:
            return ''
        url = reverse('admin:%s_%s_change' % (
            obj._meta.app_label, obj._meta.model_name), args=[obj.id])
        return mark_safe(u'<a href="{u}">Add Notes</a>'.format(u=url))
    edit.short_description = ''

    def show_notes(self, obj):
        all_notes = [(note.author, note.note, note.created) for note in obj.gymnast_notes.all()]
        show = ''
        for note in all_notes:
            show += '{} {} ({}) <br/><br/>'.format(datetime.datetime.strftime(note[2], '%Y-%m-%d %I:%M %p'), note[1], note[0])
        return mark_safe(show)
    show_notes.short_description = "Notes"


class TeamNotesInlineAdmin(admin.TabularInline):
    model = models.TeamNotes
    extra = 0
    exclude = ['meet']
    verbose_name_plural = 'Internal Notes'
    readonly_fields = ['created']
    fields = ['author', 'note', 'created']
    classes = ('grp-collapse grp-closed', 'grp-collapse grp-open',)
    inline_classes = ('grp-collapse grp-closed',)

    def created(self, obj):
        return obj.created


class PaymentsInlineAdmin(admin.TabularInline):
    model = models.Payments
    extra = 0
    exclude = ['meet']
    fields = ['amount', 'paid', 'detail']
    classes = ('grp-collapse grp-closed', 'grp-collapse grp-open',)
    inline_classes = ('grp-collapse grp-closed',)


@admin.register(models.GymnastNotes)
class GymnastInternalNotesAdmin(admin.ModelAdmin):
    list_display = ['author', 'created', 'gymnast', 'note']
    search_fields = ['gymnast__first_name', 'gymnast__last_name', 'gymnast__usag']
    list_filter = ['gymnast__team']


@admin.register(models.TeamNotes)
class TeamInternalNotesAdmin(admin.ModelAdmin):
    list_display =['author', 'created', 'team', 'note']
    search_fields = ['note']
    list_filter = ['team']


@admin.register(models.Team)
class TeamAdmin(MeetDependentAdmin):
    list_display = ('team', 'gym', 'usag', 'contact_name', 'num_gymnasts', 'show_paid_in_full', 'city', 'state')
    list_filter = ('qualified', 'team_awards')
    filter_horizontal = ('team_awards', )
    readonly_fields = ('gymnast_cost', 'total_cost', 'team_award_cost', 'total_payments', 'show_paid_in_full')
    search_fields = ('gym', 'team', 'usag')
    inlines = [PaymentsInlineAdmin, TeamNotesInlineAdmin, CoachInline, GymnastInline]
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
                          ('Registration', {'fields': ('gymnast_cost',
                                                       'team_award_cost',
                                                       'total_cost',
                                                       'total_payments',
                                                       'show_paid_in_full', ), }),
                          (None, {'fields': ('notes',), }),
                          ('Contact', {'fields': ('first_name',
                                                  'last_name',
                                                  'phone',
                                                  'email',
                                                  'address_1',
                                                  'address_2',
                                                  'city',
                                                  'state',
                                                  'postal_code'),
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
        """ Exports Gymnast info for a team, incl. Session assignments.
            Public team notes are included on new line if any exist. """
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
                       'division']
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
                except Exception:
                    field_values.append(None)
                writer.writerow(field_values)

            # Write Notes on new line
            if obj.notes:
                writer.writerow('')
                writer.writerow([obj.notes])

        return response
    export_with_session.short_description = "Export with session, as csv file"

    def export_with_notes(self, request, queryset):
        """ Exports Gymnast info for a team, incl. public notes about the gymnast
            Information about team registration cost and payments received printed on new line. """
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

            # Write row containing registration cost and payment data
            writer.writerow('')
            writer.writerow(['Payment Details',
                             'Gymnast Cost: ${}'.format(obj.calc_gymnast_cost()),
                             'Level Awards Cost: ${}'.format(obj.calc_team_award_cost()),
                             'Total Cost: ${}'.format(obj.calc_total_cost()),
                             'Total Paid: ${}'.format(obj.calc_amount_paid)])
        return response
    export_with_notes.short_description = "Export with notes, as csv file"

    def show_paid_in_full(self, obj):
        return obj.is_paid_in_full
    show_paid_in_full.short_description = "Paid in Full"
    show_paid_in_full.boolean = True

    def total_payments(self, obj):
        return obj.calc_amount_paid
    total_payments.short_description = "Total Payments"


@admin.register(LogEntry)
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
        # If there's no active meet, hide fields until active meet has been set
        if request.session.get('meet', ''):
            fieldsets += ((None, {
                'fields': ('name', 'price'),
                'description': ''}),
            )
        return fieldsets


@admin.register(models.ImportUsagReservation)
class ImportUsagReservationAdmin(admin.ModelAdmin):
    pass

    def has_add_permission(self, request):
        return False

    def has_change_permission(self, request, obj=None):
        return False


admin.site.register(models.ShirtSize)
admin.site.register(models.Discipline)
