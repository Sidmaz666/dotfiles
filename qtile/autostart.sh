#!/bin/sh
lxsession -e qtile -s qtile  &
#pulseaudio --start || pulseaudio --k && pulseaudio --start &
volumeicon &
flameshot &
copyq &
picom &
$HOME/Documents/scripts/battery-notifications/batterynotif.sh &
xidlehook --not-when-audio --not-when-fullscreen --timer 120 'betterlockscreen -l dimblur 1' '' --timer 300 'systemctl suspend' '' &
notify-send 'Status' "Logged-In" --icon=/home/kurama/Documents/Stickers/Sanji.jpeg -t 5000 &
