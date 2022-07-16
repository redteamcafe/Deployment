#!/bin/bash

# This will help automate some of the deployment of severs
# Currently supports Debian and Arch Linux

#STEP: Check mount location
#NOTE: This was originally used when I would mount directory where the script lied on the server directly
#NOTE: This is being kept for preservation purposes
##SCRIPTDIR=$(readlink -f "$0")
##SCRIPTPATH=$(dirname "$SCRIPTDIR")
##PWD=$(echo $SCRIPTPATH)
