#!/bin/bash

LANG=en_US

# check rsync log via journalctl.
journalctl -ef -t rsyncd
# e.g. /uploads/assets/ 底下的文件/目錄
# 1. 現在每日的同步僅僅會把當天和前一天的檔案同步到backup主機
# 2. 如果舊的資料夾裡面的文件有變動, 就必須另外處理

while true
do
echo "`date` Let's go!!" >> loop.log
# sync push via sftp during busy hours, consuming larger internal bandwidth but faster.
# sync push and pull from cloud during normal hours as regular SOP.
done
