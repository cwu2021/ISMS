#!/bin/bash
# disabled due to auto update resulting in network restarting, or other unknown issues such as Temperature Zone 2 overheat.
# cron.daily also needs to be marked out in crontab.
sudo systemctl list-timers
sudo systemctl stop apt-daily-upgrade.timer
sudo systemctl stop apt-daily.timer
# http://www.ruanyifeng.com/blog/2018/03/systemd-timer.html
sudo systemctl list-unit-files --type timer
sudo systemctl disable apt-daily-upgrade.timer
sudo systemctl disable apt-daily.timer
sudo systemctl daemon-reload
