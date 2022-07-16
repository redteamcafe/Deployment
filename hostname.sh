#!/bin/bash

echo "changing hostname"
read -p "what would you like to rename the hostname for this machine?" HOSTNAME
echo $HOSTNAME > /etc/hostname
echo "hostname updated"
