#!/bin/bash

source vari

if
        [[ "$OSINFO" == "$APT" ]];
then
        sudo mv /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf_orig
        sudo touch /usr/lib/NetworkManager/conf.d/10-globally-managed-devices.conf
        sudo sed -i 's/managed\=false/managed\=true/g' /etc/NetworkManager/NetworkManager.conf
        sudo rm -r /etc/netplan/*
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
