#!/bin/bash
read -p "Enter Resolution: " res
[[ ! -z "$res" ]] && iores="$res" ||
iores="1920x1080"
read -p "Audio Input: " oi
[[ ! -z "$oi" ]] && 
iaudio="$oi"||
iaudio="default"
read -p "Audio Output: " oa
[[ ! -z "$oa" ]] &&
oaudio="$oa" ||
oaudio="1"
read -p "FPS: " fps
[[ ! -z "$fps" ]] &&
f_ps="$fps"||
f_ps="30"
if [[ -z "$1" ]]; then
	dt="$(date +%Y%m%H%M%S)"
	edt="$(echo "$dt")"
	name="recording$edt.mp4"
else
	name=$1
fi &&
ffmpeg -f x11grab -s "$iores" -r "$f_ps" -i :0.0 -f alsa -ac "$oaudio" \
       	-i "$iaudio" -vcodec libx264 -s "$iores" \
       	-acodec libmp3lame -ab 128k -ar 44100 \
       	-threads 0 -f mp4 "/home/$USER/Videos/$name"

