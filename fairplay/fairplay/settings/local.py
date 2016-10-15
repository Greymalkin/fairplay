from .base import *

DEBUG = True

INSTALLED_APPS += (
    'django_extensions',
)

# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'ludwig',
        'USER': 'fairplay',
        'PASSWORD': 'dbmaster',
        'HOST': 'localhost',
        'OPTIONS': {
        }
    }
}

STATIC_ROOT = 'local_static'

# Django Debug Toolbar
INTERNAL_IPS = ('127.0.0.1', 'localhost')