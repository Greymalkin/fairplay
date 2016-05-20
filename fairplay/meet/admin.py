import datetime
from copy import deepcopy, copy
from django.db.models.signals import pre_save, post_save
from django.contrib import admin, messages
from request_provider.signals import get_request
from django.contrib.admin import SimpleListFilter


from . import models
from registration.models import Level, Team, Coach
from competition.models import Event, TeamAward, AthleteEvent

class MeetAdmin(admin.ModelAdmin):
    list_display = ('short_name', 'host', 'date', 'is_current_meet', 'set_meet')
    actions = ['copy_meet']

    def set_meet(self, obj):
        request = get_request()
        meet = request.session.get('meet', {})
        if meet.get('id', '') == obj.id:
            return "<strong>Active Meet</strong>"
        return "<a class='setMeet' href='#' data-meet={}>Set Active Meet</a>".format(obj.id)
    set_meet.short_description = "Active Meet"
    set_meet.allow_tags = True

    def save_model(self, request, obj, form, change):
        if obj.is_current_meet:
            # only alllow a single default
            self.model.objects.all().exclude(id=obj.id).update(is_current_meet=False)

            # Set current project in session
            request.session['meet'] = {
                "id": obj.id,
                "name": obj.name,
                "short_name": obj.short_name
            }
        # Current meet was toggled off.  Remove from session
        elif request.session.get('meet', '') and request.session['meet'].get('id', 0) == obj.id:
            request.session['meet'] = {}
        obj.save()

    def delete_model(self, request, obj):
        if request.session.get('meet', {}) and request.session['meet'].get('id', '') == obj.id:
            request.session['meet'] = {}

        if self.model.objects.count() > 1:
            if obj.is_current_meet:
                q = self.model.objects.filter(is_current_meet=False).order_by('-id')[:1]
                new_active = q[0]
                new_active.is_current_meet = True
                new_active.save()
            obj.delete()

    def get_formsets_with_inlines(self, request, obj=None):
        # if there's a session project, but you're not editing the session project, do not display inlines.
        # necessary because the macro phases and channels of a non-active project are filtered out by the inlines'
        # model managers when there's a session project, giving the appearance that you've lost data.
        # you haven't, you just aren't allowed to see it until the project is set to be active.
        if request.session.get('meet', {}) and request.session['meet'].get('id', '') != obj.id:
            return []
        return super(MeetAdmin, self).get_formsets_with_inlines(request, obj)


    def copy_meet(self, request, queryset):
        current_meet = queryset[0]
        levels = Level.objects.filter(meet=current_meet)
        events = Event.objects.filter(meet=current_meet)
        awards = TeamAward.objects.filter(meet=current_meet)

        new_meet = deepcopy(current_meet)
        new_meet.name = 'New MEET!'
        new_meet.short_name = 'New MEET!'
        new_meet.is_current_meet = False
        new_meet.date = datetime.datetime.today()
        new_meet.id = None
        new_meet.save()

        for level in levels:
            old_obj = copy(level) 
            old_obj.id = None 
            old_obj.meet = new_meet
            pre_save.disconnect(receiver=None, sender=Level, dispatch_uid='save_current_meet_level')
            old_obj.save()

        for event in events:
            old_obj = copy(event) 
            old_obj.id = None 
            old_obj.meet = new_meet
            pre_save.disconnect(receiver=None, sender=Event, dispatch_uid='save_current_meet_event')
            post_save.disconnect(receiver=None, sender=AthleteEvent, dispatch_uid='update_rankings')
            post_save.disconnect(receiver=None, sender=Event, dispatch_uid='populate_event')
            old_obj.save()
            # post_save.connect(receiver=None, sender=AthleteEvent, dispatch_uid='update_rankings')

        messages.success(request, 'New meet {} copied from {}'.format(new_meet.name, current_meet.name))

    class Media:
        js = ("/static/js/meet.js",)


# Base form that all admins with a FK to Project inherit from
# Enforces ties to the currently active Project (saved in Session variable) when creating new instances

# Filters 

class MeetFilter(SimpleListFilter):
    title = ('meet')
    parameter_name = 'meet'

    def lookups(self, request, model_admin):
        qs = models.Meet.objects.all().order_by('short_name')
        return [(s.id, s.short_name) for s in qs]

    def queryset(self, requests, queryset):
        value = self.value()
        if value:
            queryset = queryset.filter(meet=value)
        return queryset


class MeetDependentAdmin(admin.ModelAdmin):
    """ Project field must be the first field in the first fieldset.
        The admin will need to dynamically make project editable or read only, so needs to know where to find the field consistently. """
    fieldsets = ((None, {
        'fields': ('meet', ),
        'description': ''
        }),
    )
    list_filter = [MeetFilter]

    # class Media:
    #     css = {"all": ("{}css/expand_textfield_maxwidth.css".format(settings.STATIC_URL),)}

    def get_readonly_fields(self, request, obj=None):
        # when the session knows the current project, don't let meet be editable
        # meet will be automatically set to the session meet when model is saved
        if self.fieldsets and self.fieldsets[0][1]['fields'][0] == 'meet' and request.session.get('meet', ''):
            self.readonly_fields += ('meet',)
            self.empty_value_display = request.session['meet'].get('short_name', '???')
            return self.readonly_fields
        else:
            return []

    def save_model(self, request, obj, form, change):
        # when model is saved, test for existence of project
        # if none, pull meet from session
        # if none in session, error thrown, however shouldn't happen since normal form validation on meet field fires first
        try:
            meet = obj.meet
        except ObjectDoesNotExist:
            obj.meet = models.Meet.objects.get(id=request.session['meet']['id'])
        return super(MeetDependentAdmin, self).save_model(request, obj, form, change)



    # def get_formsets_with_inlines(self, request, obj=None):
    #     # when an inline formset is rendered, make the project field read only
    #     for inline in self.get_inline_instances(request, obj):
    #         formset = inline.get_formset(request, obj)
    #         form = formset.form
    #         if request.session.get('project', {}) and request.session['project'].get('id', ''):
    #             inline.readonly_fields += ('project',)
    #             inline.empty_value_display = request.session['project'].get('name', '???')
    #         yield inline.get_formset(request, obj), inline

    def save_formset(self, request, form, formset, change):
        # when an inline formset is saved, make the set the project from the session if it's not already there
        instances = formset.save(commit=False)
        for obj in formset.deleted_objects:
            obj.delete()
        for instance in instances:
            print('**** in save_formset during a not-delete')
            try:
                project = instance.project
            except (ObjectDoesNotExist, AttributeError):
                instance.project = models.Project.objects.get(id=request.session['project']['id'])
            instance.save()
        formset.save_m2m()

    def changelist_view(self, request, *args, **kwargs):
        # Sets the Project Filter to current project saved in session by default
        # ?project=1
        if request.session.get('project', ''):
            try:
                test = request.META['HTTP_REFERER'].split(request.META['PATH_INFO'])
                project_filter = 'project={}'.format(request.session['project'].get('id', 0))
                project_filter = (project_filter,)
                if test and test[-1] and not test[-1].startswith('?'):
                    url = reverse('admin:{}_{}_changelist'.format(self.opts.app_label, self.opts.model_name))
                    default_filters = []
                    for filter in project_filter:
                        key = filter.split('=')[0]
                        if key not in request.GET:
                            default_filters.append(filter)
                    if default_filters:
                        return HttpResponseRedirect("{}?{}".format(url, "&".join(default_filters)))
            except: pass
        return super(ProjectDependentAdmin, self).changelist_view(request, *args, **kwargs)



admin.site.register(models.Meet, MeetAdmin)
