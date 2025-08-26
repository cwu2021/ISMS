#!/bin/bash
# https://support.norton.com/sp/en/us/home/current/solutions/v59310362
# https://download.bitdefender.com/mac/av/TSMD/en/bitdefender_antivirus_for_mac.dmg
YEAR=2022
ls -l /System/Library/LaunchAgents /System/Library/LaunchDaemons /System/Library/StartupItems /Library/LaunchAgents /Library/LaunchDaemons /Library/StartupItems ~/Library/LaunchAgents ~/Library/LaunchDaemons | grep $YEAR
# 蘋果緊急修補ImageIO元件的零時差漏洞
:'
https://www.ithome.com.tw/news/170738
這項漏洞出現在名為ImageIO的圖像框架元件，為記憶體越界寫入的問題，一旦此元件處理有問題的圖片檔案，就有可能造成記憶體中斷。此漏洞由蘋果自行發現，該公司推出iOS 18.6.2、iPadOS 18.6.2、iPadOS 17.7.10，以及macOS Sequoia 15.6.1、Sonoma 14.7.8、Ventura 13.7.8進行修補。
'
