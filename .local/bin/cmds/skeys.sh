#!/bin/sh

grep bind ~/.config/spectrwm/spectrwm.conf | tail -n +3 | head -n -1 | sed 's/.....//;s/\]//' | column -t | dmenu -i -c -g 2 -l 36 -nb '#000000' -sb '#947cc3' -fn 'JetBrains Mono Medium Nerd-11'
