#!/bin/bash
# use ctrl-c to simulate 'next song' for this simple loop playback.
# for scheduled streaming, just `crontab -e` a similar script without loop:
# 00 20 * * 1-6 screen -d -m /data/scheduled-rtmp.sh
# and make sure the server is set to the correct timezone:
timedatectl

# self compiled ffmpeg path
export LD_LIBRARY_PATH=/src/ffmpeg-2.6.2-1.el6.i686/lib

folder='/myvideo/720p'
output='rtmp://my.rtmp.server:1935/live/720p.stream'
backup='rtmp://b.rtmp.server:1935/live/720p.stream'

while true; do
cd $folder
ls | while read source
do
# /src/ffmpeg-2.6.2-1.el6.i686/bin/ffmpeg -re -i $source -acodec copy -vcodec copy -bufsize 8000k -f flv $output < /dev/null
# backup stream turned on to resume broadcast.
# 至於那個備援能起到多大作用，還是取決於youtube平台的實作是否完善，用戶就是照他設計的設定來做。但若網路質量不足，這樣的消耗反而會播不順 (沒起到備援作用反而過度消耗)。

/src/ffmpeg-2.6.2-1.el6.i686/bin/ffmpeg -re -i $source -acodec copy -vcodec copy -bufsize 8000k -f flv $output -acodec copy -vcodec copy -bufsize 8000k -f flv $backup < /dev/null
done
done
