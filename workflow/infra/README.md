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
## Supported operating systems, including different Mac.
 - https://community.teamviewer.com/English/kb/articles/24141-supported-operating-systems
 - https://community.teamviewer.com/English/kb/articles/24141-which-operating-systems-are-supported

## SSH reverse tunnel
 - https://superuser.com/questions/1046231/how-to-get-a-persistent-reverse-ssh-tunnel-using-autossh
 - apt install autossh
 - autossh -M 20000 -N -i /home/rspi/.ssh/id_rsa ksproxy@37.xxx.yyy.zzz
 - ssh rspi@localhost -p 20000
 - building old SSH may require older SSL library.

## Thin client solution based on OpenBSD
http://undeadly.org/cgi?action=article;sid=20121026064602

## How can I make VNC faster?
https://help.realvnc.com/hc/en-us/articles/360002321097-What-can-I-do-to-boost-picture-quality-or-performance-
https://superuser.com/questions/15337/how-can-i-make-vnc-faster <br>
https://community.teamviewer.com/English/discussion/97953/remote-access-license-question-about-how-this-work-faq <br>
https://community.teamviewer.com/English/kb/articles/53579-activate-your-remote-access-license#toc-hId-1616501486 <br>
This is typically a trade-off, since reducing picture quality is likely to boost performance, and vice versa.

Patented algorithms automatically adapt picture quality to network speed, so you may already have the optimal setting. But you can tweak the Picture quality dropdown in the VNC Viewer Properties dialog for a particular connection if you wish.

Theres a similar setting available from the VNC Viewer toolbar on your tablet or phone.

<b> p.s. 8-color runs real fast on old vncviewer. and TeamViewer offers remote worker license of NT$488/mo with balanced quality and speed. </b>

### 全球有逾8,000臺沒有密碼保護的VNC曝露於網路上
<i>https://www.ithome.com.tw/news/152510</i><br>
Cyble之所以特別提出警告，是因為他們在最近發現VNC已成為駭客鎖定及掃描的對象，在曝露於公開網路上的VNC實例中，中國與瑞典都占了超過1,500個，美國則有超過800個，西班牙與巴西也都超過500個，而且這些缺乏密碼保護的，不乏隸屬於重大基礎設施的VNC實例，像是水處理廠、製造工廠或研究中心等。

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

- Microsoft Remote Desktop Beta https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-mac

- Other proprietary remote access services may use similar techniques but are undocumented. Remote access services do have the benefit of being able to punch through firewalls easier than direct remote access, they are usually easier to configure and have better support for encryption.

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
#### ** client > 2.5 drops BF-CBC support. (Jun 11, 2022)
<i># This config item must be copied to the client config file as well.</i><br>
cipher AES-128-CBC   # AES <br>
https://community.openvpn.net/openvpn/wiki/CipherNegotiation
#### OpenVPN-2.5.7 configure: error: lzo enabled but missing
<i> GnuPG Public Key https://openvpn.net/community-resources/sig/ </i><br>
https://forums.freebsd.org/threads/openvpn-2-5-7-configure-error-lzo-enabled-but-missing.87045/ <br>
cd /usr/include && ln -s ../local/include/lzo . <br>
cd /usr/lib && ln -s ../local/lib/liblzo2.* . <br>
#### Is a TCP port needed or can I open only 1194 for UDP
<i>https://forums.openvpn.net/viewtopic.php?f=24&t=29289</i><br>
By default the OpenVPN Connect client installer file comes prebundled with a server-locked profile. There is no option setting to change this.
#### IKEv2 OpenBSD VPN
- L2TP on iPhone https://www.dlinktw.com.tw/techsupport/FAQView.aspx?f=FDy1hSRKIRFIS5t0rzf9RQ%3D%3D
<i>https://www.openbsd.org/faq/faq17.html</i><br>
 The ikectl(8) utility also allows you to maintain a simple X.509 certificate authority (CA) for IKEv2 peers.

An IKEv1 server (isakmpd(8)) is also available and, coupled with npppd(8), it allows you to build an IKEv1/L2TP VPN where IKEv2 can't be deployed.

Native WireGuard support is also available via the wg(4) device. As the manual explains, it can be configured the same way as all other network interfaces in OpenBSD. 
#### MFA for AWS , VIP
 - https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_mfa_lost-or-broken.html
 - using another MFA device registered
 - AWS Client VPN https://aws.amazon.com/vpn/client-vpn/
 - https://www.techtarget.com/searchsecurity/feature/Multifactor-authentication-products-Symantec-Validation-and-ID-Protection-Service
 - Security best practices for administrator accounts https://support.google.com/cloudidentity/answer/9011373?hl=en
#### 2FA VPNs https://marc.info/?l=openbsd-misc&m=166794348111746&w=2
Thought I'd follow up on this with my thoughts after considering the
various suggestions (thanks all).

iked with EAP-MSCHAPv2 *and* RSA certificates:

This was suggested off-list, at least strongswan clearly supports it,
and it's likely that other clients do too, but if there is a way to have
iked require both cert and EAP auths I don't see anything in the docs
showing how to configure it.

authpf:

This might just work for these non-techy users if it was only Windows
machines where I could preconfigure a nice shortcut, but it's just going
to be too much of a juggle to have them auth on an iOS/Android ssh
client as well as connect VPN.

L2TP/IPsec (npppd) and auth via RADIUS:

Presumably TOTP would be the way to do MFA here, probably glommed onto a
password, but I'm not sure all clients will support auth protocols that
send the actual password over the wire to be able to do this
(CHAP/MSCHAP won't work as they require both sides to have knowledge of
the string used as password). Also L2TP/IPsec is not something I really
want to return to having already got rid of it once :)

OpenVPN with bsd-auth and login_totp:

If I went for OpenVPN I'd really not want to use system users, though
it's easy enough to hack something together with OpenVPN's auth scripts.
That's a bit of a fallback option I think.

Wireguard:

I like this for some things, but without some layer on top to do
config/auth there's a lot of setup needed on each client. And unless
combined with authpf (see above) or in whatever layer on top,
there's no way to verify that a second factor was used.

Let's Connect/EduVPN:

This is what I'm going to look at in more detail next, and it has the
advantage over anything IPsec-based in that it should be possible to
move across gradually on the same gateway and turn off the old setup
when done. As a configure layer on top of wireguard/openvpn and with
packaged clients it's quite appealing. Let's see...

#### Best Truth Social VPNs
- https://www.vpnfan.com/blog/truth-social-vpn/ <br>
When you’re choosing a VPN to use with Truth Social, you need to look for specific features. These include:
- A strict no-logs policy – Important to anyone that takes their privacy seriously. You won’t want to connect to a VPN that doesn’t have one. If the service you choose logs your information, that could cause big issues. None of the VPNs in our list keep activity logs.
- Next-generation protocols – Not all VPN protocols are the same. Trustworthy providers offer their users several options. These protocols include ExpressVPN’s Lightway protocol, WireGuard, IKEv2, and OpenVPN. All four of those are in the next-generation class. That means they’ll provide you with the best possible protection. Of those, Lightway and WireGuard are both fast, giving you excellent security and speed.
- The ability to access the U.S. and Canadian markets – Fortunately, all of our VPN options can do this. Protecting yourself isn’t helpful if you can’t access the U.S. and Canadian markets to be able to get the app.
- [討論] 即將到中國前想VPN該做什麼準備? - 看板 WorkinChina https://www.ptt.cc/bbs/WorkinChina/M.1673321336.A.369.html
#### Proxy and VPN defined https://nordvpn.com/zh-tw/blog/vpn-vs-proxy/
- A VPN and a proxy are online services that hide your IP address by rerouting your internet traffic through a remote server. But a proxy works only with a single app or service, while a VPN secures all your internet traffic and encrypts it for extra security and privacy.
#### Surfshark no longer offers Shadowsocks
https://surfshark.com/blog/surfshark-will-stop-supporting-shadowsocks
 - Socks5 VPN: What It Is & Why PIA Is the Best
<br> https://www.privateinternetaccess.com/blog/socks5-vpn/
<br> https://canonical.com/blog/setup-your-own-vpn-server
<br> https://github.com/shadowsocks/shadowsocks-libev/issues/2324
#### VPN and regional blocking
Fw: [討論] 資安報告：全球近三成VPN龍頭公司為中資
<br> https://www.ptt.cc/bbs/MobileComm/M.1563559280.A.21B.html
<br> [閒聊] 關於付費VPN的選擇
<br> https://www.ptt.cc/bbs/KanColle/M.1604075481.A.58F.html
<br> [討論] 業配很大強調跨區看片的VPN 算詐騙嗎
<br> https://www.ptt.cc/bbs/MobileComm/M.1678172683.A.035.html
<br> Re: [討論] 上海 astrill 掛了
<br> https://www.ptt.cc/bbs/WorkinChina/M.1458264651.A.E70.html
<br> [攻略] 給求職中、新上任提督的導航文 2代
<br> https://www.ptt.cc/man/KanColle/DDA/D2DB/M.1491329690.A.F26.html
<br> [問題] 日本遊戲鎖區的用意到底是什麼？
<br> https://disp.cc/b/ACG/aQ6U
