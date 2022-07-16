#!/bin/bash

OSINFO=`curl -fsSL raw.githubusercontent.com/bobafett2010/Deployment/edit/main/osinfo.sh | bash`
APT=apt-get
PAC=pacman

if
#apt-get
        [[ "$OSINFO" == "$APT" ]];
then
        FILE=/usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf
        if test -f "$FILE";
        then
            sudo mv /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf  /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf_orig
        else
            echo "$FILE does not exist"
        fi
        sudo touch /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf
        FILE=/etc/NetworkManager/NetworkManager.conf
        if test -f "$FILE";
        then
            sudo sed -i 's/managed\=false/managed\=true/g' /etc/NetworkManager/NetworkManager.conf
        else
            echo "$FILE does not exist"
        fi
        sudo systemctl restart NetworkManager
        sudo apt update && sudo apt install ifupdown
        sudo apt --purge remove nplan netplan.io -y
        sudo systemctl stop systemd-networkd
        sudo systemctl stop systemd-networkd.socket
        sudo systemctl disable systemd-networkd
        sudo systemctl disable systemd-networkd.socket
        sudo systemctl mask systemd-networkd
        sudo systemctl mask systemd-networkd.socket
elif
#pacman
        [[ "$OSINFO" == "$PAC" ]];
then
        echo "Installing NetworkManager"
        sudo $INSTALL NetworkManager
        echo "Enabling NetworkManager"
        sudo systemctl enable NetworkManager
        echo "NetworkManager enabled"
        echo "Starting NetworkManager"
        sudo systemctl start NetworkManager
        echo "NetworkManager started"
else
        sleep 0
fi
