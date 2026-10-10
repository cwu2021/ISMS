ffprobe -v error -select_streams v:0 -show_entries frame=pict_type -of csv=p=0 input.mp4 | grep -c I
# GOP=120->12 as ffmpeg default 