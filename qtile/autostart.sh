#!/bin/sh
/home/$USER/.config/qtile/scripts/feh-rnd-wall.sh &
/home/$USER/.config/qtile/scripts/auto_bar_switch_layout.sh &
lxsession -e qtile -s qtile  &
picom &
volumeicon &
flameshot &
copyq &
xidlehook --not-when-audio --not-when-fullscreen --timer 300 "systemctl suspend" '' &
