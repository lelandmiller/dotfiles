#!/bin/sh

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi


[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
export DE=generic
#node /home/lelandmiller/dev/dwmstatus/status.js &
xfce4-power-manager
cbatticon&
compton -b --inactive-dim .1 --backend glx
#feh --bg-scale ~/bg.jpg

exec awesome
#while true; do
    # Log stderror to a file 
    #dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
#done
