#!/bin/bash

# This is my custom bashrc file that I use on all of my Linux server deployments
# It is tailered and suited for my needs and can be tweaked as needed as you like
# I try to put as many good notes as possible but there are some parts where basic Linux knowledge is going to be implied


########## Source ##########



brc='vim ~/.bashrc'

########### EXPORTS ##########


# No duplicate lines or lines starting with space in history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# Append history file, don't overwrite
shopt -s histappend

# For setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTFILESIZE=10000
export HISTSIZE=500

#Disable bell
if [[ $iatest > 0 ]]; then bind "set bell-style visible"; fi

# Check the window size after each command and, if necessary,
# Update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Set the default editor
export EDITOR='vim'
export VISUAL='vim'
alias svim='sudo vim'

# Show auto-completion list automatically (without hiutting tab twice)
if [[ $iatest > 0 ]]; then bind "set show-all-if-ambiguous On"; fi

# Give list and grep commands color output automatically
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'
alias ip='ip --color=auto'

# Color output for manpages automatically
export LESS_TERMCAP_mb=$'\E[01;31m'    #begin blink
export LESS_TERMCAP_md=$'\E[01;31m'    #begin bold
export LESS_TERMCAP_me=$'\E[0m'        #reset bold/blink
export LESS_TERMCAP_se=$'\E[0m'        #begin reverse video
export LESS_TERMCAP_so=$'\E[01;44;33m' #reset reverse video
export LESS_TERMCAP_ue=$'\E[0m'        #begin underline
export LESS_TERMCAP_us=$'\E[01;32m'    #reset underline







