#!/bin/bash
pactl set-sink-volume @DEFAULT_SINK@ -5% 
vol="$(pactl list sinks | grep '^[[:space:]]Volume:' | \
  head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')"
notify-send "🔊 Volume Level" "$vol%" -t 3000 
