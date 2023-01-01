#!/bin/sh

cat <<EOF | xmenu -p 10x20:cursor | sh &
 Applications
	 Brave		brave
	 Terminal	alacritty
	 Files		pcmanfm
	 Sublime Text	subl3		
	 Steam		steam
	 Video		mpv
	 Music		urxvt -e ncmpcpp
	 Discord	discord
	 Network	urxvt -e nmtui

 Screenshot
	 Full		maim ~/Képek/Képernyőképek/`date +%Y-%m-%d_%H:%M:%S`.png 
	 Pick		maim -s ~/Képek/Képernyőképek/`date +%y%m%d-%H%M-%S`.png

 System
	 Pavucontrol	pavucontrol
	 Help	zathura ~/.local/share/Magyarch-spectrwm.pdf
	 Shutdown	poweroff
	 Reboot	reboot
EOF



