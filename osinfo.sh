#!/bin/bash

APT=apt-get
PAC=pacman

declare -A osInfo;
osInfo[/etc/redhat-release]=yum
osInfo[/etc/arch-release]=pacman
osInfo[/etc/gentoo-release]=emerge
osInfo[/etc/SuSE-release]=zypp
osInfo[/etc/debian_version]=apt-get

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        echo ${osInfo[$f]}
    fi
done

if
#apt-get
        [[ "$OSINFO" == "$APT" ]]; then
        UPDATE="apt update";
        UPGRADE="apt upgrade -y";
        INSTALL="apt install -y"
        sudo $UPDATE ; sudo $UPGRADE
elif
#pacman
        [[ "$OSINFO" == "$PAC" ]]; then
        UPDATE="sleep 0";
        UPGRADE="pacman -Syu --noconfirm";
        INSTALL="pacman -S --noconfirm";
else
        sleep 0
fi


