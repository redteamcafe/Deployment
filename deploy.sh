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
bash -c "$(curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/main/osinfo.sh)"

#STEP: Update and upgrade
bash -c "$(curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/main/update.sh)"

#STEP Uname and hostname change (for Arch Linux)

if
#apt-get
        [[ "$OSINFO" == "$APT" ]];
then
        bash -c "$(curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/main/hostname.sh)"
else
        sleep 0
fi

#STEP Network Manager
#NOTE: This step sets NetworkManager daemon as the primary network manager and removes systemd-networkd if it is installed
bash -c "$(curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/main/network.sh)"

#STEP Cockpit Web UI
sudo $UPDATE ; sudo $INSTALL cockpit
if
#apt-get
        [[ "$OSINFO" == "$PAC" ]];
then
        sudo systemctl enable --now cockpit.socket
fi

#STEP Install Docker and Containers
bash -c "$(curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/main/deploy.sh)"




