#!/bin/bash
# https://www.dariawan.com/tutorials/linux/linux-tail-starting-specific-line/
nagios3stats |tail -n +30 | head -22
:'
[Checkmk Announce] Upcoming Checkmk Security Release 2.4.0p13, 2.3.0p38 and 2.2.0p46
 - A vulnerability in a plugin for the Windows agent could allow low-privileged users on the Windows host to escalate privileges to Local System.
 - Authenticated users in Checkmk could be able to break the configuration of the site, causing a denial-of-service.
 - Under certain unlikely circumstances, sensitive information entered by the user could be leaked via the URL.
[Checkmk Announce] New Checkmk stable release 2.3.0p42
[Checkmk Announce] New Checkmk stable release 2.4.0p20
'
