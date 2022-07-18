#!/bin/bash

#NOTE: Thist script allows you to automatically download, execute and remove the script locally

echo "This script requires git"
echo "If you do not have git, please download it"

#Download
git clone https://github.com/bobafett2010/Deployment.git

#Make shell scripts executable
chmod +x Deployment/*.sh

#Start deployment
./Deployment/deploy

#Cleanup
rm -r Deployment 
