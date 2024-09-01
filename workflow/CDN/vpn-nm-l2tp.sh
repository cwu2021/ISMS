# https://askubuntu.com/questions/1167283/l2tp-connection-client-on-ubuntu-18-04-server
sudo apt install network-manager
sudo apt install network-manager-l2tp
sudo systemctl status dbus.service 
# https://askubuntu.com/questions/207936/what-program-starts-dbus-daemon
sudo nmcli connection add connection.id [vpnName] con-name [vpnName] type VPN vpn-type l2tp ifname -- connection.autoconnect no ipv4.method auto vpn.data "gateway = [ipv4], ipsec-enabled = yes, mru = 1400, mtu = 1400, password-flags = 0, refuse-chap = yes, refuse-mschap = yes, refuse-pap = yes, require-mppe = yes, user = [user]" vpn.secrets "password=[user-password], ipsec-psk = [PSK]"
sudo nmcli c up [vpnName]
# https://www.cyberciti.biz/faq/change-netplan-renderer-from-networkd-to-networkmanager/

# https://gist.github.com/pastleo/aa3a9524664864c505d637b771d079c9
# https://stackoverflow.com/questions/38855933/not-authorized-to-control-networking-from-cron
# https://bbs.archlinux.org/viewtopic.php?id=252367
# https://github.com/KaOSx/apps/issues/97
# https://bbs.archlinux.org/viewtopic.php?id=252367
# https://askubuntu.com/questions/1167283/l2tp-connection-client-on-ubuntu-18-04-server
