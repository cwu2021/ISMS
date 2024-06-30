# Management of technical vulnerabilities
## A.12.6.1 of ISO/IEC 27001:2013
## A.12.6.1 of ISO/IEC 27001:2005
<i>Control</i><br>
Information about technical vulnerabilities of information systems being used shall be obtained in a timely fashion, the organization's exposure to such vilnerabilities evaluated and appropriate measures taken to address the associated risk.
## IDS: snortML
 - You will need to create your own model file for doing the detection itself. There is a blog post about the new feature and how to create a model using tools in the repository.
 - https://blog.snort.org/2024/0
## Vulnerability Assessment Scanner
### Runtime Integrity services provide assurance that a system is uncorrupted.
https://www.admin-magazine.com/Archive/2024/81/Detecting-system-compromise
### 個資的善良管理人report sample，反正買愈多就有愈多
https://developers.cloudflare.com/ddos-protection/reference/reports/
### 5款免費、付費弱點掃描工具優缺點分析！
https://www.digicentre.com.tw/industry_detail?id=127
### AFP vulnerability of samba
$ nmap -v -PN -p 548 192.168.* | grep -B 4 open
### Discover vulnerabilities with Google Tsunami
 - https://www.admin-magazine.com/Archive/2023/74/Discover-vulnerabilities-with-Google-Tsunami
### WPScan WordPress security scanner.
<i> https://github.com/wpscanteam/wpscan </i>
 - apt install ruby rubygems ruby2.5-dev
 - gem install wpscan
### Passive Asset Detection System
 - tcpdump -lenx -i fxp0 -s 1500 port bootps or port bootpc | dhcpdump
 - pads -i em3 -n 10.0.0.0/8

PADS can be run as a daemon using the -D switch, in which case output will not be shown. PADS stores its findings comma-separated value format in the file assets.csv. The pads-report program processes the assets.csv file, consolidating what PADS has seen into report format. For example, here is how two services on 10.200.1.28 are reported:

------------------------------------------------------------------ IP: 10.200.1.28 Port Service Application 25 smtp Microsoft Exchange SMTP 6.0.3790.211 (mail.example.com) 80 www Microsoft-IIS 6.0 ------------------------------------------------------------------ PADS is smart enough to resume recording after it has been interrupted as it re-processes existing assets.csv files when restarted. PADS can also be run against packets stored in libpcap format using the -r switch. PADS is beginning to offer support for loading results into a database.

https://manpages.ubuntu.com/manpages/bionic/man8/pads.8.html
## Penetration Testing
### Practical PERL for Security Practitioners
This paper introduces PERL as a useful, flexible, and extensible tool for the security practitioner. References to resources are provided so that the reader may expand their knowledge beyond the concepts presented here. In this paper examples of PERL's ability to process log files, grab banners of...<br>
<i>https://www.giac.org/paper/gsec/3602/practical-perl-security-practitioners/105856</i>
### Conclusion
PERL is one of the more flexible tools that a security practitioner can learn. This paper has given a few examples of the power that PERL provides. PERL's extensibility allows a security practitioner to utilize a significant code base to rapidly solve problems that the security practitioner faces on a regular basis. PERL can help one create a quick solution to a smaller sized security problem, or can scale to a large security application that necessitates object oriented architecture.
### stress and benchmarking from the command line
 - sudo apt-get install siege -y
 - https://www.admin-magazine.com/Archive/2022/72/Load-test-your-website-with-Siege
### Jail and Monitor Your Applications
strace and firejail http://www.linux-magazine.com/Issues/2024/281/strace-and-Firejail