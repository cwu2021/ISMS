#!/bin/bash
# https://github.com/erkstruwe/chromecast-cli
# npm related packages required. about 162MB.
sudo dnf install npm
sudo pm install -g chromecast-cli
chromecast --host 192.168.1.100 status
chromecast --host 192.168.1.100 play http://192.168.1.1/media/song.mp3
sudo npm uninstall -g chromecast-cli
sudo dnf remove npm nodejs nodejs-libs openssl nodejs-docs nodejs-full-i18n
# Google Cast uses tcp port 8009 for device connection
