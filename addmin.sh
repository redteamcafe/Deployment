#!/bin/bash

UNAME=`whoami`
OLD_UNAME=$UNAME
echo "Changing default uname $UNAME"
read -p "Enter the desired username >> " NEW_UNAME
# Update this command ^^^^^

#NOTE: This changes the name of the default "arch" user to a desired one
echo "Changing default uname $UNAME"
sudo usermod -l $NEW_UNAME -m -d /home/$NEW_UNAME $OLD_UNAME
sudo groupmod -n $NEW_UNAME $OLD_UNAME
