#!/bin/sh
#/home/$USER/.config/qtile/scripts/feh-rnd-wall.sh &
notify-send 'Status' "Logged-In" --icon=/home/kurama/.config/qtile/icons/menu.png -t 3000 &
lxsession -e qtile -s qtile  &
#pulseaudio --start || pulseaudio --k && pulseaudio --start &
volumeicon &
flameshot &
copyq &
xidlehook --not-when-audio --not-when-fullscreen --timer 120 'betterlockscreen -l dimblur 1' '' --timer 300 'systemctl suspend' '' &
picom &
