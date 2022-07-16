#!/bin/bash

# This will help automate some of the deployment of severs
# Currently supports Debian and Arch Linux

#STEP: Check mount location
#NOTE: This was originally used when I would mount directory where the script lied on the server directly
#NOTE: This is being kept for preservation purposes
##export SCRIPTDIR=$(readlink -f "$0")
##export SCRIPTPATH=$(dirname "$SCRIPTDIR")
##export PWD=$(echo $SCRIPTPATH)

#STEP: Detect OS
#NOTE: Used to determine which OS is running.
#NOTE: Currently it only has Debian and Arch Linux. In the future I may add more
echo "Determining operating system"
#NOTE: This is for archiving purposes
##export OSINFO="$PWD/osinfo.sh"
export OSINFO=`curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/main/osinfo.sh | bash`
echo "installed OS running is using $OSINFO"

#STEP: Package manager
#NOTE: Determines the package manage being used based on the OS
echo "Determining package manager"
echo "Package manager is $OSINFO"
