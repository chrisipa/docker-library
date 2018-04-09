#!/bin/bash

# include parent entrypoint script
source /jdk-base.sh

# copy reference files
configFile="$JENKINS_HOME/config.xml" 
if [ ! -f "$configFile" ]
then
	log "INFO" "Copying reference files to jenkins home folder"
	cp -r $JENKINS_DIST_FOLDER/ref/* $JENKINS_HOME 
fi	

# read JAVA_OPTS into arrays to avoid need for eval (and associated vulnerabilities)
java_opts_array=()
while IFS= read -r -d '' item; do
	java_opts_array+=( "$item" )
done < <([[ $JAVA_OPTS ]] && xargs printf '%s\0' <<<"$JAVA_OPTS")

# read JENKINS_OPTS into arrays to avoid need for eval (and associated vulnerabilities)
jenkins_opts_array=( )
while IFS= read -r -d '' item; do
	jenkins_opts_array+=( "$item" )
done < <([[ $JENKINS_OPTS ]] && xargs printf '%s\0' <<<"$JENKINS_OPTS")