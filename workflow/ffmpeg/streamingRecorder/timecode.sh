#!/bin/bash

# HLS may not be stable as RTMP.
url='rtmp://mychannel.url/first.m3u8'
record_min=$2
output=$1

#ffmpeg -i $url -strict -2 -vf drawtext="fontfile=/usr/share/fonts/truetype/ttf-dejavu/DejaVuSans.ttf:x=60:y=60:text='%m/%d/%y %H\:%M\:%S':fontsize=24:fontcolor=green\@0.8:expansion=strftime" -c:v libx264 -crf 25 -c:a aac -b:a 128k -preset:v ultrafast -t 00:$record_min:00 -y $output
ffmpeg -i $url -strict -2 -vf drawtext="fontfile=/usr/share/fonts/truetype/ttf-dejavu/DejaVuSans.ttf:x=60:y=60:text='%m/%d/%y %H\:%M\:%S':fontsize=24:fontcolor=green\@0.8:expansion=strftime" -c:v libx264 -b:v 400k -c:a aac -b:a 128k -preset:v ultrafast -t 00:$record_min:00 -y $output
