#!/bin/bash

# get the script folder
scriptFolder="$(dirname $(readlink -f $0))"

# include common functions
source "$scriptFolder/functions.sh"

# confirm removal of docker containers and images
if confirm "Do you really want to remove all docker containers and images?"
then
    # remove all docker containers
    log "INFO" "Removing all docker containers ..."
    docker rm -f $(docker ps -a -q)

    # remove all docker images
    log "INFO" "Removing all docker images ..."
    docker rmi -f $(docker images -q)
fi