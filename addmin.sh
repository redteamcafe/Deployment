#!/bin/bash

# This script changes the current unaem of the user to the desired one
# This is useful for Arch Linux since the preinstalled qcow file has the default user 'arch'

UNAME=`whoami`
OLD_UNAME=$UNAME
read -p "Enter the desired username >> " NEW_UNAME
echo "Changing default uname $UNAME"
sudo usermod -l $NEW_UNAME -m -d /home/$NEW_UNAME $OLD_UNAME
sudo groupmod -n $NEW_UNAME $OLD_UNAME
