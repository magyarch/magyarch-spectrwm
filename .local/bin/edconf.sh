#!/bin/bash



# Dmenu script for editing some of my more frequently edited config files.


declare options=("alias
bash
spectrwm
profile
vifm
Xresources
barconf
sxhkd
xprofile
quit")

choice=$(echo -e "${options[@]}" | dmenu -i -c -g 1 -l 10 -nb '#000000' -nf '#c3cdc8' -sb '#947cc3' -fn 'JetBrains Mono Nerd Font-12' -p 'Edit a config file: ')

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
		choice="$HOME/.config/spectrwm/spectrwm.conf"
	;;
	profile)
		choice="$HOME/.profile"
	;;
	vifm)
		choice="$HOME/.config/vifm/vifmrc"
	;;
	Xresources)
		choice="$HOME/.Xresources"
	;;
	barconf)
		choice="$HOME/.config/spectrwm/baraction.sh"
	;;
	sxhkd)
		choice="$HOME/.config/sxhkd/sxhkdrc"
	;;
	xprofile)
		choice="$HOME/.xprofile"
	;;
	*)
		exit 1
	;;
esac
subl -c "$choice"
