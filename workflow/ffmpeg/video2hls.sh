# python as simple web server 
# http://localhost:8000/filename.m3u8
ffmpeg -i input_video.mp4 \
  -codec: copy \
  -hls_time 10 \
  -hls_list_size 0 \
  -f hls \
  filename.m3u8
# https://www.mux.com/articles/how-to-convert-mp4-to-hls-format-with-ffmpeg-a-step-by-step-guide
# with an HDMI USB dongle for input, Windows can act as an encoder with tor management. TEMPer USB dongle can do environmental measurement as well. 
ffmpeg -list_devices true -f dshow -i dummy
# USB UHD and audio can both be detected with both OBS 27 and ffmpeg essential on Windows 7 64-bit. However, USB2.0 HD is used on Windows 11.