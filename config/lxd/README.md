## LXD to Proxmox | Proxmox Support Forum
https://forum.proxmox.com/threads/lxd-to-proxmox.68501/ 
## Image server for Incus and LXC
https://images.linuxcontainers.org
### docker and kvm in LXD
 - lxc launch images:ubuntu docker -c security.nesting=true https://discuss.linuxcontainers.org/t/error-when-running-docker-images-in-a-lxc-container/12945/5
 - kvm via SPICE https://discuss.linuxcontainers.org/t/lxd-windows-install-on-remote-server-lxc-console-vmname-type-vga-how-to-see-gui/11800/4
 - do NOT install docker via snap along with lxd! networking err may occur.
 - network DHCP for FreeBSD : rc.conf: ..="DHCP" https://forums.freebsd.org/threads/setting-network-interface-to-dhcp.1797/ 
### screen -d -m not working in lxc container. 
run ffmpeg and kill directly via cron.
### From LXD to Kubernetes
https://faun.pub/containerization-part-2-from-lxd-to-kubernetes-6d595035fbc9
## NAT Gateway with ubuntu 22.04 LXD host
ufw status <br>
ipv4.forward in /etc/sysctl.conf <br>
mount | grep cgroup (cgroup v1 supported via GRUB)
## bypass NET::ERR_CERT_DATE_INVALID with vmc
Firefox ESR on Debian GNU/Linux 11 can bypass NET::ERR_CERT_DATE_INVALID
102.14.0esr (64-bit)
Linux penguin 5.4.163-17364-gfe3d4f499cf1 #1 SMP PREEMPT Mon Dec 13 22:06:42 PST 2021 x86_64 GNU/Linux
crosh> vmc list
termina (8053178368 bytes, min shrinkable size 1048576 bytes, raw)
Total Size (bytes): 8053178368
crosh> vmc stop termina
## Firefox quick keys
 - ctrl-tab to switch tabs.
 - tab to proceed, shift-tan for backwards.
 - window-m then window can then control desktop icons. alt-down for browser menu.