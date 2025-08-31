# GeoIP resources
https://dev.maxmind.com/geoip/legacy/databases?lang=en <br>
https://github.com/icyrockcom/country-capitals/blob/master/data/country-list.csv <br>
https://github.com/MatthewClarkMay/geoip-attack-map <br>
https://lab.lmnixon.org/cgi-sys/suspendedpage.cgi <br>
https://github.com/lutangar/cities.json <br>
https://github.com/maxmind/GeoIP2-python <br>
https://github.com/P3TERX/GeoLite.mmdb
## 數據看2022台灣旅遊產業（四）：觀察社群趨勢，討論度最高與關鍵字熱搜的是什麼？
 - https://www.thenewslens.com/article/179958
 - Google Trends："旅遊"、"機票"關鍵字
 - Google Cloud Summit Taipei 2025 https://cloudonair.withgoogle.com/events/summit-taipei-2025
 - https://lndata-taiwan.medium.com/%E7%96%AB%E5%BE%8C%E6%97%85%E9%81%8A%E8%B3%87%E8%A8%8A%E7%80%8F%E8%A6%BD%E8%88%87%E7%A4%BE%E7%BE%A4%E8%B6%A8%E5%8B%A2-5f85b96608a8
### 全球趨勢資訊圖集：5大面向、160張精緻彩圖，掌握當代必備世界觀 
 - Atlas of the invisible
 - better data visualizations 
 - https://www.kobo.com/tw/zh/ebook/xej6w_y0CjW_MMpwFVQjVw 
 - global atlas visualization : image search
 - 庫德族 - 維基百科 https://zh.wikipedia.org/zh-tw/库尔德人
## 依NCC官方資料來進行估算：有線廣播電視訂戶數(依集團) 
https://www.ncc.gov.tw/chinese/news.aspx?site_content_sn=2989
小結：每家用戶數都衰退，衰退率前三依序是新彰(-13.98%)，澎湖(-3.12%)，三大(-2.22%)。而以衰退率*月費來試算，北都/天外天/聯維三家都有降價的合理性。另外看每戶價格，寶福一戶四塊多，比其他平均一塊多要高。澎湖收視戶相比去年同季少了約3-4%，如果是兩年約的話，兩年收視戶衰退約5-6%，每個月抓-3%也是合理的：用線性衰退算 （-6%x24月/2)/24=-3%。還有可以砍的是單一收視戶價值。目前一戶約1.5塊，但現在觀眾看電視的時數減少了，每砍0.1塊，每月少約$1500，這樣砍是比較兇。
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
