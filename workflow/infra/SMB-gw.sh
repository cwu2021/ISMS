#!/bin/bash
# scan for older SMB shares.
smbclient -U $myuser -W $mydomain -L $myserver
# mount shares with then serve as SMB gateway.
#mount.cifs ... -o vers=1.0,...
mount.cifs //<ip>/<share> /<mount> -i user=<username>,pass=<password>,iocharset=utf8,rw
:'
No, assigning a public IPv6 address to your Windows machine via DHCPv6 does not automatically make your shared folders publicly accessible. Public IP addresses are assigned to your router or network gateway, not individual devices on your private network. Your shared folders remain protected by your firewall and network security settings unless you specifically configure them for remote access, which involves port forwarding on your router and appropriate Windows sharing permissions. 

AI 摘要+20
To perform IPv6 "port forwarding," you need to create a firewall rule on your router to allow incoming connections for a specific protocol and port to a particular device on your network, rather than using NAT-based port forwarding. This involves configuring the router's firewall to permit traffic to the globally routable IPv6 address of the target host, as every device in IPv6 typically has a public address and no address translation is needed. 

'
# read only, guest options set in /etc/samba/smb.conf.
# https://askubuntu.com/questions/867243/what-is-warning-syslog-option-is-deprecated
# https://forums.centos.org/viewtopic.php?t=58013
# syslog = 0 in [global] to disable logging, e.g. printer errs 
:'
net statistics workstation to check uptime of Windows
Q: why does windows share open slow?
Network Bottlenecks: This is the most common cause. A slow or congested network connection (e.g., poor Wi-Fi signal, a bad cable, or a busy network switch) can severely impact how quickly files and folders are displayed.

System and File Attributes: Windows Explorer looks for special attributes and files, such as desktop.ini, which can cause a significant delay when browsing folders with thousands of items. The "System" attribute on a folder can also trigger a similar slowdown.

Antivirus and Security Software: Antivirus programs often scan network files when you access them, which can add a considerable delay.

Incorrect DNS or NetBIOS Configuration: If your system has trouble resolving hostnames, it can cause timeouts and delays when trying to connect to a shared folder. Disabling IPv6 or resetting the TCP/IP stack has resolved this for some users.

Windows Client Caching: Windows uses client-side caches to speed up access to shared files, but sometimes these caches can cause issues. Registry changes to values like DirectoryCacheLifetime or FileInfoCacheLifetime are often suggested as a solution, though this should be done with caution.
'
