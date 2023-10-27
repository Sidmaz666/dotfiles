#!/usr/bin/env bash

readonly dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)";
rofi_command="rofi -theme $dir/five.rasi"


# Options
shutdown="\u23fb"
reboot="\uead2"
suspend="\ueb33"

# Confirmation
confirm_exit() {
	rofi -dmenu\
		-i\
		-no-fixed-num-lines\
		-p "Are You Sure? : "\
		-theme $dir/confirm.rasi
}


# Variable passed to rofi
options="$shutdown\n$reboot\n$suspend"
chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2)"
echo -e $options
case $chosen in
    ⏻)
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" || $ans == "o" ]]; then
			systemctl poweroff
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        fi
        ;;
    )
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y"  || $ans == "o" ]]; then
			systemctl reboot
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        fi
        ;;
      )
		ans=$(confirm_exit &)
		if [[ $ans == "yes" || $ans == "YES" || $ans == "y" || $ans == "Y" || $ans == "o" ]]; then
			systemctl suspend
		elif [[ $ans == "no" || $ans == "NO" || $ans == "n" || $ans == "N" ]]; then
			exit 0
        fi
        ;;
esac
