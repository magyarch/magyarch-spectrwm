    #!/bin/sh
    hide() {
        bspc node "$sid" --flag hidden
        bspc node "$sid" --to-desktop "focused:^1";
    }

    show() {
        bspc node "$sid" --flag hidden
        bspc node "$sid" --to-desktop "focused:focused" --focus;
    }

    open=$(wmctrl -lx | grep -o dropdownterm)
    if [ -z "$open" ]
    then
        nohup st -c dropdownterm -g 212x20+1920+0 > /dev/null &
        sleep 0.1
    fi
    sid=$(wmctrl -lx | grep dropdownterm | awk '{print $1}')
    ishidden=$(bspc query -N -n .hidden)
    if [ -z "$ishidden" ]
    then
        hide
    else
        show
    fi
    exit
