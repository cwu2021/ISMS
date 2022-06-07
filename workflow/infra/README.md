# SDN (control/data) -> NFV -> vxlan.
## Mininet is also a great way to develop, share, and experiment with Software-Defined Networking (SDN) systems using OpenFlow and P4.
http://mininet.org/download/#option-3-installation-from-packages
## OpenBSD has its own OpenFlow 1.3 SDN stack since 6.1
https://www.openbsd.org/papers/bsdcan2018-mininet.pdf <br>
https://www.openbsd.org/papers/asiabsdcon2018-mininet-paper.pdf <br>
https://youtube.com/watch?v=u-E8emCBGXI&feature=share
- switch(4): datapath
- switchd(8): controller
- switchctl(8): control application for switchd(8)
## Set OpenFlow flows based on Proxmox VM configuration.
https://github.com/crisvp/pve-to-ofctl
# Remote Access
## TeamViewer QS for acess to fix Filezilla 'not find resource'.
https://forum.filezilla-project.org/viewtopic.php?t=6234 <br>
In the program dir of Filezilla, is there a folder called 'resources'? You don't need DOS for the command line parameters. Simply edit the shortcut in the start menu and add the parameter after the executable name (+a blank) in the 'Target' field.

## How can I make VNC faster?
https://help.realvnc.com/hc/en-us/articles/360002321097-What-can-I-do-to-boost-picture-quality-or-performance-
https://superuser.com/questions/15337/how-can-i-make-vnc-faster <br>
https://community.teamviewer.com/English/discussion/97953/remote-access-license-question-about-how-this-work-faq <br>
https://community.teamviewer.com/English/kb/articles/53579-activate-your-remote-access-license#toc-hId-1616501486 <br>
This is typically a trade-off, since reducing picture quality is likely to boost performance, and vice versa.

Patented algorithms automatically adapt picture quality to network speed, so you may already have the optimal setting. But you can tweak the Picture quality dropdown in the VNC Viewer Properties dialog for a particular connection if you wish.

Theres a similar setting available from the VNC Viewer toolbar on your tablet or phone.

<b> p.s. 8-color runs real fast on old vncviewer. and TeamViewer offers remote worker license of NT$488/mo with balanced quality and speed. </b>

### LAN-only TeamViewer via VPN also works.
- It requires no Internet connection, listening on port 5938.
- Go into the TeamViewer application and click the Gear icon (⚙) in the upper right corner of the TeamViewer application. Navigate to General --> Incoming LAN Connections --> change to either Accept or Accept exclusively.
https://community.teamviewer.com/English/kb/articles/4618-use-teamviewer-in-lan

VNC has some limitations inherent in the protocol it uses. RFB, remote framebuffer, works by transmitting rectangles of pixels over a network. The higher the resolution and bit depth the more bandwidth required to send updates. There
are a few optimizations VNC servers/clients already do:

- Only send changed regions, caching unchanged regions on the client.
- Copying cached regions on the client when changes do occur.
- Various forms of lossless and lossy compression
- You can fiddle with the settings on both the client and server to see which settings work best for your internet connection. Any client can connect to any server because they negotiate to determine which protocol features both support but its best to use a client and server from the same company if you want to
use more advanced protocol features.

RDP and X protocols transmit drawing instructions instead of patches of pixels. This is why under some conditions they are superior to VNC.

Other proprietary remote access services may use similar techniques but are undocumented. Remote access services do have the benefit of being able to punch through firewalls easier than direct remote access, they are usually easier to configure and have better support for encryption.

I've used VNC, Remote Desktop, LogMeIn Free, PCAnywhere and remote X. Each has its merits:

VNC actually performs better than the other protocols over extremely limited bitrates. (Think dialup connection) And it works on virtually any platform.
Remote Desktop works well over LANs and integrates seamlessly with ActiveDirectory.
LogMeIn is great for accessing Windows PC over the internet and also supports
ActiveDirectory integration. It has ActiveX, Java, Firefox extensions and even an HTML based client. The free version allows you to manage up to 5 PCs. Paid versions increase this number, add file transfer and advance management features.

PCAnywhere is similar to VNC and Remote Desktop. It supports various levels of encryption, file transfers and remote configuration. Things you'd have to piece together with VNC and Remote Desktop.
X is the Unix world's equivalent of Remote Desktop. To be fair, it's been around a lot longer than any of the other protocols. It works great over a LAN but is too chatty over the internet. Several projects have attempted to improve this with varying levels of success. NoMachine NX, mentioned already, is one such project.
All of the remote access protocols I've mentioned are freely available (either with an OS or as a download) except PcAnywhere, which is sold by Symantec.

Personally I would try each of them and select the one that best suites your needs.

### OpenVPN server in 5 minutes on Ubuntu
https://www.cyberciti.biz/faq/howto-setup-openvpn-server-on-ubuntu-linux-14-04-or-16-04-lts/ <br>
https://github.com/Nyr/openvpn-install <br>
$ sudo bash openvpn-install.sh

Looks like OpenVPN is already installed

What do you want to do?
   1) Add a cert for a new user
   2) Revoke existing user cert
   3) Remove OpenVPN
   4) Exit
