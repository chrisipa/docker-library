#!/bin/bash

# include parent entrypoint script
source /jenkins-base.sh

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

# execute command
exec java "${java_opts_array[@]}" -jar $JENKINS_DIST_FOLDER/jenkins.war "${jenkins_opts_array[@]}"