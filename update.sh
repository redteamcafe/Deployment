#!/bin/bash

if
#apt-get
        [[ "$OSINFO" == "$APT" ]];
then
        UPDATE="apt update";
        UPGRADE="apt upgrade -y";
        INSTALL="apt install -y"
elif
#pacman
        [[ "$OSINFO" == "$PAC" ]];
then
        UPDATE="sleep 0";
        UPGRADE="pacman -Syu --noconfirm";
        INSTALL="pacman -S --noconfirm";
else
        echo "No Success"
fi
