#!/bin/bash

-----------------------------
########## ALIASES ##########
-----------------------------
# To bypass any alias and execute the command like normal, put '\' before the command
#EXAMPLE: if you want to execute the grep command, it would be '\grep'

# ALIAS FILE COMMANDS
alias ali='vim ~/.bash_aliases && source ~/.bash_aliases'
alias alicat='cat ~/.bash_aliases'
alias alis='source ~/.bash_aliases'

# LIST COMMANDS
alias la='ls -ahl #lists all in human readable format 
alias lr='ls -lRh' #lists recursive
alias lss='ls -ahlS' #lists all from filesize largest to smalled (invert with -r flag)
alias lsa='ls -chlr' #lists by last time accessed
alias lsu='ls -lhru' #lists by last time updated
alias lsd='ls -hlrt' #lists by date

# CHANGE DIRECTORY
alias home='cd ~/' #chanegs directory to home
alias root='cd /' #changes directory to root
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'

# ALIASES COMMANDS
alias cp='cp -ipv' #copy files/directories
alias mv='mv -iv' #move files/direcotries
alias rm='rm -iv' #remove files/directories
alias x='clear' #clear terminal
alias psa='ps aux | grep ' #search for a running process
alias mkdir='mkdir -p' #make directory
alias touch='touch -p' # generates a blank file

# UPDATE && UPGRADE
# I plan on changing these in the future to be more interactive based on the OS
# For now, this will only work with 'apt'
alias upd='sudo apt update'
alias upg='sudo apt upgrade'
alias ins='sudo apt install'

# MOTD
alias homie='sudo vim /etc/motd'
alias homerun='cd ~/ && cat /etc/motd'

# SCREEN
alias scrn='screen -d -R $USER -c ~/screen'




