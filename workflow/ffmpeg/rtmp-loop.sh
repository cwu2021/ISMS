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
# backup='rtmp://b.rtmp.server:1935/live/720p.stream'

while true; do
cd $folder
ls | while read source
do
/src/ffmpeg-2.6.2-1.el6.i686/bin/ffmpeg -re -i $source -acodec copy -vcodec copy -bufsize 8000k -f flv $output < /dev/null
# backup stream for broadcast. however, one failed, both failed..tee muxer may be better buy also not sure.
# https://trac.ffmpeg.org/wiki/EncodingForStreamingSites
# 至於那個備援能起到多大作用，還是取決於youtube平台的實作是否完善，用戶就是照他設計的設定來做。但若網路質量不足，這樣的消耗反而會播不順 (沒起到備援作用反而過度消耗)。
# 網路實際品質 (不是帳面頻寬多大，什麼幾百M幾G)，觀察直播就是跟$$直接相關：按用量計價的，就比固定費用吃到飽的來的穩。高單價的比低單價的穩。AB兩點專線最穩。這些差異在隨便上網不會察覺，而LIVE直播這種要求即時且穩定的品質，就會有差。
# /src/ffmpeg-2.6.2-1.el6.i686/bin/ffmpeg -re -i $source -acodec copy -vcodec copy -bufsize 8000k -f flv $output -acodec copy -vcodec copy -bufsize 8000k -f flv $backup < /dev/null
done
done

# Facebook relay may require aac audio encoding.
# -re -i "$SOURCE" -c:v copy -c:a aac -f flv "$FACEBOOK_URL/$KEY"
