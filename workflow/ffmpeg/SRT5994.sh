LISTENER="srt://<dst_ip>:<dst_port>?pkt_size=1316"

~/src/ffmpeg/ffmpeg -f lavfi -re -i smptebars=duration=60:size=1920x1080:rate=59.94 -f lavfi -re \
       -i sine=frequency=1000:duration=600:sample_rate=48000 -pix_fmt yuv420p \
       -c:v libx264 -b:v 1000k -g 30 -keyint_min 120 -profile:v baseline \
       -preset veryfast -f mpegts $LISTENER
