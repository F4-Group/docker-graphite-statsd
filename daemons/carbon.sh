#!/bin/bash

rm -f /opt/graphite/storage/carbon-cache-a.pid
python /opt/graphite/bin/carbon-cache.py start --debug 2>&1 >> /var/log/carbon.log
