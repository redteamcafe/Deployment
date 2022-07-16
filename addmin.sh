#!/bin/bash

# This script changes the current unaem of the user to the desired one
# This is useful for Arch Linux since the preinstalled qcow file has the default user 'arch'
echo "1"
UNAME=`whoami`
echo "2"
OLD_UNAME=$UNAME
echo "3"
read -p "Enter the desired username >> " NEW_UNAME
echo "4"
echo "Changing default uname $UNAME"
echo "5"
sudo usermod -l $NEW_UNAME -m -d /home/$NEW_UNAME $OLD_UNAME
echo "6"
sudo groupmod -n $NEW_UNAME $OLD_UNAME
