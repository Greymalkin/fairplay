"""
This file was generated with the customdashboard management command and
contains the class for the main dashboard.

To activate your index dashboard add the following to your settings.py::
    GRAPPELLI_INDEX_DASHBOARD = 'fairplay.dashboard.CustomIndexDashboard'
"""

from django.utils.translation import ugettext_lazy as _
from django.urls import reverse
from grappelli.dashboard import modules, Dashboard
# from grappelli.dashboard.utils import get_admin_site_name

from meet.views import get_current_meet_count, no_meets_at_all
from registration.models import Gymnast
from competition.models import LEDShow, Session, Event, total_meet_medals

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


class CustomIndexDashboard(Dashboard):

    def init_with_context(self, context):
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
                'competition.models.Event',
                'registration.models.Level',
                'competition.models.Division',
                'competition.models.TeamAward',
                'registration.models.ShirtSize',
                'competition.models.LEDShow',
                'competition.models.LEDSign',
            ),
        ))

        if not no_meets_at_all():
            self.children.append(modules.ModelList(
                _('Upload USAG Reservation'),
                collapsible=True,
                column=1,
                template='grappelli/dashboard/modules/uploader.html',
                models=('registration.models.ImportUsagReservation',)
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
                # 'competition.models.WomensArtisticGymnast',
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
                'registration.models.Discipline',
                'registration.models.GymnastNotes',
                'registration.models.TeamNotes',
            ),
        ))

        # Two forms are not working on the same page. Leaving this until I can figure out why.
        # self.children.append(modules.Group(
        #     title="Upload Files & Import Data",
        #     column=1,
        #     collapsible=True,
        #     css_classes=('grp-closed',),
        #     children=[
        #         modules.AppList(
        #             title='USAG Reservations / FAIRPLAY Meet',
        #             template='grappelli/dashboard/modules/uploader.html',
        #             models=('registration.models.ImportUsagReservation',)
        #         ),
        #         modules.AppList(
        #             title='FAIRPLAY Meet (From Export)',
        #             template='grappelli/dashboard/modules/fairplay_uploader.html',
        #             models=('meet.models.ImportFairplayMeetArchive',)
        #         )
        #     ]
        # ))

        if get_current_meet_count() == 1:

            self.children.append(modules.LinkList(
                _('Tools'),
                column=2,
                layout='inline',
                css_classes=('grp-open',),
                children=(
                    ['Scoreboard Control', '/scoreboard/'],
                    ['Download Roster', '/roster/'],
                    ['Download Athlete Labels', '/labels/athlete/'],
                    ['Download Team Labels', '/labels/team/'],
                    ['Download Medal Labels', '/labels/medal/'],
                    ['Coaches Sign In', '/coaches/signin/'],
                ),
                post_content=roster_html
            ))

            self.children.append(modules.LinkList(
                _('Registration Tools'),
                column=2,
                layout='inline',
                css_classes=('grp-open',),
                children=(
                    ['Meet Breakdown ({} awards)'.format(total_meet_medals()), '/breakdown/'],
                    ['Team Awards Breakdown', '/order/awards/'],
                    ['Coaches Hospitality', '/coaches/hospitality/'],
                    {
                        'title': 'Export Fairplay (Active Meet Only)',
                        'url': reverse('export_current_meet'),
                        'external': False,
                    },
                ),
                post_content='<script src="/static/js/dashboard.js"></script>'
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
                links.append({
                    'title': 'Awards Ceremony (By division)',
                    'url': '/results/ceremony/division/{}'.format(session.id),
                    'external': False,
                })
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
                    'title': 'Individual Teams Rosters',
                    'url': '/team/roster/{}'.format(session.id),
                    'external': False,
                })
                links.append({
                    'title': 'All Teams Roster & Gymnast Sign In',
                    'url': '/allteams/roster/{}'.format(session.id),
                    'external': False,
                })

            # Table of Starting Events, with links to Gymnast admin
            #      if meet has mag and wag, the combined events will blow out the borders
            #      instead of combining mag and wag as one meet, should break each discipline into its own meet

                header = counts = ""
                for event in Event.objects.filter(is_mag=True):  # competition.Event
                    count = Gymnast.objects.filter(division__session__id=session.id, starting_event=event, is_scratched=False).count()
                    header += '<th>{}</th>'.format(event.initials)
                    link = '/admin/registration/gymnast/?meet={}&session={}&starting_event={}&is_scratched__exact=0'.format(session.meet.id, session.id, event.id)
                    counts += '<td><a href="{}">{}</a></td>'.format(link, count)

                self.children.append(modules.LinkList(
                    _(session.name),
                    column=3,
                    children=links,
                    css_classes=('grp-closed',),
                    post_content='<table class="starting_event"><tr>{}</tr><tr>{}</tr></table>'.format(header, counts),
                ))

        self.children.append(modules.LinkList(
            _('Fairplay Starters'),
            column=2,
            children=(
                ['Men\'s Meet', reverse('run-task', kwargs={'task': 'task-a'})],
            ),
            css_classes=('grp-open',),
        ))
