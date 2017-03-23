#!/bin/bash

# include parent entrypoint script
source /jdk-base.sh

# set tomcat session timeout
if [ -n $TOMCAT_SESSION_TIMEOUT ]
then
    sed -i 's|'@SESSION_TIMEOUT@'|'$TOMCAT_SESSION_TIMEOUT'|' $CATALINA_HOME/conf/web.xml
fi