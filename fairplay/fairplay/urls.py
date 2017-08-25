from django.conf.urls import include, url
from django.contrib import admin
from django.conf import settings
from django.conf.urls.static import static
from django.views.generic import TemplateView
from rest_framework.routers import DefaultRouter
import competition.views
import registration.views
import meet.views

admin.site.site_header = settings.GRAPPELLI_ADMIN_TITLE = 'Fairplay Gymnastics Scoreboard'

router = DefaultRouter()
router.register(r'meet', meet.views.MeetViewSet)
router.register(r'events', competition.views.EventViewSet)
router.register(r'teams', competition.views.TeamViewSet)
router.register(r'athletes', competition.views.AthleteViewSet)
router.register(r'athleteevents', competition.views.GymnastEventViewSet)
router.register(r'sessions', competition.views.SessionViewSet)
router.register(r'ledshows', competition.views.LEDShowViewSet)

urlpatterns = []

if settings.DEBUG:
    import debug_toolbar
    # urlpatterns = static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ]


urlpatterns += [
    url(r'^grappelli/', include('grappelli.urls')),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^api/', include(router.urls)),
    url(r'^scoreboard/(.*)', TemplateView.as_view(template_name='scoreboard.html')),
    url(r'^ledsign/', competition.views.led_sign),
    url(r'^roster/', competition.views.download_roster),
    url(r'^coaches/signin/$', competition.views.CoachSignInView.as_view()),
    url(r'^results/ceremony/division/(?P<id>\d+)/$', competition.views.SessionCeremonyDivisionView.as_view()),
    url(r'^results/ceremony/event/(?P<id>\d+)/$', competition.views.SessionCeremonyEventView.as_view()),
    url(r'^coaches/hospitality/(?P<id>\d+)/$', competition.views.SessionCoachHospitalityView.as_view()),
    url(r'^results/individual/(?P<id>\d+)/$', competition.views.SessionIndividualView.as_view()),
    url(r'^results/team/(?P<id>\d+)/$', competition.views.SessionTeamView.as_view()),
    url(r'^scoresheet/(?P<id>\d+)/$', competition.views.SessionScoresheetView.as_view()),
    url(r'^labels/athlete/$', competition.views.download_athlete_labels),
    url(r'^labels/team/$', competition.views.download_team_labels),
    url(r'^labels/medal/$', competition.views.download_medal_labels),
    url(r'^rotations/(?P<id>\d+)/$', competition.views.SessionRotationView.as_view()),
    url(r'^announcer/(?P<id>\d+)/$', competition.views.SessionAnnouncerView.as_view()),
    url(r'^gymnast/signin/(?P<id>\d+)/$', competition.views.SessionGymnastSignInView.as_view()),
    url(r'^allteams/roster/(?P<id>\d+)/$', competition.views.SessionAllTeamsRosterView.as_view()),
    url(r'^team/roster/(?P<id>\d+)/$', competition.views.SessionTeamRosterView.as_view()),
    url(r'^breakdown/$', registration.views.MeetBreakdownView.as_view()),
    url(r'^order/awards/$', registration.views.OrderingAwardsView.as_view()),
]
