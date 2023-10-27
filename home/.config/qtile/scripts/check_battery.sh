#!/bin/bash

low_charge_notification=0
full_charge_notification=0
check_interval=2

while true; do
battery_status=$(acpi -b | awk '{print $3 $4}' | sed 's/%,//g' | sed 's/,/ /g')
charging=$(echo "$battery_status" | grep -c "Charging")
level=$(echo "$battery_status" | awk '{print $2}')

if [ $level -lt 10 ] && [ $charging -eq 0 ] && [ $low_charge_notification -lt 2 ]; then
	notify-send " 󰂃 Low battery: ${level}% " \
	  " Connect to charger soon! " -t 8000
	canberra-gtk-play -i suspend-error
	low_charge_notification=$(echo $(($low_charge_notification + 1)))
fi

if [ $low_charge_notification -eq 2 ] && [ $charging -eq 1 ]; then
	low_charge_notification=0
fi

if [ $level -gt 95 ] && [ $charging -eq 1 ] && [ $full_charge_notification -eq 0 ]; then
	notify-send " 󱟢 Full battery: ${level}% " \
	  " Disconnect the charger! " -t 8000
	canberra-gtk-play -i suspend-error
	full_charge_notification=$(echo $(($full_charge_notification + 1)))
fi

if [ $full_charge_notification -eq 1 ] && [ $charging -eq 0 ] ; then
	full_charge_notification=0
fi

sleep ${check_interval}m
done
