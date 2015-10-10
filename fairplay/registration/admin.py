from django.conf import settings
from django.contrib import admin, messages
from grappelli.forms import GrappelliSortableHiddenMixin
from django.contrib.admin import SimpleListFilter
from django.contrib.admin.models import LogEntry
from django.shortcuts import render


from django.db.models import Count, Sum
from . import models
from . import forms as actionforms


### Filters

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
            return queryset.filter(usag='') | queryset.filter(usag__isnull=True) | queryset.filter(usag_expire_date='') | queryset.filter(usag_expire_date__isnull=True) | queryset.filter(safety_expire_date='') | queryset.filter(safety_expire_date=True) | queryset.filter(background_expire_date='') | queryset.filter(background_expire_date=True)


### Admins

class LevelAdmin(admin.ModelAdmin):
    list_display = ('level', 'order')
    list_editable = ('level', 'order')


class CoachAdmin(admin.ModelAdmin):
    list_display = ('last_name', 'first_name', 'usag', 'team', 'has_usag', 'is_verified')
    list_filter = (CoachMissingUsagFilter, 'team')
    search_fields = ('last_name', 'first_name')
    raw_id_fields = ('team',)
    autocomplete_lookup_fields = {'fk': ['team']}

    def has_usag(self, obj):
        missing = False
        if obj.usag_expire_date and obj.safety_expire_date and obj.background_expire_date:
            missing = True
        return missing
    has_usag.short_description = "USAG?"
    has_usag.boolean = True


class GymnastAdmin(admin.ModelAdmin):
    list_display = ('last_name', 'first_name', 'usag', 'team', 'level', 'age', 'dob', 'tshirt', 'is_scratched', 'is_flagged', 'is_verified')
    list_filter = [GymnastMissingUsagFilter, 'is_scratched', 'is_flagged', 'is_verified', 'team', 'level']
    search_fields = ('last_name', 'first_name')
    raw_id_fields = ('team',)
    autocomplete_lookup_fields = {'fk': ['team']}
    actions = ['set_tshirt_action', 'set_verified']

    def set_tshirt_action(self, request, queryset):
        if 'do_action' in request.POST:
            form = actionforms.ShirtChoiceForm(request.POST)
            if form.is_valid():
                tshirt = form.cleaned_data.get('tshirt')
                updated = queryset.update(tshirt=tshirt)
                messages.success(request, '{} gymnasts were updated'.format(updated))
                return
        else:
            form = actionforms.ShirtChoiceForm()

        return render(request, 'admin/registration/action_tshirt.html',
            {'title': u'Choose tshirt size',
                'objects': queryset,
                'form': form
            })
    set_tshirt_action.short_description = u'Update tshirt size of selected gymnast'

    def set_verified(self, request, queryset):
        rows_updated = queryset.update(is_verified=True)
        if rows_updated == 1:
            message_bit = '1 gymnast was'
        else:
            message_bit = '%s gymnasts were' % rows_updated
        messages.success(request, '%s verified' % message_bit)
    set_verified.short_description = "Mark selected gymnasts as verified"



class CoachInline(admin.TabularInline):
    model = models.Coach
    exclude = ('notes', 'is_flagged', 'is_verified')

class GymnastInline(admin.StackedInline):
    model = models.Gymnast
    ordering = ('is_scratched', 'level', 'last_name', 'first_name')
    fields = ('first_name', 'last_name', 'usag', 'dob', 'age', 'is_us_citizen', 'tshirt', 'level', 'is_scratched', 'is_flagged', 'is_verified', 'notes')

    class Media:
        js = ('/static/js/competitionAge.js','/static/js/moment.min.js')


class TeamAdmin(admin.ModelAdmin):
    list_display = ('gym', 'usag', 'contact_name', 'num_gymnasts', 'paid_in_full', 'notes')
    readonly_fields = ('gymnast_cost', 'total_cost', 'level_cost', 'show_per_level_cost')
    search_fields = ('gym', 'first_name', 'last_name')
    filter_horizontal = ('levels',)
    inlines = [CoachInline, GymnastInline]
    fieldsets = ((None, {'fields': ('gym', 'team', 'address_1', 'address_2', 'city', 'state', 'postal_code', 'notes'), }),
                 ('Contact Info', {'fields': ('first_name', 'last_name', 'phone', 'email', 'usag'), }),
                 ('Registration', {'fields': ('per_gymnast_cost', 'show_per_level_cost', 'levels', ), }),
                 ('Payment', {'fields': ('paid_in_full', 'gymnast_cost', 'level_cost', 'total_cost', 'payment_postmark', 'registration_complete'), }),
                 )

    class Media:
        css = {
            "all": ("{}css/filter-horizontal-adjustment.css".format(settings.STATIC_URL),)
        }
        # js = ('/static/js/competitionAge.js',)

    def show_per_level_cost(self, obj):
        return '${} per level'.format(obj.PER_LEVEL_COST)
    show_per_level_cost.short_description = 'Per Level Cost'

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

admin.site.register(LogEntry, LogAdmin)
admin.site.register(models.Gymnast, GymnastAdmin)
admin.site.register(models.Level, LevelAdmin)
admin.site.register(models.Coach, CoachAdmin)
admin.site.register(models.Team, TeamAdmin)
