# surf @ VM & LXD | wg
# freegate-release https://github.com/freegate-release
# NAT ubuntu 22.04
sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
# smart projector , RGB BKL-72 keyboard (Oct 10,23 2023)
# no bash history setup
# https://farryhsu.com/how-to-evaluate-ctr-and-ad-perfromance/

# https://surfshark.com/download/chrome
# SOCKS is a proxy server, and works similarly to a VPN. The proxy server is much faster than a VPN. The main difference is that the proxy server isn’t encrypted. The data is still hidden and secure though, but the only part that is encrypted is the initial access to the proxy server. It is recommended to use SOCKS5 if you want better security. Though, the best security will be through a VPN.
# https://www.quora.com/What-is-the-difference-between-socks-and-a-VPN