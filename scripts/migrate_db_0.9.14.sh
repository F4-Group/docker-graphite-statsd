#!/bin/bash -e

stampfile=/opt/graphite/storage/graphite_db_migrated_to_0.9.14

if [ ! -f $stampfile ]; then
    if [ -f /opt/graphite/storage/graphite.db ]; then
        cp /opt/graphite/storage/graphite.db /opt/graphite/storage/graphite.db.backup-`date +%Y%m%d_%H%M%S`
        PYTHONPATH=/opt/graphite/webapp django-admin.py syncdb --noinput --no-initial-data --settings=graphite.settings
    fi
    touch $stampfile
fi
