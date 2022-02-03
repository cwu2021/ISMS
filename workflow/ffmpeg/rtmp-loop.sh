#!/bin/bash
# use ctrl-c to simulate 'next song' for this simple loop playback.

# self compiled ffmpeg path
export LD_LIBRARY_PATH=/src/ffmpeg-2.6.2-1.el6.i686/lib

folder='/myvideo/720p'
output='rtmp://my.rtmp.server:1935/live/720p.stream'

while true; do
cd $folder
ls | while read source
do
/src/ffmpeg-2.6.2-1.el6.i686/bin/ffmpeg -re -i $source -acodec copy -vcodec copy -bufsize 8000k -f flv $output < /dev/null
done
done
