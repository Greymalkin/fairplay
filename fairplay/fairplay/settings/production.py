from .base import *

DEBUG = True
ALLOWED_HOSTS = ['scores.fairlandboysgymnastics.org', ]

WSGI_APPLICATION = 'fairplay.wsgi_production.application'
STATIC_ROOT = '/srv/static/'
MEDIA_ROOT = '/srv/media/'
