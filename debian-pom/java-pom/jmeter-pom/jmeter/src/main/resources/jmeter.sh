#!/bin/bash

# include parent entrypoint script
source /jdk.sh

# execute command
exec jmeter.sh "$@"