#!/bin/bash

source vari

# This will help automate some of the deployment of severs
# Currently supports Debian and Arch Linux

#STEP: Check mount location
#NOTE: This was originally used when I would mount directory where the script lied on the server directly
#NOTE: This is being kept for preservation purposes
##export SCRIPTDIR=$(readlink -f "$0")
##export SCRIPTPATH=$(dirname "$SCRIPTDIR")
##export PWD=$(echo $SCRIPTPATH)

#STEP: System Update
echo "STEP: System Update"
#NOTE: Updates the system first
#NOTE: Currently it only has Debian and Arch Linux. In the future I may add more
echo "Update and install packages with package manager: $OSINFO"
$UPDATE
$UPGRADE

#STEP: Proxmox Steps
#NOTE: This makes some important changes to Proxmox installations
./proxmox.sh

#STEP: Rename username and change hostname (for Arch Linux)
echo "STEP: Rename username and change hostname (for Arch Linux)"
#NOTE: Since are Linux qcow comes preinstalled, a lot of changes need to be made
echo "Checking system..."
if
  [[ "$OSINFO" == "$PAC" ]];
then
  ./charch.sh
else
  sleep 0
fi

#STEP Network Manager Configuration
echo "STEP Network Manager Configuration"
#NOTE: This step sets NetworkManager daemon as the primary network manager and removes systemd-networkd if it is installed
./network.sh

#STEP: Install Cockpit Web UI
echo "STEP: Install Cockpit Web UI"
#NOTE: This step installs the Cockpit Web UI for headless and remote servers
./cockpit

#STEP: Install Docker and Containers
echo "STEP: Install Docker and Containers"
#NOTE: This sets up Docker Engine for managing and deploying containers as well as some useful containers
./docker.sh


