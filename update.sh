#!/bin/bash

echo "Preparing upgrade"
export APT=apt-get
export PAC=pacman

if
#apt-get
        [[ "$OSINFO" == "$APT" ]];
then
        echo "Upgrading using $OSINFO";
        export UPDATE="apt update";
        export UPGRADE="apt upgrade -y";
        export INSTALL="apt install -y"
elif
#pacman
        [[ "$OSINFO" == "$PAC" ]];
then
        echo "Upgrading using $OSINFO"
        export UPDATE="sleep 0";
        export UPGRADE="pacman -Syu --noconfirm";
        export INSTALL="pacman -S --noconfirm";
else
        echo "No Success"
fi

echo "Finishing upgrade"
