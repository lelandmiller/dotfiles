#/bin/sh

export DE=generic
#xss-lock -- xscreensaver-command -lock &
compton -b --inactive-dim .1 --backend glx
xfce4-power-manager

xbindkeys

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

if [ -s ~/.Xmodmap ]; then
    xmodmap ~/.Xmodmap
fi

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.95

#eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
#export SSH_AUTH_SOCK

xscreensaver -no-splash &
nm-applet &

case "$WM" in
    xmonad)
        trayer --edge top --align right --SetDockType true --SetPartialStrut true \
         --expand true --width 10 --transparent true --tint 0x191970 --height 12 &
        xmonad
        ;;
    qtile)
        echo "Starting qtile..." >> ~/.qtile.log
        dunst &
        feh --bg-scale ~/dotfiles/config/awesome/back.jpg & 
        qtile >> ~/.qtile.log 2>> ~/.qtile.log
        ;;
    *)
        #wingo
        #i3
        awesome
        ;;
esac

#qtile

#old

#node /home/lelandmiller/dev/dwmstatus/status.js &
#cbatticon&
#feh --bg-scale ~/bg.jpg

#while true; do
    # Log stderror to a file 
    #dwm 2> ~/.dwm.log
    # No error logging
    #dwm >/dev/null 2>&1
#done