"""
This file was generated with the customdashboard management command and
contains the class for the main dashboard.

To activate your index dashboard add the following to your settings.py::
    GRAPPELLI_INDEX_DASHBOARD = 'fairplay.dashboard.CustomIndexDashboard'
"""

from django.utils.translation import ugettext_lazy as _
from django.core.urlresolvers import reverse

from grappelli.dashboard import modules, Dashboard
from grappelli.dashboard.utils import get_admin_site_name

from competition.models import Session, Event
from registration.models import Gymnast, Level

roster_html = """
<script src="/static/js/jquery.ocupload-min.js"></script>
<script src="/static/js/dashboard.js"></script>
"""


class CustomIndexDashboard(Dashboard):
    """
    Custom index dashboard for www.
    """

    def init_with_context(self, context):
        site_name = get_admin_site_name(context)

        # append an app list module for "Administration"
        self.children.append(modules.ModelList(
            _('Meet Settings'),
            column=1,
            collapsible=False,
            models=(
                'meet.models.Meet',
                ),
        ))

        # append an app list module for "Administration"
        self.children.append(modules.ModelList(
            _('Registration'),
            column=1,
            collapsible=False,
            models=(
                'registration.models.*',),
        ))

        # append an app list module for "Administration"
        self.children.append(modules.ModelList(
            _('Competition'),
            column=1,
            collapsible=False,
            models=(
                'competition.models.Event',
                'competition.models.Division',
                # 'competition.models.Team',
                # 'competition.models.Athlete',
                'competition.models.TeamAward',
                'competition.models.Session',
                'competition.models.Message',
                ),
        ))

        # append an app list module for "Administration"
        self.children.append(modules.ModelList(
            _('Administration'),
            css_classes=('grp-closed',),
            column=1,
            collapsible=True,
            models=(
                'django.contrib.*',
                'competition.models.LEDSign',
                'meet.models.Meet',),
        ))

        self.children.append(modules.LinkList(
            _('Tools'),
            column=3,
            children=[
                {
                    'title': _('Scoreboard Control'),
                    'url': '/static/scoreboard.html',
                    'external': False,
                },
                {
                    'title': _('Download Roster'),
                    'url': '/roster',
                    'external': False,
                },
            ],
            post_content=roster_html
        ))

        levels = []
        for level in Level.objects.all():
            level_count = Gymnast.objects.filter(level=level).count()
            levels.append({
                'title': 'Level {} ({} athletes)'.format(level.level, level_count),
                'url': 'registration/gymnast/?level__id__exact={}'.format(level.id),
                'external': False,
            })

        self.children.append(modules.LinkList(
            _('Registrants'),
            column=3,
            children=levels,
        ))

        # sessions = Session.objects.all()
        # for session in sessions:
        #     links = []
        #     links.append({
        #         'title': 'Awards Ceremony',
        #         'url': '/results/ceremony/{}'.format(session.id),
        #         'external': False,
        #         })
        #     links.append({
        #         'title': 'Individual Results',
        #         'url': '/results/individual/{}'.format(session.id),
        #         'external': False,
        #         })
        #     links.append({
        #         'title': 'Team Results',
        #         'url': '/results/team/{}'.format(session.id),
        #         'external': False,
        #         })

        #     header = ""
        #     counts = ""
        #     for event in Event.objects.all():
        #         count = Gymnast.objects.filter(group__session__id=session.id, starting_event=event).count()
        #         header += '<th>{}</th>'.format(event.initials)
        #         link = '/admin/gymnastics/athlete/?session={}&starting_event__id__exact={}'.format(session.id, event.id)
        #         counts += '<td><a href="{}">{}</a></td>'.format(link, count)

        #     self.children.append(modules.LinkList(
        #         _(session.name),
        #         column=2,
        #         children=links,
        #         post_content='<table class="starting_event"><tr>{}</tr><tr>{}</tr></table>'.format(header, counts),
        #     ))

        # append a recent actions module
        self.children.append(
            modules.Group(
                _('Logging'),
                column=3,
                collapsible=True,
                exclude=('django.contrib.*',),
                children=[
                    modules.ModelList(
                        column=1,
                        collapsible=False,
                        models=(
                            'django.contrib.admin.models.LogEntry',
                        ),
                    ),
                    modules.RecentActions(
                        _('Recent Actions'),
                        limit=5,
                        collapsible=False,
                        column=1,
                    )
                ],
            ),
        )
