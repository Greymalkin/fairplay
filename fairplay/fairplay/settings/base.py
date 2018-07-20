"""
Django settings for fairplay project.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.7/ref/settings/
"""

from .secrets import *

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

LED_SIGN_HOST = '192.168.1.1'
LED_SIGN_PORT = 8899

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.7/howto/deployment/checklist/

USE_TZ = True

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'debug': DEBUG,
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

# Application definition

INSTALLED_APPS = [
    'django.contrib.contenttypes',
    'grappelli.dashboard',
    'corsheaders',
    'grappelli',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'debug_toolbar',
    'django_extensions',
    'rest_framework',
    'localflavor',
    'competition',
    'registration',
    'meet',
]

MIDDLEWARE_CLASSES = [
    'django.contrib.sessions.middleware.SessionMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'request_provider.middleware.RequestProvider',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
]

# to use get_request()
# from request_provider.signals import get_request

ROOT_URLCONF = 'fairplay.urls'

WSGI_APPLICATION = 'fairplay.wsgi.application'


# Internationalization
# https://docs.djangoproject.com/en/1.7/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'America/New_York'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# REST API
REST_FRAMEWORK = {
    'DEFAULT_RENDERER_CLASSES': (
        'rest_framework.renderers.JSONRenderer',
        'rest_framework.renderers.BrowsableAPIRenderer',
        'rest_framework.renderers.TemplateHTMLRenderer',
    ),
    'DEFAULT_FILTER_BACKENDS': ('rest_framework.filters.DjangoFilterBackend',)
}

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.7/howto/static-files/

STATIC_URL = '/static/'

GRAPPELLI_ADMIN_TITLE = "Fairland Gymnastics Competition Scoreboard"

GRAPPELLI_INDEX_DASHBOARD = 'fairplay.dashboard.CustomIndexDashboard'

IMPORT_ATHLETES_FIRST_ROW = 1
IMPORT_ATHLETES_FIRSTNAME_COL = 0
IMPORT_ATHLETES_LASTNAME_COL = 1
IMPORT_ATHLETES_TEAM_COL = 2
IMPORT_ATHLETES_LEVEL_COL = 3
IMPORT_ATHLETES_AGE_GROUP_COL = 4
IMPORT_ATHLETES_ATHLETE_ID_COL = 6

# for MAG Competition Age calculation
COMPETITION_MONTH = 5
COMPETITION_DATE = 31

TEAM_AWARD_COST = 50
GYMNAST_COST = 90
LATE_GYMNAST_COST = 100

USAG_MAX_VERIFY = 100
USAG_USER = 'FairlandFBB'
USAG_PASS = 'fa1rl2ndfbb'
USAG_LOGIN_URL = 'https://usagym.org/fw/login.html'
UASG_VERIFY_URL = 'https://usagym.org/app/sanctionDetailVerifyWS.html'
USAG_VERIFY_DATA = {
    'sEcho': 0,
    'iColumns': 8,
    'sColumns': None,
    'iDisplayStart': 0,
    'iDisplayLength': -1,
    'iSortingCols': 2,
    'iSortCol_0': 0,
    'sSortDir_0': 'asc',
    'iSortCol_1': 1,
    'sSortDir_1': 'asc',
    'bSortable_0': True,
    'bSortable_1': True,
    'bSortable_2': True,
    'bSortable_3': True,
    'bSortable_4': True,
    'bSortable_5': True,
    'bSortable_6': True,
    'bSortable_7': True,
    'program': 2,
    'type': 'athlete',
    'show': 'all',
    'memNumbers': ''
}


# INTERNAL_IPS = ('127.0.0.1', 'localhost')
INTERNAL_IPS = ('',)
DEBUG_TOOLBAR_PANELS = [
    # 'debug_toolbar.panels.versions.VersionsPanel',
    'debug_toolbar.panels.timer.TimerPanel',
    'debug_toolbar.panels.settings.SettingsPanel',
    'debug_toolbar.panels.headers.HeadersPanel',
    'debug_toolbar.panels.request.RequestPanel',
    'debug_toolbar.panels.sql.SQLPanel',
    # 'debug_toolbar.panels.staticfiles.StaticFilesPanel',
    'debug_toolbar.panels.templates.TemplatesPanel',
    # 'debug_toolbar.panels.cache.CachePanel',
    'debug_toolbar.panels.signals.SignalsPanel',
    'debug_toolbar.panels.logging.LoggingPanel',
    'debug_toolbar.panels.redirects.RedirectsPanel',
]

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'standard': {
            'format': "%(asctime)s.%(msecs).03d %(levelname)s [%(module)s:%(lineno)s] %(message)s",
            'datefmt': "%Y-%m-%d %H:%M:%S"
        },
    },
    'handlers': {
        'console': {
            'level': 'INFO',
            'class': 'logging.StreamHandler',
            'formatter': 'standard'
        },
    },
    'root': {
        'handlers': ['console', ],
        'propagate': True,
        'level': 'INFO',
    },
    'loggers': {
        'fairplay': {
            'handlers': ['console', ],
            'propagate': False,
            'level': 'INFO',
        }
    },
}

# Online Scoring
# tinyurl.com/bwi2016

ONLINE_SCORES_RATE = 30
ONLINE_SCORES_HOST = 'scores.fairlandboysgymnastics.org'
ONLINE_SCORES_PORT = 22
ONLINE_SCORES_PATH = '/srv/static/data/'
ONLINE_SCORES_USER = 'fairplay'
