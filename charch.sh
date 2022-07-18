#!/bin/bash

source vari

echo "Making changes to Arch Linux server"
while true; do
        read -p "Would you like to change the hostname for this server? y/n >> " YN
        case ${YN:0:1} in
                [Yy]* )
                        read -p "What would you like to rename the host to? >> " HOST;
                        while true; do
                                read -p "Confirm hostname change $HOST. (y=yes n=no x=exit) >> " YN
                                case ${YN:0:1} in
                                        [Yy]* )
                                                echo "Changing hostname!";
                                                echo "Adding $HOST to /etc/hostname"
                                                sudo echo $HOST > /etc/hostname;
                                                STR=`grep '127.0.1.1' /etc/hosts | awk -F' ' '{print $2}'`;
                                                echo "Changing $STR to $HOST in /etc/hosts"
                                                sudo sed -i "s|$STR|$HOST|g" /etc/hosts;
                                                break;;
                                        [Nn]* )
                                                read -p "What would you like to rename the host to? >> " HOST;;
                                        [Xx]* )
                                                echo "exiting";
                                                break;;
                                esac
                        done
                        break;;
                [Nn]* ) 
                        echo "moving on";
                        break;;
                * ) echo "Please answer either y or n";;
        esac
done

#echo $HOSTNAME > /etc/hostname
#echo "127.0.1.1 $HOSTNAME" > /etc/hosts
#echo "hostname updated"
