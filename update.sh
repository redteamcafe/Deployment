#!/bin/bash

echo "Preparing upgrade"
export APT=apt-get
export PAC=pacman

if
#apt-get
        [[ "$OSINFO" == "$APT" ]];
then
        echo "Upgrading using $OSINFO";
        export UPDATE="sudo apt update";
        export UPGRADE="sudo apt upgrade -y";
        export INSTALL="sudo apt install -y"
elif
#pacman
        [[ "$OSINFO" == "$PAC" ]];
then
        echo "Upgrading using $OSINFO"
        export UPDATE="sleep 0";
        export UPGRADE="sudo pacman -Syu --noconfirm";
        export INSTALL="sudo pacman -S --noconfirm";
else
        echo "No Success"
fi

$UPDATE
$UPGRADE

echo "Finishing upgrade"

exit 0
