#!/bin/bash
# installed via pip3 on ubuntu.
sudo apt install python3-pip
# https://github.com/ytdl-org/youtube-dl
pip3 install --upgrade youtube-dl
# twitch video also supported.
youtube-dl https://www.twitch.tv/videos/1297909154
