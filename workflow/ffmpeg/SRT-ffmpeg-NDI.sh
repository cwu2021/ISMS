# https://medium.com/@eyevinntechnology/using-ffmpeg-and-srt-to-transport-video-signal-to-the-cloud-7160960f846a
# https://srtlab.github.io/srt-cookbook/apps/ffmpeg/

apt-get install libssl-dev tclsh
git clone https://github.com/Haivision/srt.git
cd srt
./configure
make && make install
# -- Installing: /usr/local/bin/srt-file-transmit

# (ffmpeg compilation)
export LD_LIBRARY_PATH=/usr/local/lib/
cd ../ffmpeg-src
./configure --enable-libsrt ...
# (NDI example)
./configure --enable-nonfree --enable-libndi_newtek --extra-cflags="-I/usr/include/ndi/" --extra-ldflags="-L/usr/include/ndi/" --enable-libx264 --enable-gpl

# SRT Rx: To setup an SRT Receiver with ffmpeg that outputs the incoming stream over a multicast network you start ffmpeg with this command.

./ffmpeg -re -i srt://0.0.0.0:9998?pkt_size=1316&mode=listener -vcodec copy -acodec copy -strict -2 -y -f mpegts udp://239.0.0.2:1234?pkt_size=1316

# https://github.com/Haivision/srt/blob/master/docs/srt-live-transmit.md
./ffmpeg -f lavfi -re -i smptebars=duration=300:size=1280x720:rate=30 -f lavfi -re -i sine=frequency=1000:duration=60:sample_rate=44100 -pix_fmt yuv420p -c:v libx264 -b:v 1000k -g 30 -keyint_min 120 -profile:v baseline -preset veryfast -f mpegts "udp://127.0.0.1:1234?pkt_size=1316"

./srt-live-transmit udp://:1234 srt://:4201 -v
