#!/bin/bash

source vari

#This installs the Cockpit Web UI

$INSTALL cockpit
while true; do
  read -p "Do you want to install the Cockpit Web UI? >> " YN
  case ${YN:0:1} in
    [Yy]* )
        $UPDATE;
        $INSTALL cockpit;
        echo "Cockpit installation complete";
      break;;
    [Nn]* )
      break;;
    * ) echo "Please answer either Y/y or N/n";;
  esac
done

if
#apt-get
  [[ "$OSINFO" == "$PAC" ]];
then
  sudo systemctl enable --now cockpit.socket
else
  sleep 0
fi

echo "Finishing..."
