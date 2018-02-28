#!/bin/bash

# include parent entrypoint script
source /jmeter-base.sh

# execute command
exec jmeter.sh "$@"