#!/bin/bash

# include parent entrypoint script
source /java.sh

# execute command
exec jmeter.sh "$@"