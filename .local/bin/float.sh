#! /bin/sh

FLOATING_DESKTOP_ID=$(bspc query -D -d '^9')
desk_id=$(bspc query -D -d "${5:-focused}")

[ "$FLOATING_DESKTOP_ID" = "$desk_id" ] && echo "state=floating"
