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
from django import forms
from django.forms.models import BaseInlineFormSet
from django.http import HttpResponse
from django.shortcuts import render

from grappelli.forms import GrappelliSortableHiddenMixin
from meet.models import Meet
from competition.models import Event, AthleteEvent, TeamAward
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


class LevelAdmin(admin.ModelAdmin):
    list_display = ('level', 'order')
    list_editable = ('order',)
    exclude = ('meet',)

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(LevelAdmin, self).get_queryset(request)
        meet = Meet.objects.filter(is_current_meet=True)
        return qs.filter(meet=meet)


class CoachAdmin(admin.ModelAdmin):
    list_display = ('last_name', 'first_name', 'usag', 'team', 'has_usag', 'is_verified')
    list_filter = (CoachMissingUsagFilter, 'team')
    search_fields = ('last_name', 'first_name', 'usag')
    raw_id_fields = ('team',)
    autocomplete_lookup_fields = {'fk': ['team']}
    exclude = ('meet',)

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(CoachAdmin, self).get_queryset(request)
        meet = Meet.objects.filter(is_current_meet=True)
        return qs.filter(meet=meet)

    def has_usag(self, obj):
        missing = False
        if obj.usag_expire_date and obj.safety_expire_date and obj.background_expire_date:
            missing = True
        return missing
    has_usag.short_description = "USAG?"
    has_usag.boolean = True


class GymnastAdmin(admin.ModelAdmin):
    list_display = ('last_name', 'first_name', 'athlete_id', 'usag', 'show_team', 'level', 'age', 'dob',  'division', 'shirt', 'is_scratched', 'is_flagged', 'is_verified')
    list_filter = [GymnastMissingUsagFilter, 'is_scratched', 'is_flagged', 'is_verified', 'team', 'level', 'team__team_awards']
    search_fields = ('last_name', 'first_name', 'usag', 'athlete_id')
    raw_id_fields = ('team',)
    actions = ['update_age', 'set_shirt_action', 'verify_with_usag', 'set_verified']
    # autocomplete_lookup_fields = {'fk': ['team']}
    exclude = ('meet',)
    ordering = ('last_name', 'first_name')

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(GymnastAdmin, self).get_queryset(request)
        meet = Meet.objects.filter(is_current_meet=True)
        return qs.filter(meet=meet)

    def show_team(self, obj):
        return obj.team.team
    show_team.short_description = "Team"
    show_team.admin_order_field = 'team__team'

    def set_shirt_action(self, request, queryset):
        if 'do_action' in request.POST:
            form = actionforms.ShirtChoiceForm(request.POST)
            if form.is_valid():
                shirt = form.cleaned_data.get('shirt')
                updated = queryset.update(shirt=shirt)
                messages.success(request, '{} gymnasts shirt sizes were updated'.format(updated))
                return
        else:
            form = actionforms.ShirtChoiceForm()

        return render(
            request,
            'admin/registration/action_tshirt.html',
            {'title': u'Choose tshirt size',
                'objects': queryset,
                'form': form})
    set_shirt_action.short_description = u'Update shirt size of selected gymnast'

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
                            (usag_id, last_name, first_name, dob, level, club_id, club, status) = row

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
        rows_updated = 0
        meet = Meet.objects.get(is_current_meet=True)

        if meet.date.month > 8:
            year = meet.date.year
        else:
            year = meet.date.year - 1

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
    update_age.short_description = "Update gymnast competition age"

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

    def set_verified(self, request, queryset):
        rows_updated = queryset.update(is_verified=True)
        if rows_updated == 1:
            message_bit = '1 gymnast was'
        else:
            message_bit = '{} gymnasts were'.format(rows_updated)
        messages.success(request, '{} verified'.format(message_bit))
    set_verified.short_description = "Mark selected gymnasts as verified"


class CoachInline(admin.TabularInline):
    model = models.Coach
    exclude = ('notes', 'is_flagged', 'is_verified', 'meet')


class GymnastInline(admin.StackedInline):
    model = models.Gymnast
    ordering = ('is_scratched', 'level', 'last_name', 'first_name')
    fields = ('first_name', 'last_name', 'usag', 'dob', 'age', 'is_us_citizen', 'shirt', 'level', 'is_scratched', 'is_flagged', 'is_verified', 'notes')

    class Media:
        js = ('/static/js/competitionAge.js','/static/js/moment.min.js')


class TeamForm(forms.ModelForm):
    def __init__(self, *args, **kwargs):
        super(TeamForm, self).__init__(*args, **kwargs)
        meet = Meet.objects.filter(is_current_meet=True)
        wtf = TeamAward.objects.filter(meet=meet);
        self.fields['team_awards'].widget.choices = [(choice.id, choice.name) for choice in wtf]


class TeamAdmin(admin.ModelAdmin):
    form = TeamForm
    list_display = ('team', 'gym', 'usag', 'contact_name', 'num_gymnasts', 'paid_in_full', 'city', 'state', 'notes')
    list_filter = ('qualified','team_awards')
    readonly_fields = ('gymnast_cost', 'total_cost', 'level_cost',)
    search_fields = ('gym', 'team', 'usag')
    filter_horizontal = ('team_awards',)
    inlines = [CoachInline, GymnastInline]
    fieldsets = ((None, {'fields': ('gym', 'team', 'address_1', 'address_2', 'city', 'state', 'postal_code', 'notes'), }),
                 ('Contact Info', {'fields': ('first_name', 'last_name', 'phone', 'email', 'usag'), }),
                 ('Registration', {'fields': ('per_gymnast_cost', 'per_level_cost', 'team_awards'), }),
                 ('Payment', {'fields': ('paid_in_full', 'gymnast_cost', 'level_cost', 'total_cost', 'payment_postmark', 'registration_complete'), }),
                 )
    actions = ['export_with_session']

    class Media:
        css = {
            "all": ("{}css/filter-horizontal-adjustment.css".format(settings.STATIC_URL),)
        }
        # js = ('/static/js/competitionAge.js',)


    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(TeamAdmin, self).get_queryset(request)
        meet = Meet.objects.filter(is_current_meet=True)
        return qs.filter(meet=meet).annotate(num_gymnasts=Count('gymnasts'))

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
    export_with_session.short_description = "Export selected team as csv file with session"


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


class GymnastPricingAdmin(admin.ModelAdmin):
    exclude = ('meet',)

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(GymnastPricingAdmin, self).get_queryset(request)
        meet = Meet.objects.filter(is_current_meet=True)
        return qs.filter(meet=meet)


class LevelPricingAdmin(admin.ModelAdmin):
    exclude = ('meet',)

    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(LevelPricingAdmin, self).get_queryset(request)
        meet = Meet.objects.filter(is_current_meet=True)
        return qs.filter(meet=meet)


admin.site.register(LogEntry, LogAdmin)
admin.site.register(models.Gymnast, GymnastAdmin)
admin.site.register(models.Level, LevelAdmin)
admin.site.register(models.Coach, CoachAdmin)
admin.site.register(models.Team, TeamAdmin)
admin.site.register(models.GymnastPricing, GymnastPricingAdmin)
admin.site.register(models.LevelPricing, LevelPricingAdmin)
admin.site.register(models.ShirtSize)


@receiver(pre_save, sender=models.Level, dispatch_uid='save_current_meet_level')
@receiver(pre_save, sender=models.Team, dispatch_uid='save_current_meet_team')
@receiver(pre_save, sender=models.Gymnast, dispatch_uid='save_current_meet_gymnast')
@receiver(pre_save, sender=models.Coach, dispatch_uid='save_current_meet_coach')
@receiver(pre_save, sender=models.LevelPricing, dispatch_uid='save_current_meet_levelpricing')
@receiver(pre_save, sender=models.GymnastPricing, dispatch_uid='save_current_meet_gymnastpricing')
def save_current_meet(sender, instance, **kwargs):
    if instance.pk is None:
        print('*** FIRING save current meet')
        meet = Meet.objects.get(is_current_meet=True)
        instance.meet = meet

