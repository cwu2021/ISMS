#!/bin/bash
# Speeding up/slowing down video
# https://trac.ffmpeg.org/wiki/How%20to%20speed%20up%20/%20slow%20down%20a%20video
ffmpeg -y -fflags +genpts -r 24 -i myvideo.webm -c:v libx264 -af atempo=0.8 -movflags faststart output.mp4
