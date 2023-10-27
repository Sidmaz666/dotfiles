#!/bin/bash

low_charge_notification=0
full_charge_notification=0
check_interval=2

while true; do
battery_status=$(acpi -b)
charging=$(echo "$battery_status" | grep -c "Charging")
full_charge=$(echo "$battery_status" | grep -c "Not Charging")
discharging=$(echo "$battery_status" | grep -c "Discharging")
level=$(echo "$battery_status" \
  | cut -d, -f2 \
  | cut --characters=2,3,4 \
  | sed 's/%//g')

if [ "$level" -lt 10 ] && [ "$discharging" -eq 1 ] && [ "$low_charge_notification" -lt 2 ]; then
	notify-send " 󰂃 Low battery: ${level}% " \
	  " Connect to charger soon! " -t 8000
	canberra-gtk-play -i suspend-error
	low_charge_notification=$((low_charge_notification + 1))
fi

if [ "$low_charge_notification" -eq 2 ] && [ "$charging" -eq 1 ]; then
	low_charge_notification=0
fi

if [ "$level" -gt 95 ] && [ "$full_charge" -eq 1 ] && [ "$full_charge_notification" -eq 0 ]; then
	notify-send " 󱟢 Full battery: ${level}% " \
	  " Disconnect the charger! " -t 8000
	canberra-gtk-play -i suspend-error
	full_charge_notification=$((full_charge_notification + 1))
fi

if [ "$full_charge_notification" -eq 1 ] && [ "$discharging" -eq 1 ] ; then
	full_charge_notification=0
fi

sleep ${check_interval}m
done
