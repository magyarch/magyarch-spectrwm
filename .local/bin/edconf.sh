#!/bin/bash



# Dmenu script for editing some of my more frequently edited config files.


declare options=("alias
bash
spectrwm
profile
vifm
xinitrc
barconf
vim
xprofile
quit")

choice=$(echo -e "${options[@]}" | rofi -dmenu -i -no-custom -p 'Edit a config file: ')

case "$choice" in
	quit)
		echo "Program terminated." && exit 1
	;;
	alias)
		choice="$HOME/.config/aliasrc"
	;;
	bash)
		choice="$HOME/.bashrc"
	;;
	spectrwm)
		choice="$HOME/.spectrwm.conf"
	;;
	profile)
		choice="$HOME/.profile"
	;;
	vifm)
		choice="$HOME/.config/vifm/vifmrc"
	;;
	xinitrc)
		choice="$HOME/.xinitrc"
	;;
	barconf)
		choice="$HOME/.config/spectrwm/baraction.sh"
	;;
	vim)
		choice="$HOME/.vimrc"
	;;
	xprofile)
		choice="$HOME/.xprofile"
	;;
	*)
		exit 1
	;;
esac
subl3 -c "$choice"
