# python as simple web server 
# http://localhost:8000/filename.m3u8
ffmpeg -i input_video.mp4 \
  -codec: copy \
  -hls_time 10 \
  -hls_list_size 0 \
  -f hls \
  filename.m3u8
#https://www.mux.com/articles/how-to-convert-mp4-to-hls-format-with-ffmpeg-a-step-by-step-guide
