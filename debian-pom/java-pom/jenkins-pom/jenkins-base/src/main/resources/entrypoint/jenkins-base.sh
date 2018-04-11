#!/bin/bash

# include parent entrypoint script
source /jdk-base.sh

# copy reference files
initDoneFile="$JENKINS_HOME/init.done" 
if [ ! -f "$initDoneFile" ]
then
	log "INFO" "Copying reference files to jenkins home folder"
	cp -r $JENKINS_DIST_FOLDER/ref/* $JENKINS_HOME 
	touch "$initDoneFile"
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