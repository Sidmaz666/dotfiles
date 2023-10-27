#!/bin/bash
brightnessctl set +10%
bright="$(brightnessctl | head -2 | awk '{print $4}' | sed -e 's/%[)]//' | sed -e 's/[(]//' | tail -1 )"
notify-send "🔆 Brightness Level" "$bright%" -t 3000 
