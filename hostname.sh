#!/bin/bash

echo "changing hostname"
read -p "what would you like to rename the hostname for this machine?" HOSTNAME
echo $HOSTNAME > /etc/hostname
echo "127.0.1.1 $HOSTNAME" > /etc/hosts
echo "hostname updated"

exit 0
