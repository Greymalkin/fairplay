from django.conf import settings
from django.contrib import admin
from grappelli.forms import GrappelliSortableHiddenMixin
from django.contrib.admin import SimpleListFilter

from django.db.models import Count, Sum
from . import models


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
    list_display = ('last_name', 'first_name', 'usag', 'team', 'has_usag')
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
    list_display = ('last_name', 'first_name', 'usag', 'team', 'level', 'age', 'tshirt', 'is_scratched')
    list_filter = [GymnastMissingUsagFilter, 'is_scratched', 'team', 'level']
    search_fields = ('last_name', 'first_name')
    raw_id_fields = ('team',)
    autocomplete_lookup_fields = {'fk': ['team']}


class CoachInline(admin.TabularInline):
    model = models.Coach
    exclude = ('notes', )


class GymnastInline(admin.StackedInline):
    model = models.Gymnast
    ordering = ('is_scratched', 'level', 'last_name', 'first_name')
    fields = ('first_name', 'last_name', 'usag', 'dob', 'age', 'is_us_citizen', 'tshirt', 'level', 'is_scratched', 'notes')


class TeamAdmin(admin.ModelAdmin):
    list_display = ('gym', 'usag', 'contact_name', 'num_gymnasts', 'paid_in_full', 'notes')
    readonly_fields = ('gymnast_cost', 'total_cost', 'level_cost', 'show_per_level_cost')
    search_fields = ('gym', 'first_name', 'last_name')
    filter_horizontal = ('levels',)
    inlines = [CoachInline, GymnastInline]
    fieldsets = ((None, {'fields': ('gym', 'address_1', 'address_2', 'city', 'state', 'postal_code', 'notes'), }),
                 ('Contact Info', {'fields': ('first_name', 'last_name', 'phone', 'email', 'usag'), }),
                 ('Registration', {'fields': ('per_gymnast_cost', 'show_per_level_cost', 'levels', ), }),
                 ('Payment', {'fields': ('paid_in_full', 'gymnast_cost', 'level_cost', 'total_cost', 'payment_postmark', 'registration_complete'), }),
                 )

    class Media:
        css = {
            "all": ("{}css/filter-horizontal-adjustment.css".format(settings.STATIC_URL),)
        }

    def show_per_level_cost(self, obj):
        return '${} per level'.format(obj.PER_LEVEL_COST)
    show_per_level_cost.short_description = 'Per Level Cost'

    def num_gymnasts(self, obj):
        return obj.gymnasts.filter(is_scratched=False).count()
    num_gymnasts.short_description = '# Gymnasts'


admin.site.register(models.Gymnast, GymnastAdmin)
admin.site.register(models.Level, LevelAdmin)
admin.site.register(models.Coach, CoachAdmin)
admin.site.register(models.Team, TeamAdmin)
