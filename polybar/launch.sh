#!/usr/bin/env sh

## Add this to your wm startup file.

####### Ensure Polybar script folder in PATH
# if [`echo $PATH | grep "polybar/scripts"`]; then
#     echo "Polybar scripts in PATH."
# else
#     echo "Polybar's not in the path. Adding it."
#     export PATH="$HOME/.config/polybar/scripts:$PATH"
# fi
####### Moved into .zprofile

###### Terminate already running bar instances
killall -q polybar
killall -q picom

###### Wait until the processes have been shut down
if [ `pgrep -x polybar` ]; then
    while pgrep -u $UID -x polybar >/dev/null
        do sleep 1
    done
fi

if [ `pgrep -x picom` ]; then
    while pgrep -u $UID -x picom >/dev/null
        do sleep 1
    done
fi

###### Launch the polybar theme
#polybar -q -c ~/.config/polybar/config.ini main &
polybar -q -c ~/.config/polybar/mrb-rounded.ini rk1 &
. ~/dotfiles/polybar/picom.sh
. ~/.fehbg
