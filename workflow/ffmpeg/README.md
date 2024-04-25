# Wowza: video analytics
 - https://www.wowza.com/video-analytics
# Recording video
## https://trac.ffmpeg.org/wiki/Capture/Blackmagic
$ ffmpeg -list_devices true -f dshow -i dummy <br>
$ ffmpeg -y -f dshow -video_size 1920x1080 -pixel_format  uyvy422 -rtbufsize 702000 -framerate 59.94 -i video="Decklink Video Capture" -codec:v libx264 -pix_fmt yuv420p -preset ultrafast -an -crf 0  output.mp4 <br>
https://stackoverflow.com/questions/47339745/sending-blackmagic-decklink-studio-4k-over-rtmp-streams-with-ffmpeg <br>
$ ffmpeg -re -format_code Hi59 -f decklink -i 'DeckLink Studio 4K' -map 0 -flags +global_header -vcodec libx264 -crf 25 -preset medium -pix_fmt yuv422p -acodec aac -f tee "[f=flv]rtmp://ip1/live/test|[f=flv]rtmp://ip2/live/test.
# Encode/VFX – FFmpeg
 - https://trac.ffmpeg.org/wiki/Encode/VFX
 - https://www.lighterra.com/papers/videoencodingh264/
 - HLS "Error when loading first segment" https://github.com/ytdl-org/youtube-dl/issues/28175
## Apple Prores
https://www.apple.com/tw/final-cut-pro/docs/Apple_ProRes_White_Paper.pdf
## Disable Chrome's page translation on the commandline
--disable-features=Translate
<br> https://superuser.com/questions/1237561/disable-chromes-page-translation-on-the-commandline
## Building a video converter with Rails 6 and FFmpeg
https://dev.to/davidcolbyatx/building-a-video-converter-with-rails-6-and-ffmpeg-5e88
## Simple yet powerful wrapper around the ffmpeg 
https://github.com/streamio/streamio-ffmpeg
# NDI and ffmpeg streaming commands
## http://haytech.blogspot.com/2018/03/ndi-and-ffmpeg-streaming-commands.html
### Monitor an NDI stream
$ ffplay -f libndi_newtek -i "HAYLAPTOP (FrontCamera)" <br>
### Stream a webcam to NDI
$ ffmpeg -f v4l2 -framerate 30 -video_size 1280x720 -pixel_format mjpeg -i /dev/video1 -f libndi_newtek -pix_fmt uyvy422 FrontCamera
### Streaming from NDI to Facebook with ffmpeg
xenial:~$ ffmpeg-ndi/ffmpeg -f libndi_newtek -find_sources 1 -i dummy
https://forums.newtek.com/threads/streaming-from-ndi-to-facebook-with-ffmpeg.157567/ <br>
C:\\> ffmpeg.exe -f libndi_newtek -i "NC1IO-RCTV (IN 4)" -vf yadif -c:v libx264 -preset veryfast -crf 20 -c:a aac -f flv "rtmp://live-api-s.facebook.com:80/rtmp/101XXXXXXXXXXXXXX?ds=1&s_vt=api-s&a=ATivxXXXXXXXXXX"
## intermediate codec (between camera and output)
 - https://www.theinsidetips.com/tip-105-why-do-we-need-intermediate-codecs/
 - https://blog.frame.io/2017/02/13/compare-50-intermediate-codecs/
 - It is generally very similar to MPEG-2 intraframe. .. NewTek's NDI network codec uses SHQ2 and SHQ7. https://wiki.multimedia.cx/index.php/SpeedHQ
 - NDI 單路約 150-250Mbps ( 10Gbps = 40 路 )，又類似 MPEG-2 I-frame 編碼，那麼畫質應當不比 Vegas 輸出的 XDCAM 35Mbps MP4 差。 https://learnmediatech.com/i-p-b-frames-and-gops-mpeg-2/ 
 - https://www.getop.com/product-page/aja-bridge-ndi-3g-雙向轉換器 
### NDI requires switch instead of direct device connection, which may be due to broadcast address needs.
# NDI and Skype
- Internet and LAN access for Skype all allowed between TriCaster and SkypeTX are required. 
- Two channels available on TC1.
# FFmpeg on Mac
### macOS更新到Catalina後，找不到TIMEMACHINE上原來的的備份，只要這一招就能解決 @Blog-i-Move
 - https://blogimove.com/catalina-timemachine-recovery-problem/
### static FFmpeg binaries for macOS 64-bit
 - https://evermeet.cx/ffmpeg/
### Installing FFmpeg on macOS Big Sur (on Intel) - RickMakes
 - https://www.rickmakes.com/installing-ffmpeg-on-macos-big-sur-on-intel/
<br> $ curl https://url.of.asc | gpg --import
<br> $ gpg --verify veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb.sig veracrypt-1.24-Update7-Ubuntu-20.04-amd64.deb
<br> $ gpg --recv-keys 70202E8ED17B372A6D04467B4E7BEC998E920EE1
<br> $ gpg --verify ffmpeg-112813-gfb52070848.zip.sig
 - https://www.linuxbabe.com/security/verify-pgp-signature-software-downloads-linux
### Amazon EC2 Mac Instances - Amazon Web Services
 - https://aws.amazon.com/ec2/instance-types/mac/
### 如何查 Apple M1 軟體、遊戲相容性？用這方法即可查詢 - 瘋先生
 - https://mrmad.com.tw/apple-silicon-compatible-query

# Transcode Cache
/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/Cache/PhotoTranscoder 

# HLS loader plugin for download
 - https://www.hlsloader.com/

# Plex Media Server data directory
/var/lib/plexmediaserver/Library/Application Support/Plex Media Server/
 https://support.plex.tv/articles/202915258-where-is-the-plex-media-server-data-directory-located/
