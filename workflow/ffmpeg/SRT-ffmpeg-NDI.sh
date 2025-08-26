# https://medium.com/@eyevinntechnology/using-ffmpeg-and-srt-to-transport-video-signal-to-the-cloud-7160960f846a
# https://srtlab.github.io/srt-cookbook/apps/ffmpeg/
# https://stackoverflow.com/questions/62977448/minimal-srt-stream-example-with-ffmpeg

apt-get install libssl-dev tclsh
git clone https://github.com/Haivision/srt.git
cd srt
./configure
make && make install
# -- Installing: /usr/local/bin/srt-file-transmit

# (ffmpeg compilation)
export LD_LIBRARY_PATH=/usr/local/lib/
cd ../ffmpeg-src
sudo apt install libx264-dev
./configure --enable-gpl --enable-libx264 --enable-libsrt
sudo ln -s /usr/local/lib/libsrt.so.1.5 /usr/lib

# https://github.com/Haivision/srt?tab=readme-ov-file
# https://srtlab.github.io/srt-cookbook/apps/ffmpeg.html
# srt live server for low latency https://github.com/Edward-Wu/srt-live-server

ffmpeg -f lavfi -re -i smptebars=duration=60:size=1280x720:rate=30 -f lavfi -re -i sine=frequency=1000:duration=60:sample_rate=44100 -pix_fmt yuv420p -c:v libx264 -b:v 1000k -g 30 -keyint_min 120 -profile:v baseline -preset veryfast -f mpegts "srt://127.0.0.1:4200?mode=listener"
ffmpeg -re -i intro_201605.3M.mp4 -pix_fmt yuv420p -c:v libx264 -b:v 1000k -g 30 -keyint_min 120 -profile:v baseline -preset veryfast -f mpegts "srt://127.0.0.1:4200?mode=listener"
# Caller example. SRT: No room error : use ffmpeg -re
ffmpeg -y -t 00:00:10 -i srt://127.0.0.1:4200 -c:v copy -c:a copy test.mp4

# transmission via udp/tcp pass out nat-to for port mapping is required.
nc  -u <dest> 10001 < /dev/random
# https://superuser.com/questions/124672/how-to-generate-udp-packet

# (NDI example)
./configure --enable-nonfree --enable-libndi_newtek --extra-cflags="-I/usr/include/ndi/" --extra-ldflags="-L/usr/include/ndi/" --enable-libx264 --enable-gpl

# SRT Rx: To setup an SRT Receiver with ffmpeg that outputs the incoming stream over a multicast network you start ffmpeg with this command.
# SRT: No room error : because ffmpeg -re
./ffmpeg -re -i srt://0.0.0.0:9998?pkt_size=1316&mode=listener -vcodec copy -acodec copy -strict -2 -y -f mpegts udp://239.0.0.2:1234?pkt_size=1316

# https://github.com/Haivision/srt/blob/master/docs/srt-live-transmit.md
./ffmpeg -f lavfi -re -i smptebars=duration=300:size=1280x720:rate=30 -f lavfi -re -i sine=frequency=1000:duration=60:sample_rate=44100 -pix_fmt yuv420p -c:v libx264 -b:v 1000k -g 30 -keyint_min 120 -profile:v baseline -preset veryfast -f mpegts "udp://127.0.0.1:1234?pkt_size=1316"

./srt-live-transmit udp://:1234 srt://:4201 -v
# Sending and Receiving SRT Video Feeds - Viz Now
# https://docs.vizrt.com/viz-now-launchpad/1.2/Sending_and_Receiving_SRT_Video_Feeds.html
:'
At IBC 2025, stand #10.A41, Vizrt will show how AI-enhanced virtual studios help you: 
 - Bring AR graphics and virtual sets to life in compact setups 
 - Produce polished fireside chats, training, and branded videos with ease 
 - Deliver a visual experience that’s bold, branded, and builtto break through
'
# https://www.haivision.com/blog/tag/play-pro/
