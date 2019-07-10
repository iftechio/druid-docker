#!/bin/bash
set -e

# Abort if no server type is given
if [ "${1:0:1}" = '-' ]; then
    echo "Aborting: No druid server type set!"
    exit 1
fi

java ${JAVA_OPTS} -cp /opt/druid/conf/druid/_common:/opt/druid/conf/druid/$1:/opt/druid/lib/* org.apache.druid.cli.Main server $@