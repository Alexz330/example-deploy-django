#!/binbash
DJGANGODIR=$(dirname $(cd `dirname $0` && pwd))
DJGANGO_SETTINGS_MODULE=config.DJGANGO_SETTINGS_MODULE
cd $DJGANGODIR
source env/bin/activate
export DJGANGO_SETTINGS_MODULE=$DJGANGO_SETTINGS_MODULE
exec python manage.py runserver 0:8000