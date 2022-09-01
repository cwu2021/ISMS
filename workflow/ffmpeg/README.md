# Recording video
## https://trac.ffmpeg.org/wiki/Capture/Blackmagic
$ ffmpeg -list_devices true -f dshow -i dummy <br>
$ ffmpeg -y -f dshow -video_size 1920x1080 -pixel_format  uyvy422 -rtbufsize 702000 -framerate 59.94 -i video="Decklink Video Capture" -codec:v libx264 -pix_fmt yuv420p -preset ultrafast -an -crf 0  output.mp4
# NDI and ffmpeg streaming commands
## http://haytech.blogspot.com/2018/03/ndi-and-ffmpeg-streaming-commands.html
### Monitor an NDI stream
$ ffplay -f libndi_newtek -i "HAYLAPTOP (FrontCamera)" <br>
### Stream a webcam to NDI
$ ffmpeg -f v4l2 -framerate 30 -video_size 1280x720 -pixel_format mjpeg -i /dev/video1 -f libndi_newtek -pix_fmt uyvy422 FrontCamera
### NDI requires switch instead of direct device connection, which may be due to broadcast address needs.
# NDI and Skype
- Internet and LAN access for Skype all allowed between TriCaster and SkypeTX are required. 
- Two channels available on TC1.
