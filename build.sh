#!/bin/bash

# exit on any error
set -e

# get the script folder
scriptFolder="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# include common functions
source "$scriptFolder/functions.sh"

# initialize parameter variables
mavenPomFile="$scriptFolder/pom.xml"
mavenBuildGoals="clean package docker:build"
mavenParameter=""
mavenProjects=""

# get command line args
while getopts cdfhp:st:v opt
do
    case $opt in
        c)
            cleanup
        ;;
        d)
            mavenBuildGoals="$mavenBuildGoals docker:push"
        ;;
        f)
            mavenParameter="$mavenParameter -D docker.nocache"
        ;;
        h)
            usage
        ;;
        p)
            mavenProjects="$OPTARG"
        ;;
        s)
            startContainers="true"
        ;;
        t)
            mavenParameter="$mavenParameter -D image.tag=$OPTARG"
        ;;
        v)
        	mavenParameter="$mavenParameter -D optimise=false"
       	;;
        \?)
            log "ERROR" "Invalid option: -$OPTARG"
            exit -1
        ;;
    esac
done

# remove existing containers
removeContainers "$mavenProjects"

# get maven project list
mavenProjectList="$(getMavenProjectList $mavenProjects)"

# build container images
mvn -f $mavenPomFile $mavenBuildGoals $mavenProjectList $mavenParameter

# start containers if necessary
if [ "$startContainers" == "true" ]
then
    mvn -f $mavenPomFile docker:start $mavenProjectList
fi