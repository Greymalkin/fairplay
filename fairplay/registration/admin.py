from datetime import date, timedelta

from django.conf import settings
from django.db.models import Count, Sum
from django.db.models.signals import pre_save
from django.dispatch import receiver
from django.contrib import admin, messages
from django.forms.models import BaseInlineFormSet
from django.contrib.admin import SimpleListFilter
from django.contrib.admin.models import LogEntry
from django.shortcuts import render

from grappelli.forms import GrappelliSortableHiddenMixin
from meet.models import Meet
from competition.models import Event, GymnastEvent
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

# ## Admins


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


class GymnastAdmin(admin.ModelAdmin):
    list_display = ('last_name', 'first_name', 'usag', 'show_team', 'level', 'age', 'dob', 'shirt', 'is_scratched', 'is_flagged', 'is_verified')
    list_filter = [GymnastMissingUsagFilter, 'is_scratched', 'is_flagged', 'is_verified', 'team', 'level']
    search_fields = ('last_name', 'first_name', 'usag', 'athlete_id')
    raw_id_fields = ('team',)
    actions = ['update_age', 'set_shirt_action', 'set_verified']
    autocomplete_lookup_fields = {'fk': ['team']}
    exclude = ('meet',)

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
                messages.success(request, '{} gymnasts\' shirt sizes were updated'.format(updated))
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

    def set_verified(self, request, queryset):
        rows_updated = queryset.update(is_verified=True)
        if rows_updated == 1:
            message_bit = '1 gymnast was'
        else:
            message_bit = '{} gymnasts were'.format(rows_updated)
        messages.success(request, '{} verified'.format(message_bit))

    set_verified.short_description = "Mark selected gymnasts as verified"

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
            message_bit = '{} gymnasts\' competition ages were'.format(rows_updated)
        messages.success(request, '{} updated'.format(message_bit))
    update_age.short_description = "Update gymnasts' competition age"

# class AthleteAdmin(admin.ModelAdmin):
#     inlines = (AthleteEventInlineAdmin, )
#     fields = ('usag_id', 'athlete_id', 'scratched', 'last_name', 'first_name',
#               'birth_date', 'team', 'division', 'starting_event', )
#     search_fields = ['athlete_id', 'last_name', 'first_name']
#     list_filter = ('team', 'group', SessionFilter, 'starting_event', 'scratched')
#     list_per_page = 50

#     def get_actions(self, request):
#         return dict([make_event_action(q) for q in models.Event.objects.all()])

#     def session(self, athlete):
#         return models.Session.objects.get(divisions=athlete.division).name

#     def get_queryset(self, request):
#         qs = super(AthleteAdmin, self).get_queryset(request)
#         qs = qs.annotate(aa=Sum('events__score'))
#         return qs

#     def get_list_display(self, request):
#         result = ['athlete_id', 'last_name', 'first_name', 'team', 'group', 'starting_event']
#         events = models.Event.objects.all()
#         result += [e.initials for e in events]
#         result += ['all_around', ]
#         return result

#     def all_around(self, obj):
#         return obj.aa
#     all_around.admin_order_field = 'aa'
#     all_around.short_description = 'AA'

#     def __getattr__(self, attr):
#         event = models.Event.objects.get(initials=attr)

#         def get_score(athlete):
#             return athlete.events.get(event=event).score
#         get_score.short_description = attr.upper()

#         return get_score

# class AthleteEventInlineFormset(BaseInlineFormSet):
#     def __init__(self, *args, **kwargs):
#         super(AthleteEventInlineFormset, self).__init__(*args, **kwargs)
#         self.can_delete = False


# class AthleteEventInlineAdmin(admin.TabularInline):
#     model = models.AthleteEvent
#     formset = AthleteEventInlineFormset
#     extra = 0
#     max_num = 0
#     readonly_fields = ('event', )
#     fields = ('event', 'score',)


# class AthleteInlineAdmin(admin.TabularInline):
#     model = models.Athlete
#     extra = 1
#     fields = ('athlete_id', 'last_name', 'first_name', 'starting_event')


# class TeamAdmin(admin.ModelAdmin):
#     inlines = (AthleteInlineAdmin,)
#     list_display = ('name', 'team_size', 'qualified')
#     list_display = ('name', 'team_size')
#     search_fields = ['name', 'id', ]
#     list_filter = ('qualified',)

#     def queryset(self, request):
#         qs = super(TeamAdmin, self).get_queryset(request)
#         qs = qs.annotate(Count('athletes'))
#         return qs

#     def team_size(self, obj):
#         return obj.athletes__count
#     team_size.admin_order_field = 'team_size'


# class TeamAwardAdmin(admin.ModelAdmin):
#     list_display = ('name', )
#     filter_horizontal = ('divisions',)






class CoachInline(admin.TabularInline):
    model = models.Coach
    exclude = ('notes', 'is_flagged', 'is_verified', 'meet')


class GymnastInline(admin.StackedInline):
    model = models.Gymnast
    ordering = ('is_scratched', 'level', 'last_name', 'first_name')
    fields = ('first_name', 'last_name', 'usag', 'dob', 'age', 'is_us_citizen', 'shirt', 'level', 'is_scratched', 'is_flagged', 'is_verified', 'notes')

    class Media:
        js = ('/static/js/competitionAge.js','/static/js/moment.min.js')


class TeamAdmin(admin.ModelAdmin):
    list_display = ('team', 'usag', 'contact_name', 'num_gymnasts', 'paid_in_full', 'notes')
    readonly_fields = ('gymnast_cost', 'total_cost', 'level_cost',)
    search_fields = ('gym', 'team', 'usag')
    filter_horizontal = ('levels',)
    inlines = [CoachInline, GymnastInline]
    fieldsets = ((None, {'fields': ('gym', 'team', 'address_1', 'address_2', 'city', 'state', 'postal_code', 'notes'), }),
                 ('Contact Info', {'fields': ('first_name', 'last_name', 'phone', 'email', 'usag'), }),
                 ('Registration', {'fields': ('per_gymnast_cost', 'per_level_cost', 'levels', ), }),
                 ('Payment', {'fields': ('paid_in_full', 'gymnast_cost', 'level_cost', 'total_cost', 'payment_postmark', 'registration_complete'), }),
                 )

    class Media:
        css = {
            "all": ("{}css/filter-horizontal-adjustment.css".format(settings.STATIC_URL),)
        }
        # js = ('/static/js/competitionAge.js',)


    def get_queryset(self, request):
        """ Restrict display of items in the admin by those belonging to the current Meet """
        qs = super(TeamAdmin, self).get_queryset(request)
        meet = Meet.objects.filter(is_current_meet=True)
        return qs.filter(meet=meet)

    def num_gymnasts(self, obj):
        return obj.gymnasts.filter(is_scratched=False).count()
    num_gymnasts.short_description = '# Gymnasts'


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


@receiver(pre_save, sender=models.Level)
@receiver(pre_save, sender=models.Team)
@receiver(pre_save, sender=models.Gymnast)
@receiver(pre_save, sender=models.Coach)
@receiver(pre_save, sender=models.LevelPricing)
@receiver(pre_save, sender=models.GymnastPricing)
def save_current_meet(sender, instance, **kwargs):
    meet = Meet.objects.get(is_current_meet=True)
    instance.meet = meet

