#!/bin/bash
# https://askubuntu.com/questions/356006/kill-a-screen-session
# Troubleshooting CDN
curl -i  https://example.com/live/playlist.m3u8
openssl s_client -connect example.com:443
curl -w "Connect time: %{time_connect} Time to first byte: %{time_starttransfer} Total time: %{time_total} \n" -o /dev/null https://example.com/live/playlist.m3u8
curl -H "origin: example.com" -v "https://cloudfront.net/live/playlist.m3u8"
