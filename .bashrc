#!/bin/bash

# Disable ctrl-s and ctrl-q
stty -ixon

#Allows you to cd into directory merely by typing the directory name.
shopt -s autocd 

# Infinite history.
HISTSIZE= HISTFILESIZE=


# prompt customization
export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 1)\]\u\[$(tput setaf 7)\]@\[$(tput setaf 7)\]\h \[$(tput setaf 2)\]\t\W\[$(tput setaf 2)\]]\[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"
#export PS1="\u@\h [\$(date +%H:%M:%S)] ~ "


# Load shortcut aliases
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc" 

# Load aliases
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
