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