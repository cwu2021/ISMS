#!/bin/bash
# https://dotblogs.com.tw/eric_obay_talk/2021/07/20/145116
ffmpeg -re -i $(youtube-dl -f 93 -g https://www.youtube.com/watch?v=GmnBAjLQFic) -c:v copy -c:a copy -f flv rtmp://10.140.15.225/live/yt
cat > /usr/local/nginx/conf/nginx.conf << EOF
worker_processes  1;

events {
    worker_connections  1024;
}

rtmp {
    server {
        listen 1935;
        application live {
            live           on;
            interleave     on;
            hls            on;
            hls_path       /tmp/hls;
            hls_playlist_length 3s;
            hls_fragment 1s;
       }
    }
}

http {
    default_type application/octet-stream;

    server {
        listen 80;
        location / {
            root /tmp/hls;
        }
    }

    types {
        application/vnd.apple.mpegurl m3u8;
        video/mp2t ts;
        text/html html;
    }
}
EOF
