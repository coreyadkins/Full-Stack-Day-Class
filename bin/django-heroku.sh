#!/usr/bin/bash

set -e

if (( $# < 1 ))
then
    echo "USAGE: $0 NAME"
    echo 'Sets up an existing Django project in dir NAME to use Heroku.'
    exit 1
fi

NAME="$1"

if [[ ! -d "$NAME" ]]
then
    echo "No project $NAME in CWD!"
    exit 2
fi

set -x

cd "$NAME"
. venv/bin/activate
pip install gunicorn whitenoise psycopg2 dj-database-url django-storages boto
pip freeze > requirements.txt
echo "web: gunicorn $NAME.wsgi --log-file -" > Procfile
echo 'python-3.5.1' > runtime.txt

cat <<EOF >> "$NAME/settings.py"
# Heroku production settings
# Will overwrite settings with production config vars from env variables if
# Heroku is detected.

MIDDLEWARE_CLASSES.insert(1, 'whitenoise.middleware.WhiteNoiseMiddleware')

if 'DJANGO_SECRET_KEY' in os.environ:
    SECRET_KEY = os.environ['DJANGO_SECRET_KEY']
    DEBUG = False
    ALLOWED_HOSTS = ['*']
    SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')

if 'DATABASE_URL' in os.environ:
    import dj_database_url
    DATABASES['default'] = dj_database_url.config(conn_max_age=500)

# AWS media storage
# http://django-storages.readthedocs.io/en/latest/backends/amazon-S3.html

if 'AWS_ACCESS_KEY_ID' in os.environ:
    DEFAULT_FILE_STORAGE = 'storages.backends.s3boto.S3BotoStorage'
    AWS_ACCESS_KEY_ID = os.environ['AWS_ACCESS_KEY_ID']
    AWS_SECRET_ACCESS_KEY = os.environ['AWS_SECRET_ACCESS_KEY']
    AWS_STORAGE_BUCKET_NAME = os.environ['AWS_STORAGE_BUCKET_NAME']
EOF

heroku create "$NAME"
heroku addons:create heroku-postgresql:hobby-dev
heroku config:set DJANGO_SECRET_KEY=$(python -c "import random as r; import string as s; print(''.join(r.SystemRandom().choice(list(set(s.printable) - set(s.whitespace) - {'\"', '\''})) for _ in range(50)))")
echo $'# Environment variables that cause local Heroku runs to contact production DB.' > .env
echo "DATABASE_URL=$(heroku config:get DATABASE_URL)" >> .env
echo $'\n.env' >> .gitignore
heroku local:run python manage.py migrate
heroku local:run python manage.py createsuperuser

deactivate
set +x
