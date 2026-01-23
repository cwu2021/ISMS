#!/bin/bash
# Re: How to disable the mouse pointer?
# https://forums.raspberrypi.com/viewtopic.php?t=234879
unclutter -idle 0 &
# Full-screen mode: @chromium-browser --start-fullscreen . The browser starts in app. mode but expanded to full-screen. You can press the F11 key to break out of full-screen mode.
# Fireeye site not working (Mar 18, 2023)
#chromium-browser --start-fullscreen https://www.fireeye.com/cyber-map/threat-map.html
#chromium-browser --disable-features=Translate --start-fullscreen https://stats.uptimerobot.com/Y9EQoCDx0r
chromium-browser --disable-features=Translate --start-fullscreen https://threatmap.checkpoint.com
: '
You can no longer use UptimeRobot to monitor for free on commercial websites
UptimeRobot has updated its terms, and you can no longer use their free plan to monitor services for commercial projects.

I think this poses a challenge for startups or small projects that are just beginning their SaaS or eCommerce businesses.

This change significantly limits the functionality of the free tier, making it less suitable for businesses or anyone managing websites and services at a commercial scale. As a result, many users may need to explore alternative monitoring solutions that offer more flexibility for commercial use without such restrictions.
https://www.reddit.com/r/SaaS/comments/1g15mvl/you_can_no_longer_use_uptimerobot_to_monitor_for/
'
