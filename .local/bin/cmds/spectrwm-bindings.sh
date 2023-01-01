#!/bin/bash
[ -e "$HOME/.spectrwm.conf" ] && config="$HOME/.spectrwm.conf"
[ -e "$HOME/.config/spectrwm/spectrwm.conf" ] && config="$HOME/.config/spectrwm/spectrwm.conf"
bold=$(tput bold)
normal=$(tput sgr0)

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'
NC='\033[0m'

printf ${RED}${bold}" ALT KEY BINDINGS\n"${NC}${normal} > ~/.config/bindings.txt
grep MOD1 $config | awk {'print $3 " --- " $1'} | sed 's/bind//g' | sed 's/[][]//g' >> ~/.config/bindings.txt
printf ${RED}${bold}" SUPER KEY BINDINGS\n"${NC}${normal} >> ~/.config/bindings.txt
grep MOD+ $config | awk {'print $3 " --- " $1'} | sed 's/bind//g' | sed 's/[][]//g' | column >> ~/.config/bindings.txt

cat ~/.config/bindings.txt

read
