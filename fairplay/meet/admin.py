from copy import deepcopy, copy
from django.db.models.signals import pre_save
from django.contrib import admin, messages
from django.contrib.admin.sites import site
from django.contrib.admin.widgets import ManyToManyRawIdWidget, ForeignKeyRawIdWidget
from django.core.exceptions import ObjectDoesNotExist
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.utils.html import escape

from . import models
from registration.models import Level, Team
from competition.models import TeamAward, Division, Session


@admin.register(models.Meet)
class MeetAdmin(admin.ModelAdmin):
    list_display = ('short_name', 'host', 'date', 'show_current_meet', 'set_meet', 'set_enable_ranking')
    actions = ['copy_meet']

    def set_meet(self, obj):
        return "<a class='setMeet' href='#' data-meet={}>Set Active Meet</a>".format(obj.id)
    set_meet.short_description = ""
    set_meet.allow_tags = True

    def set_enable_ranking(self, obj):
        onoff = 'OFF!' if obj.enable_ranking else 'On'
        return "<a class='setRanking' href='#' data-meet={} data-ranking={}>Turn Ranking {}</a>".format(obj.id, not obj.enable_ranking, onoff)
    set_enable_ranking.short_description = ""
    set_enable_ranking.allow_tags = True

    def show_current_meet(self, obj):
        from request_provider.signals import get_request
        request = get_request()
        test = request.session.get('meet')
        if not test or test['id'] != obj.id:
            return False
        return True
    show_current_meet.short_description = "Active Meet"
    show_current_meet.boolean = True

    def save_model(self, request, obj, form, change):
        if obj.is_current_meet:
            # only alllow a single default, make sure ranking is off
            self.model.objects.all().exclude(id=obj.id).update(is_current_meet=False, enable_ranking=False)

            # Set current meet in session
            request.session['meet'] = {
                "id": obj.id,
                "name": obj.name,
                "short_name": obj.short_name,
                "enable_ranking": obj.enable_ranking,
            }
        # Current meet was toggled off.  Remove from session
        elif request.session.get('meet', '') and request.session['meet'].get('id', 0) == obj.id:
            request.session['meet'] = {}
        obj.save()

    def delete_model(self, request, obj):
        if request.session.get('meet', {}) and request.session['meet'].get('id', '') == obj.id:
            request.session['meet'] = {}
            obj.delete()

    def get_formsets_with_inlines(self, request, obj=None):
        # if there's a session meet, but you're not editing the session meet, do not display inlines.
        # protects from the appearance of having lost data, when you haven't, you just aren't
        # allowed to see it until the meet is set to be active.
        current_meet = models.Meet.objects.filter(is_current_meet=True)
        if obj:
            if current_meet.count() != 1 or current_meet[0].id != obj.id:
                return []
        return super(MeetAdmin, self).get_formsets_with_inlines(request, obj)

    def copy_meet(self, request, queryset):
        current_meet = queryset[0]
        levels = Level.objects.filter(meet=current_meet)
        awards = TeamAward.objects.filter(meet=current_meet)
        teams = Team.objects.filter(meet=current_meet)
        divisions = Division.objects.filter(meet=current_meet)
        sessions = Session.objects.filter(meet=current_meet)

        new_meet = deepcopy(current_meet)
        new_meet.name = 'New MEET!'
        new_meet.short_name = 'New MEET!'
        new_meet.is_current_meet = False
        new_meet.date = None
        new_meet.id = None
        new_meet.save()

        for level in levels:
            old_obj = copy(level)
            old_obj.id = None
            old_obj.meet = new_meet
            pre_save.disconnect(receiver=None, sender=Level, dispatch_uid='save_current_meet_level')
            old_obj.save()

        for team in teams:
            old_obj = copy(team)
            old_obj.id = None
            old_obj.meet = new_meet
            old_obj.updated = None
            old_obj.gymnast_cost = 0
            old_obj.team_award_cost = 0
            old_obj.total_cost = 0
            old_obj.notes = None
            old_obj.qualified = True
            old_obj.save()

            for coach in team.coaches.all():
                coach.id = None
                coach.meet = new_meet
                coach.team = old_obj
                coach.save()

        for award in awards:
            old_obj = copy(award)
            old_obj.id = None
            old_obj.meet = new_meet
            old_obj.award_count = 0
            old_obj.save()

        for division in divisions:
            old_obj = copy(division)
            old_obj.id = None
            old_obj.level = Level.objects.get(meet=new_meet, name=division.level.name)
            old_obj.meet = new_meet
            old_obj.event_award_count = 0
            old_obj.all_around_award_count = 0
            old_obj.save()

        for session in sessions:
            old_obj = copy(session)
            old_obj.id = None
            old_obj.meet = new_meet
            old_obj.session_start = None
            old_obj.timed_warmup_start = None
            old_obj.competition_start = None
            old_obj.presentation_start = None
            old_obj.save()

        messages.success(request, 'New meet {} copied from {}'.format(new_meet.name, current_meet.name))

    class Media:
        js = ("/static/js/meet.js",)


# Base form that all admins with a FK to meet inherit from
# Enforces ties to the currently active meet when creating new instances

# Add lnked raw id field functionality

class VerboseForeignKeyRawIdWidget(ForeignKeyRawIdWidget):
    def label_for_value(self, value):
        key = self.rel.get_related_field().name
        try:
            obj = self.rel.to._default_manager.using(self.db).get(**{key: value})
            change_url = reverse(
                "admin:%s_%s_change" % (obj._meta.app_label, obj._meta.object_name.lower()),
                args=(obj.pk,)
            )
            return '&nbsp;<strong><a href="%s">%s</a></strong>' % (change_url, escape(obj))
        except (ValueError, self.rel.to.DoesNotExist):
            return '???'


class VerboseManyToManyRawIdWidget(ManyToManyRawIdWidget):
    def label_for_value(self, value):
        values = value.split(',')
        str_values = []
        key = self.rel.get_related_field().name
        for v in values:
            try:
                obj = self.rel.to._default_manager.using(self.db).get(**{key: v})
                # x = smart_unicode(obj)
                x = obj
                change_url = reverse(
                    "admin:%s_%s_change" % (obj._meta.app_label, obj._meta.object_name.lower()),
                    args=(obj.pk,)
                )
                str_values += ['<strong><a href="%s">%s</a></strong>' % (change_url, escape(x))]
            except self.rel.to.DoesNotExist:
                str_values += [u'???']
        return u', '.join(str_values)


class ImproveRawIdFieldsStackedInline(admin.StackedInline):
    def formfield_for_dbfield(self, db_field, **kwargs):
        if db_field.name in self.raw_id_fields:
            kwargs.pop("request", None)
            type = db_field.rel.__class__.__name__
            if type == "ManyToOneRel":
                kwargs['widget'] = VerboseForeignKeyRawIdWidget(db_field.rel, site)
            elif type == "ManyToManyRel":
                kwargs['widget'] = VerboseManyToManyRawIdWidget(db_field.rel, site)
            return db_field.formfield(**kwargs)
        return super(ImproveRawIdFieldsStackedInline, self).formfield_for_dbfield(db_field, **kwargs)


class MeetDependentAdmin(admin.ModelAdmin):
    """ meet field must be the first field in the first fieldset.
        The admin will need to dynamically make meet editable or read only, so needs to know where to find the field consistently. """
    fieldsets = ((None, {'fields': ('meet', ), 'description': ''}), )
    current_meet = models.Meet.objects.filter(is_current_meet=True)

    def get_fieldsets(self, request, obj=None):
        # If there's no active meet, hide fields until active meet has been set
        fieldsets = super(MeetDependentAdmin, self).get_fieldsets(request, obj)
        if not request.session.get('meet', ''):
            fieldsets = ((None, {
                'fields': ('meet', ),
                'description': 'Please go to the <a href="{}">Meet admin</a> and set an Active Meet.'.format(reverse('admin:meet_meet_changelist'))}),
            )
        return fieldsets

    def get_formsets_with_inlines(self, request, obj=None):
        # if there's a session project, but you're not editing the session project, do not display inlines.
        # necessary because the macro phases and channels of a non-active project are filtered out by the inlines'
        # model managers when there's a session project, giving the appearance that you've lost data.
        # you haven't, you just aren't allowed to see it until the project is set to be active.
        if obj:
            if not request.session.get('meet', {}):
                return []
        return super(MeetDependentAdmin, self).get_formsets_with_inlines(request, obj)

    def formfield_for_dbfield(self, db_field, **kwargs):
        # Add lnked raw id field functionality
        if db_field.name in self.raw_id_fields:
            kwargs.pop("request", None)
            type = db_field.rel.__class__.__name__
            if type == "ManyToOneRel":
                kwargs['widget'] = VerboseForeignKeyRawIdWidget(db_field.rel, site)
            elif type == "ManyToManyRel":
                kwargs['widget'] = VerboseManyToManyRawIdWidget(db_field.rel, site)
            return db_field.formfield(**kwargs)
        return super(MeetDependentAdmin, self).formfield_for_dbfield(db_field, **kwargs)

    def get_readonly_fields(self, request, obj=None):
        # when the session knows the current meet, don't let meet be editable
        # meet will be automatically set to the session meet when model is saved
        if self.fieldsets and self.fieldsets[0][1]['fields'][0] == 'meet' and request.session.get('meet', '') or not request.session.get('meet', ''):
            self.readonly_fields += ('meet',)
            # Change the display text of empty elements
            if request.session.get('meet', ''):
                self.empty_value_display = request.session['meet'].get('short_name', '???')
            return self.readonly_fields
        else:
            return []

    def save_model(self, request, obj, form, change):
        # when model is saved, test for existence of meet
        # if none, pull meet from session
        # if none in session, error thrown, however shouldn't happen since normal form validation on meet field fires first
        try:
            obj.meet
        except ObjectDoesNotExist:
            obj.meet = models.Meet.objects.get(id=request.session['meet']['id'])
        return super(MeetDependentAdmin, self).save_model(request, obj, form, change)

    def save_formset(self, request, form, formset, change):
        # when an inline formset is saved, set the meet from the session if it's not already there
        instances = formset.save(commit=False)
        for obj in formset.deleted_objects:
            obj.delete()
        for instance in instances:
            try:
                instance.meet
            except (ObjectDoesNotExist, AttributeError):
                instance.meet = models.Meet.objects.get(id=request.session['meet']['id'])
            instance.save()
        formset.save_m2m()

    def changelist_view(self, request, *args, **kwargs):
        # Sets the meet Filter to current meet saved in session by default
        # ?meet=1
        if request.session.get('meet', ''):
            try:
                test = request.META['HTTP_REFERER'].split(request.META['PATH_INFO'])
                meet_filter = 'meet={}'.format(request.session['meet'].get('id', 0))
                meet_filter = (meet_filter,)
                if test and test[-1] and not test[-1].startswith('?'):
                    url = reverse('admin:{}_{}_changelist'.format(self.opts.app_label, self.opts.model_name))
                    default_filters = []
                    for filter in meet_filter:
                        key = filter.split('=')[0]
                        if key not in request.GET:
                            default_filters.append(filter)
                    if default_filters:
                        return HttpResponseRedirect("{}?{}".format(url, "&".join(default_filters)))
            except Exception:
                pass
        return super(MeetDependentAdmin, self).changelist_view(request, *args, **kwargs)

    def has_change_permission(self, request, obj=None):
        if self.current_meet.count() != 1:
            return False
        return True

    def has_add_permission(self, request, obj=None):
        if self.current_meet.count() != 1:
            return False
        return True

    def has_delete_permission(self, request, obj=None):
        return True


@admin.register(models.ImportFairplayMeetArchive)
class ImportFairplayAdmin(admin.ModelAdmin):
    pass

    def has_add_permission(self, request):
        return False

    def has_change_permission(self, request, obj=None):
        return False
