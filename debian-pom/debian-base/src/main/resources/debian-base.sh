#!/bin/bash

set -e

# source bashrc file
source $HOME/.bashrc

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

# ------------------------------------------------------------------------
# # function for getting the value of a database environment variable
# ------------------------------------------------------------------------
# $1 - Pattern to search for
# ------------------------------------------------------------------------
function getDbEnvVar() {
    local pattern="$1"
    echo "$(env | grep $pattern | head -n 1 | awk -F= '{print $2}')"
}