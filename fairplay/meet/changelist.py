from django.contrib.admin.views.main import ChangeList
from django.contrib import messages
from django.core.urlresolvers import reverse
from django.utils.html import format_html


class ChangeList(ChangeList):

    def get_queryset(self, request):
        qs = super(ChangeList, self).get_queryset(request)
        print(self.model)
        if not request.session.get('meet', ''):
            qs = self.model.objects.none()
            msg = '''No Active meet has been set.
                     Go to the <a href="{}">Meet admin</a> and set an active meet.
                  '''.format(reverse('admin:meet_meet_changelist'))
            messages.error(request, format_html(msg))
        return qs
