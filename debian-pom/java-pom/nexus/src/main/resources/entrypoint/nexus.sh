#!/bin/bash

# include parent entrypoint script
source /jdk-base.sh

# set nexus context path
if [ -n $NEXUS_CONTEXT_PATH ]
then
    sed -i 's|'nexus-context-path=.*'|'nexus-context-path=$NEXUS_CONTEXT_PATH'|' $NEXUS_HOME/etc/nexus-default.properties
fi

# set nexus session timeout
if [ -n $NEXUS_SESSION_TIMEOUT ]
then
    sed -i 's|'shiro.globalSessionTimeout=.*'|'shiro.globalSessionTimeout=$NEXUS_SESSION_TIMEOUT'|' $NEXUS_HOME/etc/nexus-default.properties
fi

# execute command
exec "$@"