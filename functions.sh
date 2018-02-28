#!/bin/bash

# --------------------------------------------------------
# Function for creating log entries on the console
# --------------------------------------------------------
# $1 - Log level
# $2 - Log text
# --------------------------------------------------------
function log() {

    # read parameters
    local level="$1"
    local text="$2"

    # create log message
    local now=$(date +"%d-%m-%Y %H:%M:%S")
    echo -e "\n$now [$level] $text\n"
}

# ---------------------------------------------------------------
# Function for confirming a message on the console
# ---------------------------------------------------------------
# $1 - Confirm message to show
# ---------------------------------------------------------------
function confirm() {

    # read parameters
    local question="$1"

    echo ""
    read -r -p "$question [Y/n] " answer
    echo ""

    case "$answer" in
        [yY][eE][sS]|[yY])
            return 0
        ;;
        *)
            return 1
        ;;
    esac
}

# --------------------------------------------------------
# Function for removing all docker containers and images
# --------------------------------------------------------
function cleanup() {

    # confirm removal of docker containers and images
    if confirm "Do you really want to remove all docker containers and images?"
    then
        # remove all docker containers
        log "INFO" "Removing all docker containers ..."
        docker rm -f $(docker ps -a -q) || true

        # remove all docker images
        log "INFO" "Removing all docker images ..."
        docker rmi -f $(docker images -q) || true
    fi

    # exit successfull
    exit -1
}

# --------------------------------------------------------
# Function for removing all containers from project list
# --------------------------------------------------------
# $1 - comma separated project list
# --------------------------------------------------------
function removeContainers() {

    # read parameters
    local projects="$1"

    # find all containers beginning with name prefix
    for containerName in $(echo $projects | tr "," "\n")
    do
        log "INFO" "Removing container with name '$containerName'"
        docker rm -f "$containerName" 2>&1 >> /dev/null || true
    done
}

# --------------------------------------------------------
# Function for getting a maven project list
# --------------------------------------------------------
# $1 - comma separated list of projects
# --------------------------------------------------------
function getMavenProjectList() {

    # read parameters
    local mavenProjects="$1"

    # get maven project list
    if [ "$mavenProjects" != "" ]
    then
        local mavenProjects=":$(echo $mavenProjects | sed s/,/,:/g)"
        local mavenProjectList="-pl $mavenProjects"
    fi

    # return maven project list
    echo "$mavenProjectList"
}

# ---------------------------------------------------------------
# Function for printing the usage of this script
# ---------------------------------------------------------------
function usage() {

    # print help text
    cat <<USAGE

Usage:
  $0 [Options] <Args>

Options:
  -h                    Print this help text
  -c                    Remove all docker containers and images
  -d                    Deploy docker images to docker registry
  -f                    Build docker images without build cache
  -p <project-list>     Build comma separated maven project list
  -s                    Create docker containers from images and start them
  -t <tag>              Build with specified image tag
  -v					Verbose logging of errors (optimise flag false)

Examples:
  $0                                     Build all docker images
  $0 -c                                  Remove all docker containers and images
  $0 -p debian,jdk                       Build only docker images for 'debian' and 'jdk'
  $0 -p debian,jdk -t master -f          -> and tag with name 'master'
  $0 -p debian,jdk -t master -f          -> and do not use docker build cache
  $0 -p debian,jdk -t master -f -s       -> and start containers
  $0 -p debian,jdk -t master -f -s -d    -> and deploy to docker registry
  $0 -p debian,jdk -t master -f -s -d -v -> and verbose logging of errors

USAGE

    # exit with error
    exit -1
}