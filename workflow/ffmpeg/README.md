# Recording video
## https://trac.ffmpeg.org/wiki/Capture/Blackmagic
$ ffmpeg -list_devices true -f dshow -i dummy <br>
$ ffmpeg -y -f dshow -video_size 1920x1080 -pixel_format  uyvy422 -rtbufsize 702000 -framerate 59.94 -i video="Decklink Video Capture" -codec:v libx264 -pix_fmt yuv420p -preset ultrafast -an -crf 0  output.mp4
