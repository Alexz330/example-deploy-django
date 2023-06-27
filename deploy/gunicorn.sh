#!bin/bash

NAME="test"
DJGANGODIR=$(dirname $(cd `dirname $0` && pwd))
SOCKFILE=/tmp/gunicorn-test.sock
LOGDIR=${DJGANGODIR}/logs/gunicorn.log
USER=alexis
GROUP=alexis
NUM_WORKER=5
DJANGO_WSGI_MODULE=config.wsgi

rm -frv $SOCKFILE

echo $DJGANGODIR
cd $DJGANGODIR

exec ${DJGANGODIR}/env/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
    --name $NAME \
    --workers $NUM_WORKER \
    --user=$USER --group=$GROUP \
    --bind=unix:$SOCKFILE \
    --log-level=debug \
    --log-file=$LOGDIR