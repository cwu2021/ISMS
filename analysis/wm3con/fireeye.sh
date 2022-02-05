#!/bin/bash
# Re: How to disable the mouse pointer?
# https://forums.raspberrypi.com/viewtopic.php?t=234879
unclutter -idle 0 &
# Full-screen mode: @chromium-browser --start-fullscreen . The browser starts in a
pp. mode but expanded to full-screen. You can press the F11 key to break out of fu
ll-screen mode.
chromium-browser --start-fullscreen https://www.fireeye.com/cyber-map/threat-map.h
tml
