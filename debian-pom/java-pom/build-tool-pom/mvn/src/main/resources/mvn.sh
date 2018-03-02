#!/bin/bash

# include parent entrypoint script
source /build-tool-base.sh

# execute command
exec mvn "$@"