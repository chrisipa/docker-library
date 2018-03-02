#!/bin/bash

# include parent entrypoint script
source /debian-base.sh

# remove old pid before starting
pidFile="/var/run/apache2/apache2.pid"

if [ -f "$pidFile" ]
then
  rm -f "$pidFile"
fi

# execute command
exec "$@"