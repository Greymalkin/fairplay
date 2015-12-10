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

from meet.models import Meet
from competition.models import LEDShow
from competition.models import Session, Event
from registration.models import Gymnast, Level

roster_html = """
<div style="margin-left:10px; margin-right:10px; margin-bottom:10px; margin-top:60px;">
<label for="led-show-select" class="grp-listing-small">LED Show</label>
<select id="led-show-select">
<option value="">---</option>
"""

for show in LEDShow.objects.all():
    roster_html += '<option value="{}">{}</option>'.format(show.id, show.name)

roster_html += """
</select>
<input id="led-show-button" type="button" value="Display Show" class="grp-button grp-default" style="width:100%;margin-top: 10px;"/>
</div>"""
roster_html += """
<script src="/static/js/jquery.ocupload-min.js"></script>
<script src="/static/js/dashboard.js"></script>
"""

try:
    MEET = Meet.objects.get(is_current_meet=True)
except:
    MEET = None


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
                'registration.models.Team',
                'registration.models.Coach',
                'registration.models.Gymnast',
                'registration.models.LevelPricing',
                'registration.models.GymnastPricing',
                'registration.models.Level',
                'registration.models.ShirtSize',
                ),
        ))

        # append an app list module for "Administration"
        self.children.append(modules.ModelList(
            _('Competition'),
            column=1,
            collapsible=False,
            models=(
                'competition.models.Athlete',
                'competition.models.Division',
                'competition.models.Session',
                'competition.models.Event',
                'competition.models.LEDShow',
                'competition.models.Team',
                'competition.models.TeamAward',
                'competition.models.TeamAwardRank',
                'competition.models.TeamAwardRankAthleteEvent',
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
                {
                    'title': 'Download Athlete Labels',
                    'url': '/labels/athlete/',
                    'external': False,
                },
                {
                    'title': 'Download Team Labels',
                    'url': '/labels/team/',
                    'external': False,
                },
                {
                    'title': 'Coaches Sign In',
                    'url': '/coaches/signin/',
                    'external': False,
                },
            ],
            post_content=roster_html
        ))

        try:
            links = []
            links.append({
                'title': 'Registration Metrics',
                'url': '/',
                'external': False,
                }),
            links.append({
                'title': 'For Ordering Team Awards',
                'url': '/order/awards/',
                'external': False,
                }),
            athlete_info = ""
            for level in Level.objects.all():
                level_count = Gymnast.objects.filter(meet=MEET, level=level, is_scratched=False).count()
                athlete_info += "<p style='margin-left:12px;'><strong>Level {} ({} athletes)</strong><ul style='margin-left:20px;margin-bottom:10px'>".format(level, level_count)
                for age in range(4, 19):
                    age_count = Gymnast.objects.filter(meet=MEET, level=level, age=age, is_scratched=False).count()
                    if age_count > 0:
                        athlete_info += "<li>{}yo ({} athletes)</li>".format(age, age_count)

                age_count = Gymnast.objects.filter(meet=MEET, level=level, age=None, is_scratched=False).count()
                if age_count > 0:
                    athlete_info += "<li>No age ({} athletes)</li>".format(age_count)
                athlete_info += "</ul></p>"

            self.children.append(modules.LinkList(
                _('Meet Breakdown'),
                column=3,
                children=links,
                post_content=athlete_info,
                css_classes=('grp-closed',),
            ))
        except:
            # no meet set, whoops
            pass

        try:
            sessions = Session.objects.filter(meet=MEET)
            for session in sessions:
                links = []
                links.append({
                    'title': 'Awards Ceremony',
                    'url': '/results/ceremony/event/{}'.format(session.id),
                    'external': False,
                    })
                # links.append({
                #     'title': 'Awards Ceremony (By division)',
                #     'url': '/results/ceremony/division/{}'.format(session.id),
                #     'external': False,
                #     })
                links.append({
                    'title': 'Individual Results',
                    'url': '/results/individual/{}'.format(session.id),
                    'external': False,
                    })
                links.append({
                    'title': 'Team Results',
                    'url': '/results/team/{}'.format(session.id),
                    'external': False,
                    })
                links.append({
                    'title': 'Warm-Up & Competition Rotations',
                    'url': '/rotations/{}'.format(session.id),
                    'external': False,
                    })
                links.append({
                    'title': 'Announcer Script: Teams at Meet Start ',
                    'url': '/announcer/{}'.format(session.id),
                    'external': False,
                    })
                links.append({
                    'title': 'Program Book: Scoresheet',
                    'url': '/scoresheet/{}'.format(session.id),
                    'external': False,
                    })
                # links.append({
                #     'title': 'Download Athlete Labels',
                #     'url': '/labels/athlete/{}'.format(session.id),
                #     'external': False,
                #     })
                # links.append({
                #     'title': 'Download Team Labels',
                #     'url': '/labels/team/{}'.format(session.id),
                #     'external': False,
                #     })
                links.append({
                    'title': 'Coaches Hospitality',
                    'url': '/coaches/hospitality/{}'.format(session.id),
                    'external': False,
                    })
                links.append({
                    'title': 'Individual Teams Rosters',
                    'url': '/team/roster/{}'.format(session.id),
                    'external': False,
                    })
                links.append({
                    'title': 'All Teams Roster & Gymnast Sign In',
                    'url': '/allteams/roster/{}'.format(session.id),
                    'external': False,
                    })

                header = ""
                counts = ""
                for event in Event.objects.filter(meet=MEET):
                    count = Gymnast.objects.filter(division__session__id=session.id, starting_event=event, is_scratched=False).count()
                    header += '<th>{}</th>'.format(event.initials)
                    link = '/admin/competition/athlete/?session={}&starting_event__id__exact={}'.format(session.id, event.id)
                    counts += '<td><a href="{}">{}</a></td>'.format(link, count)

                self.children.append(modules.LinkList(
                    _(session.name),
                    column=2,
                    children=links,
                    css_classes=('grp-closed',),
                    post_content='<table class="starting_event"><tr>{}</tr><tr>{}</tr></table>'.format(header, counts),
                ))
        except:
            # no meet set, whoops
            pass

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
