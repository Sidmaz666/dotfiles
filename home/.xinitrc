export QT_QPA_PLATFORMTHEME=gtk2
export DESKTOP_SESSION=qtile

nm-applet &
picom &
copyq &
flameshot &
dunst &

export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"
xidlehook \
  --not-when-audio \
  --not-when-fullscreen \
  --timer 60 \
  'xrandr --output "$PRIMARY_DISPLAY" --brightness 0.7' \
  'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
  --timer 120 'lock' \
  'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' \
  --timer 300 'systemctl suspend' \
  'xrandr --output "$PRIMARY_DISPLAY" --brightness 1' &
sleep 30s && sh ~/.config/qtile/scripts/check_battery.sh &

while true; do
exec /usr/bin/qtile start
done
