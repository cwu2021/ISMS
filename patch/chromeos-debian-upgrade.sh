#!/bin/bash
# https://www.aboutchromebooks.com/news/how-to-upgrade-linux-on-a-chromebook-to-debian-bullseye-11-3/
# You can verify or force the installation of Bullseye by visiting chrome://flags#crostini-container-install and choosing Bullseye from the options.
apt update
apt upgrade
apt autoremove
