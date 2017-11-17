from .base import *

DEBUG = True

INSTALLED_APPS += []

# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'ludwig',  # 'test_fairplay', or 'ludwig'
        'USER': 'fairplay',
        'PASSWORD': 'dbmaster',
        'HOST': 'localhost',
        'OPTIONS': {
        }
    }
}

STATIC_ROOT = 'local_static'

ALLOWED_HOSTS = ['*']

# Django Debug Toolbar
INTERNAL_IPS = ('127.0.0.1', 'localhost')

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