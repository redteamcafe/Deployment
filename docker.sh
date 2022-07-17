#!/bin/bash

echo "Docker is installing"

if
#apt-get
        [[ "$OSINFO" == "$APT" ]];
then
        sudo apt update ;
        sudo apt install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release &&
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
        echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
        sudo apt-get update -y && \
        sudo apt-get install -y docker-ce docker-ce-cli containerd.io
elif
#pacman
# I will add this later since I do not run production containers on Arch Linux machines
        [[ "$OSINFO" == "$PAC" ]];
then
        sleep 0
fi
