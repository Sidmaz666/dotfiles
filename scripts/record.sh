#!/bin/bash
if [[ -z "$1" ]]; then 
  dt="$(date +%Y%m%H%M%S)"
  edt="$(echo "$dt")"
  name="recording$edt.mkv"
else
  name=$1
fi
aname="recording$edt.mp4"
ffmpeg -f x11grab -video_size 1920x1080 -framerate 30 -i :0.0 -f pulse -i  alsa_output.pci-0000_03_00.6.analog-stereo.monitor -q 3 "/tmp/$name"  
ffmpeg -i "/tmp/$name" -c:v libx264 -preset veryfast -crf 35 -profile:v baseline -level 3.0 -pix_fmt yuv420p "/home/$USER/Videos/$aname"  
clear
echo "File $name Will Be Converted To $aname in /home/$USER/Videos Directory!" 
echo "Deleting $name File... $aname Converted " 
rm -Rf /tmp/$name  
echo "Video Ready!" 

