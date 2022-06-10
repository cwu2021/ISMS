@echo off
SET WORKDIR="path\to\WORLD"
SET OUTPUTDIR="path\to\output"
REM main profile
for %%B in (%WORKDIR%\*) do (ffmpeg.exe -y -i "%%B" -c:v libx264 -x264opts keyint=30:min-keyint=30:scenecut=-1 -r 29.97 -pix_fmt yuv411p -maxrate:v 8000k -bufsize:v 8000k -acodec libfaac -ac 2 -ar 48000 -b:a 384k -threads 0 "%%B".8M.mp4)
for %%B in (%WORKDIR%\*.8M.mp4) do (move "%%B" %OUTPUTDIR%)
REM adding -threads 6 -preset ultrafast before -c:v may speedup encoding from 35min to 5min for a 30min video
REM however, video quality of motion and colors would be seriously affected.
