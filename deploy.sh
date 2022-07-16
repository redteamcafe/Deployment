#!/bin/bash

# This will help automate some of the deployment of severs
# Currently supports Debian and Arch Linux

#STEP: Check mount location
#NOTE: This was originally used when I would mount directory where the script lied on the server directly
#NOTE: This is being kept for preservation purposes
##SCRIPTDIR=$(readlink -f "$0")
##SCRIPTPATH=$(dirname "$SCRIPTDIR")
##PWD=$(echo $SCRIPTPATH)

#STEP: Detect OS
#NOTE: Used to determine which OS is running.
#NOTE: Currently it only has Debian and Arch Linux. In the future I may add more
echo "Determining operating system"
#NOTE: This is for archiving purposes
##OSINFO="$PWD/osinfo.sh"
OSINFO=`curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/main/osinfo.sh | bash`
echo "installed OS running is using $OSINFO"

#STEP: Package manager
#NOTE: Determines the package manage being used based on the OS
echo "Determining package manager"
curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/main/osinfo.sh | bash

#STEP: Update and upgrade
curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/main/update.sh | bash

#STEP Uname and hostname change (for Arch Linux)

if
#apt-get
        [[ "$OSINFO" == "$APT" ]];
then
        curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/main/unname.sh | bash
        curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/main/hostname.sh | bash
else
        sleep 0
fi

#STEP Network Manager
#NOTE: This step sets NetworkManager daemon as the primary network manager and removes systemd-networkd if it is installed
curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/main/netman.sh | bash

#STEP Cockpit Web UI
sudo $UPDATE ; sudo $INSTALL cockpit
if
#apt-get
        [[ "$OSINFO" == "$PAC" ]];
then
        sudo systemctl enable --now cockpit.socket
fi

#STEP Install Docker and Containers
curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/main/docker%20.sh | bash




