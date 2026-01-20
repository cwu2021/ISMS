# how to disable tracker daemon on ubuntu 20.04
tracker daemon --kill
systemctl --user mask tracker-miner-fs.service tracker-store.service tracker-extract.service tracker-writeback.service
tracker reset --hard
# reboot
