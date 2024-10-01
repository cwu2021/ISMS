# Zero Trust Model
## ACL can help achieve its 'less priviledge' policy.
\# chkconfig iptables --list
## PPTP VPN Protocol in 2023  
- https://www.cyberghostvpn.com/en_US/privacyhub/pptp-vpn/
- Install a PPTP client in Ubuntu https://gist.github.com/toshas/d23ce954801563fb69e9a693819accf8
## Share A Folder Between Ubuntu/Linux and Windows
https://www.debugpoint.com/guide-how-share-folder-between-ubuntu-linux-windows/ <br>
https://askubuntu.com/questions/88108/samba-share-read-only-for-guests-read-write-for-authenticated-users <br>
 - chmod 755 ~/shareFolder
## Windows防火牆進階設定的輸出規則
 - https://kheresy.wordpress.com/2019/01/10/windows-firewall-setting-only-aloow-some-ip-connect/
## Windows防火牆進階設定的輸入規則
 - ICMPv4, 445 tcp should be allowed to any for SMB accross LANs.
## Add User to Sudoers
 - usermod -aG wheel UserName , then visudo find 'tom ALL=(ALL) NOPASSWD:ALL'
 - https://phoenixnap.com/kb/how-to-create-add-sudo-user-centos#ftoc-heading-5
 - https://www.cyberciti.biz/faq/linux-unix-running-sudo-command-without-a-password/
### Lockout users 
 - usermod -L $USERNAME
 - usermod -U # https://www.learnitguide.net/2016/08/how-to-lock-and-unlock-user-account-in.html
 - usermod --expiredate 1 $USERNAME
## SELinux as additional protection
 - setenforce Permissive | Enforcing
 - vi /etc/selinux/config
## using ACLs to assign specific permissions
 - https://www.redhat.com/sysadmin/access-control-lists
 - setfacl --modify user1:rw sample
