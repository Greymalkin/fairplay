"""
This file was generated with the customdashboard management command and
contains the class for the main dashboard.

To activate your index dashboard add the following to your settings.py::
    GRAPPELLI_INDEX_DASHBOARD = 'fairplay.dashboard.CustomIndexDashboard'
"""

from django.utils.translation import ugettext_lazy as _

from grappelli.dashboard import modules, Dashboard
from grappelli.dashboard.utils import get_admin_site_name

from meet.views import get_current_meet_count, get_current_meet_id, get_current_meet_name
from registration.models import Gymnast
from competition.models import LEDShow, Session, Event
from meet.models import Meet


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

# meet_name = get_current_meet_name()

# meets_html = """
# <div style="margin-left:10px; margin-right:10px; margin-bottom:10px;">
# <label for="active-meet-select" class="grp-listing-small">{}</label>
# <select id="active-meet-select">
# <option value="">---</option>
# """.format(meet_name)

# for meet in Meet.objects.all().order_by('short_name'):
#     try:
#         if get_current_meet_id()[0] == meet.id:
#             meets_html += '<option selected value="{}">{}</option>'.format(meet.id, meet.name)
#         else:
#             meets_html += '<option value="{}">{}</option>'.format(meet.id, meet.name)
#     except Exception:
#         meets_html += '<option value="{}">{}</option>'.format(meet.id, meet.name)

# meets_html += """
# </select>
# <input id="active-meet-button" type="button" value="Set Active Meet" class="grp-button grp-default" style="width:100%;margin-top: 10px;"/>
# </div>"""
# meets_html += """
# <script src="/static/js/meet.js"></script>"""

# roster_html += meets_html


class CustomIndexDashboard(Dashboard):

    def init_with_context(self, context):
        # site_name = get_admin_site_name(context)

        self.children.append(modules.ModelList(
            _('Meet'),
            column=1,
            collapsible=False,
            models=(
                'meet.models.Meet',
                'competition.models.Session',
                ),
        ))

        self.children.append(modules.ModelList(
            _('Configuration'),
            column=1,
            collapsible=True,
            css_classes=('grp-closed',),
            models=(
                'competition.models.Event',  # competition.Event
                'registration.models.Level',
                'competition.models.Division',
                'competition.models.TeamAward',
                'registration.models.ShirtSize',
                'competition.models.LEDShow',
                'competition.models.LEDSign',
                ),
        ))

        self.children.append(modules.ModelList(
            _('Registration'),
            column=1,
            collapsible=False,
            models=(
                'registration.models.Team',
                'registration.models.Coach',
                'registration.models.Gymnast',
                ),
        ))

        self.children.append(modules.ModelList(
            _('Competition'),
            column=1,
            collapsible=False,
            models=(
                'competition.models.MensArtisticGymnast',
                'competition.models.WomensArtisticGymnast',
                'competition.models.GymnastEvent',
                'competition.models.TeamAwardRank',
                'competition.models.TeamAwardRankEvent',
                ),
        ))

        self.children.append(modules.ModelList(
            _('Administration'),
            css_classes=('grp-closed',),
            column=1,
            collapsible=True,
            models=(
                'django.contrib.*',
            ),
        ))

        if get_current_meet_count() == 1:
            # self.children.append(modules.LinkList(
            #     _('Active Meet'),
            #     column=2,
            #     children=[],
            #     post_content=meets_html
            # ))

            self.children.append(modules.LinkList(
                _('Tools'),
                column=2,
                children=[
                    {
                        'title': _('Scoreboard Control'),
                        'url': '/scoreboard',
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
                        'title': 'Download Medal Labels',
                        'url': '/labels/medal/',
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

            links = []
            links.append({
                'title': 'Meet Breakdown',
                'url': '/breakdown/',
                'external': False,
                }),
            links.append({
                'title': 'Team Awards Breakdown',
                'url': '/order/awards/',
                'external': False,
                }),

            self.children.append(modules.LinkList(
                _('Registration Metrics'),
                column=2,
                children=links,
                # post_content=athlete_info,
                css_classes=('grp-open',),
            ))

        # For every Session, links for printables
            sessions = Session.objects.all()
            for session in sessions:
                links = []
                links.append({
                    'title': 'Awards Ceremony (By event)',
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

            # Table of Starting Events, with links to Competition.Gymnast admin
                header = ""
                counts = ""
                for event in Event.objects.all():
                    count = Gymnast.objects.filter(division__session__id=session.id, starting_event=event, is_scratched=False).count()
                    header += '<th>{}</th>'.format(event.initials)
                    link = '/admin/registration/gymnast/?meet={}&session={}&starting_event={}'.format(session.meet.id, session.id, event.id)
                    counts += '<td><a href="{}">{}</a></td>'.format(link, count)

                self.children.append(modules.LinkList(
                    _(session.name),
                    column=3,
                    children=links,
                    css_classes=('grp-closed',),
                    post_content='<table class="starting_event"><tr>{}</tr><tr>{}</tr></table>'.format(header, counts),
                ))

        # append a recent actions module
        self.children.append(
            modules.Group(
                _('Logging'),
                column=2,
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
                ],
            ),
        )
