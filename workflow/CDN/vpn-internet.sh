# surf @ VM & LXD | wg
# freegate-release https://github.com/freegate-release
# NAT ubuntu 22.04
sysctl net.ipv4.ip_forward=1
iptables -t nat -A POSTROUTING -o tun0 -j MASQUERADE
# VPN to intranet via vm or lxc
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
# smart projector , RGB BKL-72 keyboard (Oct 10,23 2023)
# no bash history setup
# https://farryhsu.com/how-to-evaluate-ctr-and-ad-perfromance/

# https://surfshark.com/download/chrome
# SOCKS is a proxy server, and works similarly to a VPN. The proxy server is much faster than a VPN. The main difference is that the proxy server isn’t encrypted. The data is still hidden and secure though, but the only part that is encrypted is the initial access to the proxy server. It is recommended to use SOCKS5 if you want better security. Though, the best security will be through a VPN.
# https://www.quora.com/What-is-the-difference-between-socks-and-a-VPN

# TLS Error: cannot locate HMAC in incoming packet: This means that openvpn immediately dropped the packet because it does not have the correct HMAC key from --tls-auth.
# https://forums.openvpn.net/viewtopic.php?t=31462
# How To Set Up and Configure an OpenVPN Server on Ubuntu 22.04
# https://www.digitalocean.com/community/tutorials/how-to-set-up-and-configure-an-openvpn-server-on-ubuntu-22-04
# OpenVPN Bad LZO decompression header byte: 69: The problem is that your server has comp-lzo adaptive in the config, but the client does not have compression enabled at all. So the client is sending uncompressed packets, while the server is expecting a compression header. Add comp-lzo to your client config file (adaptive is the default mode for comp-lzo, so you can omit that).
# https://superuser.com/questions/1066321/openvpn-bad-lzo-decompression-header-byte-69
openvpn --remote 10.56.100.53 --comp-lzo --dev tun --auth-user-pass --ca ca.crt --client
# --route-nopull with --pull or --client to accept all push options except routing related such as routes and dns
# https://networklessons.com/uncategorized/openvpn-server-usernamepassword-authentication
# Site-to-Site VPN | VPN Plus Server - Synology 知識中心
# https://kb.synology.com/zh-tw/SRM/help/VPNPlusServer/vpnplus_server_site2site?version=1_3
# 設定 VPN Server | VPN Server - Synology 知識中心
# https://kb.synology.com/zh-tw/DSM/help/VPNCenter/vpn_setup?version=7
# Synology VPN Server 架設超簡單！翻牆還是靠自己比較快囉～
# https://ningselect.com/24378/24/
# 埋坑: 修正 OpenVPN Client 的路由表. MIS 都哭惹，只好自己來 | by Lililala | Medium
# https://lililala.medium.com/fix-openvpn-client-route-table-e2ab869cab35
# Set up VPN Server | VPN Server - Synology Knowledge Center
# https://kb.synology.com/en-af/DSM/help/VPNCenter/vpn_setup?version=783695130
# ca expired-Synology Community
# https://community.synology.com/enu/forum/1/post/145263
:'
[Openvpn-announce] OpenVPN 2.7_alpha1 released
[Openvpn-announce] OpenVPN 2.7_alpha2 released
[Openvpn-announce] OpenVPN 2.7_beta1 released
[Openvpn-announce] OpenVPN 2.6.15 released
[Openvpn-announce] OpenVPN 2.7_beta2 released
[Openvpn-announce] OpenVPN 2.7_rc1 released
[Openvpn-announce] OpenVPN 2.6.16 released
[Openvpn-announce] OpenVPN 2.7_rc2 released
[Openvpn-announce] OpenVPN 2.6.17 released
[Openvpn-announce] OpenVPN 2.7_rc3 released
[Openvpn-announce] OpenVPN 2.7_rc4 released
[Openvpn-announce] OpenVPN 2.7_rc5 released
'