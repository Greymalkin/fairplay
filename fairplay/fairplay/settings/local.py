from .base import *

DEBUG = True
TEMPLATE_DEBUG = True

# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'fairplay',
        'USER': 'fairplay',
        'PASSWORD': 'dbmaster',
        'HOST': 'localhost',
        'OPTIONS': {
            'autocommit': True,
        }
    }
}

STATIC_ROOT = 'local_static'
