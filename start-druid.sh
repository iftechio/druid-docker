#!/bin/bash
set -e

# Abort if no server type is given
if [ "${1:0:1}" = '-' ]; then
    echo "Aborting: No druid server type set!"
    exit 1
fi

/opt/druid/bin/$1.sh start
/opt/druid/bin/$1.sh status
