#!/bin/bash

#NOTE: This checks to see if bashrc exists
#NOTE: If the bashrc file does exist, it then does a check to compare if the files are the same
#NOTE: If the bashrc file doesn't exist or they are not the same, then it replaces the bashrc file
#NOTE: This also add the bnash_aliases file as well with the custom aliases 

USER=`whoami`

FILE=/home/$USER/.bashrc
echo "now checking for bashrc"
#NOTE: checks for the existence of the .bashrc file
if [ -f "$FILE" ];
then
  echo "bashrc exists already";
  FILE2=bashrc
  #File comparision
  if cmp -s "$FILE" "$FILE2";
  then
    echo "bashrc files are the same";
  else
    echo "copying files now"
    cp bashrc > /home/$USER/.bashrc;
  fi
else
  echo "bashrc does not exist";
  echo "moving bashrc now";
  cp bashrc > /home/$USER/.bashrc;
fi

FILE=/home/$USER/.bash_aliases
echo "now checking for bash_aliases"
#NOTE: checks for the existence of the .bash_aliases file
if [ -f "$FILE" ];
then
  echo "bash_aliases exists already";
  FILE2=bash_aliases
  if cmp -s "$FILE1" "$FILE2";
  then
    echo "bash_aliases files are the same";
  else
    echo "copying files now"
    cp bash_aliases > /home/$USER/.bash_aliases;
  fi
else
  echo "bash_aliases does not exist";
  echo "moving bash_aliases now";
  cp bash_aliases > /home/$USER/.bash_aliases;
fi

##check to see if .profile exists
FILE=/home/ctos/.profile
echo "now checking for profile"
##checks for the existence of the FILE variable
if [ -f "$FILE" ];
then
  echo "profile already exists";
else
  echo "creating profile";
  cp profile > /home/$USER/.profile
  touch /home/$USER/.profile;
  echo "done";
fi




