#!/bin/bash
if [[ -z "$1" ]]; then 
  dt="$(date +%Y%m%H%M%S)"
  edt="$(echo "$dt")"
  name="recording$edt.avi"
else
  name=$1
fi
aname="recording$edt.mp4"
ffmpeg -f x11grab -i :0.0 -f alsa -ac 1 -i default -q 3 "/tmp/$name"  
ffmpeg -i "/tmp/$name" -c:v libx264 -preset fast -crf 35 -profile:v baseline -level 3.0 -pix_fmt yuv420p "/home/$USER/Videos/$aname"  
clear
echo "File $name Will Be Converted To $aname in /home/$USER/Videos Directory!" 
echo "Deleting $name File... $aname Converted " 
rm -Rf /tmp/$name  
echo "Video Ready!" 

