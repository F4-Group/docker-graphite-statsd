#!/bin/bash -e

if [ ! -f /opt/graphite/storage/graphite_db_migrated_to_1.4 ]; then
    cp /opt/graphite/storage/graphite.db /opt/graphite/storage/graphite.db.backup-`date +%Y%m%d_%H%M%S`
    PYTHONPATH=/opt/graphite/webapp django-admin.py syncdb --noinput --no-initial-data --settings=graphite.settings
    touch /opt/graphite/storage/graphite_db_migrated_to_1.4
fi
