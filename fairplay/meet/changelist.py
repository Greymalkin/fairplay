from django.contrib.admin.views.main import ChangeList
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.utils.html import format_html


class MeetDependentChangeList(ChangeList):

    def get_queryset(self, request):
        qs = super(MeetDependentChangeList, self).get_queryset(request)
        if not request.session.get('meet', ''):
            qs = self.model.objects.none()
            msg = '''No Active meet has been set.
                     Go to the <a href="{}">Meet admin</a> and set an active meet.
                  '''.format(reverse('admin:meet_meet_changelist'))
            messages.error(request, format_html(msg))
        return qs


class MeetAdminChangeList(ChangeList):

    def get_queryset(self, request):
        qs = super(MeetAdminChangeList, self).get_queryset(request)
        if not request.session.get('meet', ''):
            msg = '''No Active meet has been set. Click "Set Active Meet" from an option in the table below.
                  '''
            messages.info(request, format_html(msg))

            msg = '''You may create a new meet manually, import existing meet data from an archive, or install an Fairplay starter.
                  '''
            messages.info(request, format_html(msg))

        return qs
