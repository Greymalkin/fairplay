import requests
import csv

from datetime import date, timedelta
from dateutil import parser
from django.conf import settings
from django.contrib.admin import SimpleListFilter
from django.contrib.admin.models import LogEntry
from django.db.models import Count, Sum
from django.db.models.signals import pre_save
from django.dispatch import receiver
from django.contrib import admin, messages
from django.core.urlresolvers import reverse
from django import forms
from django.forms.models import BaseInlineFormSet
from django.http import HttpResponse
from django.shortcuts import render

from grappelli.forms import GrappelliSortableHiddenMixin
from meet.models import Meet
from meet.admin import MeetDependentAdmin, MeetFilter

from competition.models import Event, GymnastEvent, TeamAward
from . import models
from . import forms as actionforms


def make_event_action(event):
    name = 'mark_{}'.format(event.initials)

    def action(modeladmin, req, qset):
        for item in qset:
            item.starting_event = event
            item.save()

    return (action, name, "Set starting event to {}".format(event))

# ## Filters


class LevelFilter(SimpleListFilter):
    title = ('Level')
    parameter_name = 'level'

    def lookups(self, request, model_admin):
        qs = model_admin.get_queryset(request)
        return [(i, i) for i in qs.values_list('level__level', flat=True)
                                  .distinct().order_by('level__order')]

    def queryset(self, request, queryset):
        if self.value():
            return queryset.filter(level__level__exact=self.value())


class GymnastMissingUsagFilter(SimpleListFilter):
    title = ('Missing USAG#')
    parameter_name = 'no_usag'

    def lookups(self, request, model_admin):
        return (('none', ('No USAG#')),)

    def queryset(self, request, queryset):
        if self.value() == 'none':
            return queryset.filter(usag='') | queryset.filter(usag__isnull=True)


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


### Admins


class LevelAdmin(MeetDependentAdmin):
    list_display = ('name', 'level', 'order')
    list_editable = ('order',)

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(LevelAdmin, self).get_fieldsets(request, obj)
        fieldsets += ((None, {
            'fields': ('name', 'level', 'order'),
            'description': ''
            }),
        )
        return fieldsets


class CoachAdmin(MeetDependentAdmin):
    list_display = ('last_name', 'first_name', 'usag', 'team', 'has_usag', 'is_verified')
    list_filter = (MeetFilter, CoachMissingUsagFilter, 'team')
    search_fields = ('last_name', 'first_name', 'usag')
    # raw_id_fields = ('team',)
    # autocomplete_lookup_fields = {'fk': ['team']}

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(CoachAdmin, self).get_fieldsets(request, obj)
        fieldsets += ((None, {
            'fields': ('first_name', 'last_name', 'usag', 'team', 'is_flagged', 'is_verified', 
                       'usag_expire_date', 'safety_expire_date', 'background_expire_date', 'notes'),
            'description': ''
            }),
        )
        return fieldsets

    def has_usag(self, obj):
        missing = False
        if obj.usag_expire_date and obj.safety_expire_date and obj.background_expire_date:
            missing = True
        return missing
    has_usag.short_description = "USAG?"
    has_usag.boolean = True


class GymnastAdmin(MeetDependentAdmin):
    list_display = ('last_name', 'first_name', 'athlete_id', 'usag', 'show_team', 'level', 'age', 'dob',  'show_age_division', 'shirt', 'is_scratched', 'is_flagged', 'is_verified')
    list_filter = [MeetFilter,GymnastMissingUsagFilter, 'is_scratched', 'is_flagged', 'is_verified', 'team', 'level', 'team__team_awards']
    search_fields = ('last_name', 'first_name', 'usag', 'athlete_id')
    readonly_fields = ('team', 'age')
    raw_id_fields = ('team',)
    actions = ['update_age', 'set_shirt_action', 'verify_with_usag', 'set_verified']
    ordering = ('last_name', 'first_name')

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(GymnastAdmin, self).get_fieldsets(request, obj)
        fieldsets += ((None, {'fields': ('team', 'first_name', 'last_name', 'usag', 'level',  'dob', 'age', 'notes'), }),
                     ('Checks', {'classes': ('grp-collapse grp-closed',),
                                 'fields': ('is_us_citizen', 'is_scratched', 'is_flagged', 'is_verified', 'shirt'), }),
                     ('Meet', {'classes': ('grp-collapse grp-closed',),
                               'fields': ('athlete_id', 'age', 'division', 'starting_event', 'overall_score', 'tie_break', 'rank'), }),
                     )

        return fieldsets

    def show_team(self, obj):
        return obj.team.team
    show_team.short_description = "Team"
    show_team.admin_order_field = 'team__team'

    def show_age_division(self, obj):
        return obj.division
    show_age_division.short_description = "Age Div."
    show_age_division.admin_order_field = 'division'

    def set_shirt_action(self, request, queryset):
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

    def verify_with_usag(self, request, queryset):
        credentials = {
            'user': settings.USAG_USER,
            'pass': settings.USAG_PASS
        }

        members = []
        for member in queryset:
            members.append(member.usag)

        usag_max = settings.USAG_MAX_VERIFY
        chunks = [members[x:x+usag_max] for x in range(0, len(members), usag_max)]

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

                        for row in rows:
                            (usag_id, last_name, first_name, dob, member_type, level, club_id, club, club_status, status) = row

                            try:
                                level = int(level[6:])
                            except:
                                level = None

                            dob = parser.parse(dob).date()

                            try:
                                gymnast = models.Gymnast.objects.get(usag=usag_id)
                                notes = ""
                                valid = True

                                if last_name.lower() != gymnast.last_name.lower():
                                    valid = False
                                    notes += "Last name does not match USAG last name (USAG: {})\n".format(last_name)

                                if dob != gymnast.dob:
                                    valid = False
                                    notes += "Date of birth does not match USAG date of birth (USAG: {})\n".format(dob)

                                if level != int(gymnast.level.level):
                                    valid = False
                                    notes += "Level does not match USAG level (USAG: {})\n".format(level)

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

    def update_age(self, request, queryset):
        ''' competition age is based on gymnast age as of 5/31/yyyy '''
        rows_updated = 0
        meet = queryset[0].meet

        if meet.date.month > 8:
            year = meet.date.year + 1
        else:
            year = meet.date.year

        cutoff = date(year, settings.COMPETITION_MONTH, settings.COMPETITION_DATE)

        for gymnast in queryset:
            if gymnast.dob is not None:
                gymnast.age = (cutoff - gymnast.dob) // timedelta(days=365.2425)
                gymnast.save()
                rows_updated += 1

        if rows_updated == 1:
            message_bit = '1 gymnast\'s competition age was'
        else:
            message_bit = '{} gymnast\'s competition ages were'.format(rows_updated)
        messages.success(request, '{} updated'.format(message_bit))
    update_age.short_description = "Update competition age"

    # TODO: DELET? I think this is wrongly copied over from competition
    def sort_into_divisions(self, model_admin, request, queryset):
        ''' Admin action meant to be performed once on all athletes at once.
            However, it can be performed multiple times without harm, and also on only a few athletes.
        '''
        divisions_by_level = {}
        rows_updated = queryset.count()

        # Build dictionary of all divisions
        divisions = models.Division.objects.all()
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
                    age = self.competition_age(athlete, athlete.meet)
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

    def set_verified(self, request, queryset):
        rows_updated = queryset.update(is_verified=True)
        if rows_updated == 1:
            message_bit = '1 gymnast was'
        else:
            message_bit = '{} gymnasts were'.format(rows_updated)
        messages.success(request, '{} verified'.format(message_bit))
    set_verified.short_description = "Mark selected gymnasts as verified"


class CoachInline(admin.StackedInline):
    model = models.Coach
    exclude = ('notes', 'is_flagged', 'is_verified', 'meet')
    classes = ('grp-collapse grp-open',)
    inline_classes = ('grp-collapse grp-open',)


class GymnastInline(admin.StackedInline):
    model = models.Gymnast
    ordering = ('is_scratched', 'level', 'last_name', 'first_name')
    fields = ('first_name', 'last_name', 'usag', 'dob', 'age', 'is_us_citizen', 'shirt', 'level', 'is_scratched', 'is_flagged', 'is_verified', 'notes')
    classes = ('grp-collapse grp-open',)
    inline_classes = ('grp-collapse grp-open',)
    extra = 1

    class Media:
        js = ('{}js/competitionAge.js'.format(settings.STATIC_URL),
              '{}js/moment.min.js'.format(settings.STATIC_URL))


class RegistrationInline(admin.StackedInline):
    model = models.Registration
    fields = ('received', 'per_gymnast_cost', 'per_level_cost', 'team_awards', 'add_gymnasts', 'gymnast_cost', 'level_cost', 'total_cost', 'paid_in_full', )
    readonly_fields = ('add_gymnasts', 'gymnast_cost', 'total_cost', 'level_cost',)
    filter_horizontal = ('team_awards',)
    min_num = 1
    extra = 0
    classes = ('grp-collapse grp-open',)
    inline_classes = ('grp-collapse grp-open',)

    def add_gymnasts(self, instance):
        if instance.id:
            url = reverse('admin:{}_{}_change'.format(instance._meta.app_label,
                                                      instance._meta.model_name), args=[instance.id])
            return u'<a href="{}">Add Gymnasts to this Registration</a>'.format(url)
        else:
            return '(available after save)'    
    add_gymnasts.short_description = "Gymnasts"
    add_gymnasts.allow_tags = True


class TeamAdmin(MeetDependentAdmin):
    list_display = ('team', 'gym', 'usag', 'contact_name', 'num_gymnasts', 'show_paid_in_full', 'city', 'state')
    list_filter = ('qualified','team_awards')
    filter_horizontal = ('team_awards', )
    search_fields = ('gym', 'team', 'usag')
    inlines = [CoachInline, RegistrationInline] #, GymnastInline
    actions = ['export_with_session']
    readonly_fields = ('team_awards', )

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(TeamAdmin, self).get_fieldsets(request, obj)
        fieldsets += ((None, {'fields': ('gym', 'team', 'address_1', 'address_2', 'city', 'state', 'postal_code', 'notes', 'team_awards'), }),
                     ('Contact Info', {'fields': ('first_name', 'last_name', 'phone', 'email', 'usag'), }),
                     )
        return fieldsets

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(TeamAdmin, self).get_queryset(request)
        return qs.annotate(num_gymnasts=Count('gymnasts'))

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
                       'usag',
                       'last_name',
                       'first_name',
                       'dob',
                       'age',
                       'shirt',
                       'is_scratched',
                       'level',
                       'division', ]
        with_session = field_names.copy()
        with_session.append('d1/d2/jdo')
        with_session.append('Session')
        # Write a first row with header information
        writer.writerow(with_session)

        # Write data rows
        for obj in queryset:
            gymnasts = models.Gymnast.objects.filter(team=obj).order_by('is_scratched', 'level', 'division', 'last_name')
            for gymnast in gymnasts:
                field_values = [getattr(gymnast, field) for field in field_names]
                # TODO: Make this work
                field_values.append('d1 or d2 or jdo')
                try:
                    field_values.append(gymnast.division.session.first())
                except:
                    field_values.append(None)
                writer.writerow(field_values)
        return response
    export_with_session.short_description = "Export selected team as csv file with session"

    def show_paid_in_full(self, obj):
        return obj.paid_in_full
    show_paid_in_full.short_description = "Paid in Full"


class RegistrationAdmin(MeetDependentAdmin):
    list_filter = ('team','received', 'per_gymnast_cost', 'paid_in_full', )
    filter_horizontal = ('team_awards',)
    inlines = [GymnastInline]
    readonly_fields = ('gymnast_cost', 'total_cost', 'level_cost',)
    raw_id_fields = ('team',)

    def get_fieldsets(self, request, obj=None):
        fieldsets = super(RegistrationAdmin, self).get_fieldsets(request, obj)
        fieldsets += (('Registration', {'fields': ( 'team', 'per_gymnast_cost', 'per_level_cost', 'team_awards'), }),
                     ('Payment', {'fields': ('paid_in_full', 'gymnast_cost', 'level_cost', 'total_cost',), }),
                     )
        return fieldsets

    def view_team(self, instance):
        if instance.team:
            url = reverse('admin:{}_{}_change'.format(instance.team._meta.app_label,
                                                      instance.team._meta.model_name), args=[instance.team.id])
            return u'<a href="{}">View Team</a>'.format(url)
        else:
            return '(available after save)'    
    view_team.short_description = "Team"
    view_team.allow_tags = True


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
            'description': ''
            }),
        )
        return fieldsets


admin.site.register(LogEntry, LogAdmin)
admin.site.register(models.Gymnast, GymnastAdmin)
admin.site.register(models.Level, LevelAdmin)
admin.site.register(models.Coach, CoachAdmin)
admin.site.register(models.Team, TeamAdmin)
admin.site.register(models.GymnastPricing, PricingAdmin)
admin.site.register(models.LevelPricing, PricingAdmin)
admin.site.register(models.ShirtSize)
admin.site.register(models.Registration, RegistrationAdmin)