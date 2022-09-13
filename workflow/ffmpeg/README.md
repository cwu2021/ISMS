# Recording video
## https://trac.ffmpeg.org/wiki/Capture/Blackmagic
$ ffmpeg -list_devices true -f dshow -i dummy <br>
$ ffmpeg -y -f dshow -video_size 1920x1080 -pixel_format  uyvy422 -rtbufsize 702000 -framerate 59.94 -i video="Decklink Video Capture" -codec:v libx264 -pix_fmt yuv420p -preset ultrafast -an -crf 0  output.mp4 <br>
https://stackoverflow.com/questions/47339745/sending-blackmagic-decklink-studio-4k-over-rtmp-streams-with-ffmpeg <br>
$ ffmpeg -re -format_code Hi59 -f decklink -i 'DeckLink Studio 4K' -map 0 -flags +global_header -vcodec libx264 -crf 25 -preset medium -pix_fmt yuv422p -acodec aac -f tee "[f=flv]rtmp://ip1/live/test|[f=flv]rtmp://ip2/live/test.
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
### NDI requires switch instead of direct device connection, which may be due to broadcast address needs.
# NDI and Skype
- Internet and LAN access for Skype all allowed between TriCaster and SkypeTX are required. 
- Two channels available on TC1.
