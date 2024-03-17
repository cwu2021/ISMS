# surf @ VM & LXD | wg
# freegate-release https://github.com/freegate-release
# NAT ubuntu 22.04
sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
# smart projector , RGB BKL-72 keyboard (Oct 10,23 2023)
# no bash history setup
# https://farryhsu.com/how-to-evaluate-ctr-and-ad-perfromance/
