# GeoIP resources
https://dev.maxmind.com/geoip/legacy/databases?lang=en <br>
https://github.com/icyrockcom/country-capitals/blob/master/data/country-list.csv <br>
https://github.com/MatthewClarkMay/geoip-attack-map <br>
https://lab.lmnixon.org/cgi-sys/suspendedpage.cgi <br>
https://github.com/lutangar/cities.json <br>
https://github.com/maxmind/GeoIP2-python <br>
https://github.com/P3TERX/GeoLite.mmdb
## somedomain.com footprinting.
 - eg, EC2 @Japan, cloudflare, godaddy via nslookup, whois, dig.
 - support.somedomain.com : social CRM tagged from social platforms.
## Detect attacks on your network with Maltrail
https://www.linux-magazine.com/Issues/2022/258/Maltrail
## blocked site listing of GFW
https://www.google.com/search?q=why+cnn+not+blocked+by+gfw&source=hp&ei=EywRZJKZMNTR-Qbu_rb4Bw&iflsig=AK50M_UAAAAAZBE6I0rTj_4hwl1z75qTNZNd-okpv93c&ved=0ahUKEwjS7sO28Nz9AhXUaN4KHW6_DX8Q4dUDCAo&uact=5&oq=why+cnn+not+blocked+by+gfw&gs_lcp=Cgdnd3Mtd2l6EANQAFgAYKoEaABwAHgAgAFniAFnkgEDMC4xmAEAoAECoAEB&sclient=gws-wiz

# Block spammers/abusive IPs with Pf-badhost in OpenBSD. A 'must have' security tool!
<i>https://undeadly.org/cgi?action=article;sid=20210119113425</i><br>
You can also configure cron to send an email containing the output from each pf-badhost run, which includes statistics such as number of blocked/added/removed IP addresses as well as list totals for each IP address family. Here's an example pf-badhost statistics report from one of my servers: 620,584,460 IPs! crazy thing!
## PF rules to block out every IP from a given country 
 - https://marc.info/?l=openbsd-misc&m=167043335202280&w=2
 - https://nxdomain.no/~peter/ripe2cidr_country.sh.txt
# Link-local address
https://en.wikipedia.org/wiki/Link-local_address <br>
169.254.0.0/16 
# Amazon SES IP addresses
- https://aws.amazon.com/tw/blogs/messaging-and-targeting/amazon-ses-ip-addresses/
- dig TXT amazonses.com +short| grep 'v=spf1'
