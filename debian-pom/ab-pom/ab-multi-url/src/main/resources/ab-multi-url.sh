#!/bin/bash

# include parent entrypoint script
source /ab-base.sh

# execute command
exec ab "$@"