#!/bin/bash
# installed via pip3 on ubuntu.
sudo apt install python3-pip
# https://github.com/ytdl-org/youtube-dl
pip3 install --upgrade youtube-dl
# twitch video also supported.
youtube-dl https://www.twitch.tv/videos/1297909154
# youtube-dl didn't update from 2021
# https://blog.maki0419.com/2022/01/youtube-download-ytdlp-ffmpeg.html
# https://github.com/yt-dlp/yt-dlp
sudo pip3 install yt-dlp
yt-dlp https://youtu.be/FevWtQlOoPI
# audio only download with yt-dlp
yt-dlp -f bestaudio -x --audio-format mp3 --audio=quality 0 "URL"
