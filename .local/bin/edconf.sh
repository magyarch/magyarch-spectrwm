#!/bin/bash



# Dmenu script for editing some of my more frequently edited config files.


declare options=("alias
bash
bspwm
profile
vifm
xinitrc
polybar
st
sxhkd
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
	bspwm)
		choice="$HOME/.config/bspwm/bspwmrc"
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
	polybar)
		choice="$HOME/.config/polybar/config"
	;;
	st)
		choice="$HOME/st/config.h"
	;;
	sxhkd)
		choice="$HOME/.config/sxhkd/sxhkdrc"
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
