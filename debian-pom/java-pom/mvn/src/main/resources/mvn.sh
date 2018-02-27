#!/bin/bash

# include parent entrypoint script
source /jdk-base.sh

# execute command
exec mvn "$@"