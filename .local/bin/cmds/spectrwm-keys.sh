#!/bin/bash
[ -e "$HOME/.spectrwm.conf" ] && config="$HOME/.spectrwm.conf"
[ -e "$HOME/.config/spectrwm/spectrwm.conf" ] && config="$HOME/.config/spectrwm/spectrwm.conf"

grep 'MOD+\|MOD1' $config |\
    awk {'print $3 " --- " $1'} |\
    sed -e 's/bind//g'\
    -e 's/[][]//g' |\
    sort |\
    column -t |\
    yad --text-info --back=#1d1f21 --fore=#c5c8c6 --geometry=550x720 --center


