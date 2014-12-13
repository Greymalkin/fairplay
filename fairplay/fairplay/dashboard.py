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

from gymnastics.models import Session

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
            _('Meet Configuration'),
            column=1,
            collapsible=False,
            models=(
                'gymnastics.models.Event',
                'gymnastics.models.Group',
                'gymnastics.models.Team',
                'gymnastics.models.Athlete',
                'gymnastics.models.TeamAward',
                'gymnastics.models.Session',
                'gymnastics.models.Message',
                ),
        ))

        # append an app list module for "Administration"
        self.children.append(modules.ModelList(
            _('Administration'),
            css_classes=('grp-closed',),
            column=1,
            collapsible=True,
            models=('django.contrib.*', 'gymnastics.models.LEDSign'),
        ))

        tools = [
            {
                'title': _('Scoreboard Control'),
                'url': '/static/scoreboard.html',
                'external': False,
            },
        ]

        sessions = Session.objects.all()
        for session in sessions:
            tools.append({
                'title': "{} Leaderboard".format(session.name),
                'url': '/leaderboard/{}'.format(session.id),
                'external': False,
                })

        # append another link list module for "support".
        self.children.append(modules.LinkList(
            _('Tools'),
            column=2,
            children=tools,
        ))

        self.children.append(modules.LinkList(
            _('Roster'),
            column=2,
            children=[
                {
                    'title': _('Download Roster'),
                    'url': '/roster',
                    'external': False,
                },
            ],
            post_content=roster_html
        ))

        # append a recent actions module
        self.children.append(modules.RecentActions(
            _('Recent Actions'),
            limit=5,
            collapsible=False,
            column=2,
        ))


