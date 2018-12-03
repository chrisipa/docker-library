#!/bin/bash

# include parent entrypoint script
source /jenkins-base.sh

# execute command
exec java "${java_opts_array[@]}" -jar $JENKINS_DIST_FOLDER/jenkins.war "${jenkins_opts_array[@]}"