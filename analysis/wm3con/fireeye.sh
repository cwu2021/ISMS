#!/bin/bash
# Re: How to disable the mouse pointer?
# https://forums.raspberrypi.com/viewtopic.php?t=234879
unclutter -idle 0 &
# Full-screen mode: @chromium-browser --start-fullscreen . The browser starts in app. mode but expanded to full-screen. You can press the F11 key to break out of full-screen mode.
# Fireeye site not working (Mar 18, 2023)
#chromium-browser --start-fullscreen https://www.fireeye.com/cyber-map/threat-map.html
#chromium-browser --disable-features=Translate --start-fullscreen https://stats.uptimerobot.com/Y9EQoCDx0r
chromium-browser --disable-features=Translate --start-fullscreen https://threatmap.checkpoint.com
