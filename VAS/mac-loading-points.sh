#!/bin/bash
# https://support.norton.com/sp/en/us/home/current/solutions/v59310362
# https://download.bitdefender.com/mac/av/TSMD/en/bitdefender_antivirus_for_mac.dmg
YEAR=2022
ls -l /System/Library/LaunchAgents /System/Library/LaunchDaemons /System/Library/StartupItems /Library/LaunchAgents /Library/LaunchDaemons /Library/StartupItems ~/Library/LaunchAgents ~/Library/LaunchDaemons | grep $YEAR
