#!/bin/sh


export QT_QPA_PLATFORMTHEME=gtk2
export DESKTOP_SESSION=qtile

nm-applet &
picom &
copyq &
flameshot &
dunst &
xidlehook --not-when-audio --not-when-fullscreen --timer 120 'betterlockscreen -l dimblur' '' --timer 300 'systemctl suspend' '' &
sleep 40s && $HOME/Documents/scripts/battery-notifications/batterynotif.sh &

while true; do
exec python3 /usr/bin/qtile start 
done


