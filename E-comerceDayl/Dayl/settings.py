"""
Django settings for Dayl project.

Generated by 'django-admin startproject' using Django 4.2.4.

For more information on this file, see
https://docs.djangoproject.com/en/4.2/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/4.2/ref/settings/
"""

from pathlib import Path
import os
from dotenv import load_dotenv

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent

#Config ENV variables#
dotenv_path = BASE_DIR / 'Dayl' / 'config' / '.env'
load_dotenv(dotenv_path)
ENV = os.getenv

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.2/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-oh9^r^h2phvgydssr_%aq8+ba*zan)d*t7j$vz7#en%865swx+'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = [
    '*',
    "https://2f4e-181-51-32-18.ngrok-free.app",
    ]


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'producto.apps.ProductoConfig',
    'cliente.apps.ClienteConfig',
    'factura.apps.FacturaConfig',
    'paypal.standard.ipn',
    'corsheaders',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'Dayl.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            os.path.join(BASE_DIR,'Dayl','templates'),
            os.path.join(BASE_DIR,'admin','templates'),
            os.path.join(BASE_DIR, 'cliente','templates')
            ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
                'buycar.context_processor.total_carrito',
            ],
            'libraries': {
                'custom_filters': 'producto.templatetags.custom_filters',
            },
        },
    },
]

WSGI_APPLICATION = 'Dayl.wsgi.application'


# Database
# https://docs.djangoproject.com/en/4.2/ref/settings/#databases

DATABASES = {
    "default": {
        "ENGINE": ENV('ENGINE'),
        "NAME": ENV('NAME'),
        "USER": ENV('USER'),
        "PASSWORD": ENV('PASSWORD'),
        "HOST": ENV('HOST'),
        "PORT": ENV('PORT'),
        'OPTIONS': {
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
            'charset': 'utf8',
        },
    }
}


# Password validation
# https://docs.djangoproject.com/en/4.2/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/4.2/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'America/Bogota'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.2/howto/static-files/

STATIC_URL = '/static/'
STATICFILES_DIRS = [
    os.path.join(BASE_DIR,'Dayl','static'),
    os.path.join(BASE_DIR,'admin','static'),
]

JSON_ROOT = os.path.join(BASE_DIR, 'json_files')
JSON_URL = '/json/'

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')
MEDIA_URL = '/media/'

# Default primary key field type
# https://docs.djangoproject.com/en/4.2/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

#para enviar el mesaje de confirmacion

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'dayl.medellin.antioquia@gmail.com'
EMAIL_HOST_PASSWORD = 'ztmfcetxfhqlvwka'
EMAIL_USE_TLS = True

#-#--Paypal settings--#-#
PAYPAL_TEST = True
PAYPAL_RECEIVER_EMAIL = ENV('PAYPAL_RECEIVER_EMAIL')

#-#--Cors settings--#-#

CSRF_TRUSTED_ORIGINS = [
     "https://2f4e-181-51-32-18.ngrok-free.app",
]
CORS_ALLOWED_ORIGINS = [
    "https://2f4e-181-51-32-18.ngrok-free.app",
    "http://localhost:3000",  # O la URL de tu frontend en desarrollo
    "http://localhost:8000",  # O la URL de tu backend en desarrollo
    "http://127.0.0.1:8000",
]
CORS_ALLOW_HEADERS = [
    'accept',
    'accept-encoding',
    'authorization',
    'content-type',
    'dnt',
    'origin',
    'user-agent',
    'x-csrftoken',
    'x-requested-with',
]


 