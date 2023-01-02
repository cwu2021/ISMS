#!/bin/bash
# https://wireguard.how/client/ios/
sudo wg show wg0
(umask 077 && wg genkey > wg-private-client.key)
wg pubkey < wg-private-client.key > wg-public-client.key
cat wg-private-client.key
cat > ~/wg-client.conf << EOF
# define the local WireGuard interface (client)
[Interface]
# contents of wg-private-client.key
PrivateKey = oBkgA+KZU6mWY5p7d0PEWxnYkihBw9TmHZXEYnQkz3g=
# the IP address of this client on the WireGuard network
Address=10.0.2.2/32
# define the remote WireGuard interface (server)
[Peer]
# from `sudo wg show wg0 public-key`
PublicKey = 2efuG9OYmMPQpbkJ8CVxGlvQflY6p1u+o4wjcgGII0A=
# the IP address of the server on the WireGuard network
AllowedIPs = 10.0.2.1/32
https://stackoverflow.com/questions/54776243/wireguard-how-to-push-routes-and-dhcp-options-to-clients-from-server
# AllowedIPs = 100.64.0.0/10, 192.168.178.0/24
# The AllowedIPs value is 0.0.0.0/0, which means “all IPv4 addresses”.
# https://ubuntu.com/server/docs/wireguard-vpn-defaultgw
# public IP address and port of the WireGuard server
Endpoint = 35.36.37.38:51820
EOF
sudo apt install qrencode --assume-yes
qrencode --read-from=wg-client.conf --type=UTF8
# https://serversideup.net/how-to-configure-a-wireguard-ios-client/

modprobe wireguard
echo module wireguard +p > /sys/kernel/debug/dynamic_debug/control
dmesg -wH
journalctl -kf
# https://serverfault.com/questions/1020279/how-to-see-debug-logs-for-wireguard-e-g-to-see-authentication-attempts
# https://ubuntu.com/server/docs/wireguard-vpn-troubleshooting
