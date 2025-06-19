# UniFi Network Application 8.0.7
https://community.ui.com/releases/UniFi-Network-Application-8-0-7/7818b9df-4845-4c82-ba3c-1218e61010d4
 - devices need reset for re-adoption.
 - consoles cannot downlinked to each other. direct via wired or wifi is required for WAN config.
 - direct access design: inf alias with RFC 1918 https://datatracker.ietf.org/doc/html/rfc1918
 - PING and TRACEROUTE from within the UDM? : r/UNIFI https://www.reddit.com/r/UNIFI/comments/1ctbxyw/ping_and_traceroute_from_within_the_udm/?rdt=56611
 - The Tactical RMM open source tool offers a combination of remote monitoring and management with agents. https://www.admin-magazine.com/Archive/2025/86/Remote-access-with-Tactical-RMM

# nagios-plugins
https://github.com/nagios-plugins/nagios-plugins

You can check for the latest plugins at:

https://www.nagios-plugins.org/
Send an email to help@nagios-plugins.org for assistance. Please include the OS type and version that you are using. Also, run the plugin with the -vvv option and provide the resulting version information. Of course, there may be additional diagnostic information required as well. Use good judgment.

Send an email to devel@nagios-plugins.org for developer discussions.

For patch submissions and bug reports, please use the appropriate resources at:

https://github.com/nagios-plugins

# local system checks
checks from local commands, iDrac output, cooling detection ,etc.

# utilities for notification
sip call, mailer, etc.
## Forwarding mail to multiple recipients
table nw "/etc/mail/ntdtw.table" <br>
action nw-forward forward-only virtual \<nw\> <br>
match from any for domain "ntd.bz" action nw-forward <br>
https://github.com/OpenSMTPD/OpenSMTPD/wiki/Forwarding-mail-to-multiple-recipients <br>
 /etc/opensmtpd/lists.table: <br>
 postmaster admins <br>
 admins kevin.flynn@encom.com, alan.bradley@encom.com <br>
 programs tron@grid.org, clue@grid.org <br> 
 isos quorra@grid.org <br>
## How to send mail from the command line?
<i>https://askubuntu.com/questions/12917/how-to-send-mail-from-the-command-line</i><br>
### High Priority Mail using mailx - Stack Overflow
<i> https://stackoverflow.com/questions/42830968/high-priority-mail-using-mailx </i> <br>
sudo apt-get install mailutils <br>
echo "test message" | mailx -s 'test subject' myemail@mydomain.com
 - sudo apt install mtr
 - mtr -r | mail -s 'mtr report' myemail@mydomain.com
### smtpd remove all queue
 - https://github.com/OpenSMTPD/OpenSMTPD/issues/793
 - smtpctl show queue
 - smtpctl remove all

