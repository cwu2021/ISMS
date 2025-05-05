$TEMPer = `python3 temper.py`; # from urwen/temper
$server = `zpool status`; # NAS as server check 
$net = `apt install speedtest-cli`;

=begin endnote
& remote backup with s3 or rsync.
 - ISP may block misuse of client ip on gateway. however, it can route to the client if mac/ip exists in arp table, even if the client ip set wrong again.
