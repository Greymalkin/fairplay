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

upload_html = """
<br/>
<div style="margin:5px;">
    <input id='upload_roster' type="button" value="Upload Roster" class="grp-button grp-default" style="width:100%;margin-bottom:3px;margin-top:6px;padding-bottom:20px;"/>
    <input id='download_roster' type="button" value="Download Roster" class="grp-button grp-default" style="width:100%;margin-bottom:3px;margin-top:6px;"/>
</div>
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

        # append another link list module for "support".
        self.children.append(modules.LinkList(
            _('Support'),
            column=2,
            children=[
                {
                    'title': _('Scoreboard Control'),
                    'url': '/static/scoreboard.html',
                    'external': False,
                },
                {
                    'title': _('Leaderboard'),
                    'url': '/leaderboard',
                    'external': False,
                },
            ],
            post_content=upload_html
        ))

        # append a recent actions module
        self.children.append(modules.RecentActions(
            _('Recent Actions'),
            limit=5,
            collapsible=False,
            column=2,
        ))


