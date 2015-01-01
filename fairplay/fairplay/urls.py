from django.conf.urls import patterns, include, url
from django.contrib import admin
from rest_framework.routers import DefaultRouter
import gymnastics.views

router = DefaultRouter()
router.register(r'events', gymnastics.views.EventViewSet)
router.register(r'teams', gymnastics.views.TeamViewSet)
router.register(r'athletes', gymnastics.views.AthleteViewSet)
router.register(r'athleteevents', gymnastics.views.AthleteEventViewSet)
router.register(r'messages', gymnastics.views.MessageViewSet)
router.register(r'sessions', gymnastics.views.SessionViewSet)


urlpatterns = patterns(
    '',
    url(r'^grappelli/', include('grappelli.urls')),
    url(r'^admin/',  include(admin.site.urls)),
    url(r'^api/', include(router.urls)),
    url(r'^ledsign/', gymnastics.views.led_sign),
    url(r'^roster/', gymnastics.views.download_roster),
    url(r'^ceremony/(?P<id>\d+)/$', gymnastics.views.SessionCeremonyView.as_view()),
)
