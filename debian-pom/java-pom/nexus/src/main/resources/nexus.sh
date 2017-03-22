#!/bin/bash

# include parent entrypoint script
source /jdk.sh

# start nexus application
exec java \
     -cp "./conf/:./lib/*" \
     -Dnexus-work=$SONATYPE_WORK \
     -Dnexus-webapp-context-path=$NEXUS_CONTEXT_PATH \
     $NEXUS_JAVA_OPTS \
     org.sonatype.nexus.bootstrap.Launcher "./conf/jetty.xml" "./conf/jetty-requestlog.xml"