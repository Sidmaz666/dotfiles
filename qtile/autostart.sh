#!/bin/sh
nm-applet &
copyq &
flameshot &
picom &
xidlehook --not-when-audio --not-when-fullscreen --timer 120 'betterlockscreen -l dim 200' '' --timer 300 'systemctl suspend' '' &
 $HOME/Documents/scripts/battery-notifications/batterynotif.sh &
