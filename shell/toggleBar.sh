#!/bin/bash
#togg=1
qtile cmd-obj -o cmd -f hide_show_bar -a top
#while true 	
#do
#current_layout="$(echo "$(qtile cmd-obj -o layout -f info | sed -e 's/{//g' -e 's/\[//g' -e 's/}//g' -e  's/.*://g' -e 's/[[:space:]]//g' | tr -d \'\" | tail -n 1)")"
 
#while [ "$togg" = 1 ]
#do
#	echo "$current_layout"	
##	qtile cmd-obj -o cmd -f hide_show_bar -a top 
       
##	qtile cmd-obj -o cmd -f hide_show_bar -a bottom

#	saving_echo="$(echo "$current_layout")"
# togg=togg+1
#if [[ "$saving_echo"='max' ]]; then
       notify-send 'Bar' "Top"  --icon=/home/kurama/.config/qtile/icons/menu.png -t 600	
# qtile cmd-obj -o cmd -f hide_show_bar -a top  && sleep 1.5 
#fi
#done
#if [[ "$current_layout" != "$saving_echo" ]]; then
#	togg=1
#fi
#done
