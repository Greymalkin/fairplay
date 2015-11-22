from django.conf.urls import patterns, include, url
from django.contrib import admin
from rest_framework.routers import DefaultRouter
import competition.views

router = DefaultRouter()
router.register(r'events', competition.views.EventViewSet)
router.register(r'teams', competition.views.TeamViewSet)
router.register(r'athletes', competition.views.AthleteViewSet)
router.register(r'athleteevents', competition.views.AthleteEventViewSet)
router.register(r'sessions', competition.views.SessionViewSet)


urlpatterns = patterns(
    '',
    url(r'^grappelli/', include('grappelli.urls')),
    url(r'^admin/',  include(admin.site.urls)),
    url(r'^api/', include(router.urls)),
    url(r'^ledsign/', competition.views.led_sign),
    url(r'^roster/', competition.views.download_roster),
    url(r'^results/ceremony/(?P<id>\d+)/$', competition.views.SessionCeremonyView.as_view()),
    url(r'^results/individual/(?P<id>\d+)/$', competition.views.SessionIndividualView.as_view()),
    url(r'^results/team/(?P<id>\d+)/$', competition.views.SessionTeamView.as_view()),
    url(r'^scoresheet/(?P<id>\d+)/$', competition.views.SessionScoresheetView.as_view()),
    url(r'^labels/(?P<id>\d+)/$', competition.views.SessionLabelsView.as_view()),
)
