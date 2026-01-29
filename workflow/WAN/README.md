# Internet Speed Test
 - https://speed.cloudflare.com/
 - speedtest-cli https://askubuntu.com/questions/104755/how-to-check-internet-speed-via-terminal
 - https://check-host.net/
 - MTR: A Network Diagnostic Tool https://linuxhint.com/mtr-a-diagnostic-tool/
 <br> $ mtr -r 1.1.1.1 | awk '{print $1,$3,$4,$5,$6,$7,$8,$9}'
 <br> https://stackoverflow.com/questions/61521927/how-to-awk-multiple-columns-in-bash
 - IDC 700Gbps backbone
是方完善的700G跨國骨幹建置遍布全球各區，提供更便捷、高效、多選擇、備援的雲端與網路匯集環境，今年除了加強「三環三線」網路布建、推出SD-WAN（軟體定義廣域網路）、與國際合作夥伴打造的全球Bare Metal Cloud裸機雲服務也即將上線，能更快速、有效的替企業解決跨境連線的問題，且享有更高階的雲端應用服務效能和網路安全性，支援客戶全球化的營運布局。
如何撐起企業全球版圖？SD-WAN + Cloud WAF：跨國營運的「輕裝上陣」新策略
 - Hinet 光世代無備援機制，電路規劃與環路保護；頻寬使用次優先權，且國內接取有集縮設計。
https://fttb.hinet.net/compare.html
 - https://blogs.arista.com/blog/next-generation-sd-wan-in-the-ai-era
# AWS Public IPv4 Address Charge: $0.005/hr
 - https://aws.amazon.com/tw/blogs/aws/new-aws-public-ipv4-address-charge-public-ip-insights/
 - https://aws.amazon.com/tw/about-aws/whats-new/2023/07/aws-public-ip-insights-vpc-ip-address-manager/
 - https://aws.amazon.com/tw/blogs/networking-and-content-delivery/identify-and-optimize-public-ipv4-address-usage-on-aws/
 - Accelerate AWS Access with Arista https://blogs.arista.com/blog/aws-cloud-wan
 - CloudVision: The critical role of comprehensive network data and Arista's NetDL™ (Network Data Lake)
# 5G Technology
 - Test your 5G, 4G and WiFi connection with our top 12 apps | 5Gradar <br>
https://www.5gradar.com/features/test-your-5g-connection-with-our-top-apps<br>
https://github.com/calee0219/awesome-5g
 - NCC公布5G電波人口涵蓋率已達94.36% !? <br>
https://www.kocpc.com.tw/archives/440835
 - Turn Your Cell Phone Into A Satellite Phone | Iridium Satellite Communications <br>
https://www.iridium.com/blog/2022/05/11/how-to-turn-your-cell-phone-into-a-satellite-phone/
 - TACC台灣資料分析中心 <br>
https://tacc.cwb.gov.tw/v2/
 - iPhone 14 Will Have Satellite Connectivity. How Exactly It Will Work <br>
https://www.universetoday.com/157474/iphone-14-will-have-satellite-connectivity-how-exactly-it-will-work/
Globalstar is operating a constellation of 48 satellites in LEO at 1414 km altitude. They are placed in eight orbital planes of six satellites, each with an inclination of 52°. This means they can provide service on Earth from 70° North latitude to 70° South latitude. Meaning the iPhone 14 satellite connectivity won’t work in polar regions.<br>
 - Mumble uses CELT, and using the highest quality and lowest latency, the peak bandwidth is 134kbit/s per speaker per listener (with IP and UDP overhead). However, this is the max bandwidth, and the recommended bandwidth (that has a very unnoticeable quality reduction for normal speech) is 63kbit/s. https://wiki.mumble.info/wiki/Commercial_Hosting
 - However, Mumble 1.5 dropped support of CELT. Thus CELT users need version 1.4. 
 - 蜂巢式網路（如 4G/5G）功耗過高，而短距離無線技術（如 Wi-Fi、藍牙）的覆蓋範圍又極其有限，LPWAN 正是為了填補此間的技術空白而生。 https://www.ultrontek.com/news_detail/comprehensive-nb-iot-analysis 中華電信智慧水表方案整合雙模通訊與遠端管理，助企業打造高效節水場域 https://www.chttl.com.tw/_news/news-513.html
## 電話裝太多支，響一聲就會自動斷掉? 
 - 一般不用給電的便宜話機,是直接吃電話LINE給的電,平常LINE約12V,當響鈴時是高於45Vrms
<br> https://m.mobile01.com/topicdetail.php?f=168&t=3258900
<br> https://my.cht.com.tw/Trouble
# modern DSL issue
 - LCP keepalive timeout mentioned in ../infra/openbsd-pppoe.sh
 - long dialup time for edimax/HN . Windows 11 光世代連線錯誤691
 - Thus dialup directly via modem then NAT clients with dhcp may be best practice.
 - timeout could also be seen when having modem/landline issues.
<br> https://answers.microsoft.com/zh-hant/windows/forum/all/windows-10/e94f1054-c06e-47c8-887a-6b68560901d0
# Dynamic routing of friends' networks at home using BGP privately : building Intranets.
http://blog.jpauli.tech/dynamic-routing-of-friends-networks-at-home-using-bgp-privately/
# Why BGP is used over OSPF?
- If you would be conducting internal routing, as the routing within a site, company, or campus, you would be willing to use OSPF. BGP would be typically needed at a site edge, where you would be a route out to the public internet. If you are looking at building in-site with multiple homes, you would have to consider wishing to consider BGP.
https://medium.com/@xiaotonghu/why-bgp-is-used-over-ospf-5830e367650b <br>
http://blog.jpauli.tech/dynamic-routing-of-friends-networks-at-home-using-bgp-privately/
 - BGP (Border Gateway Protocol) hijacking and a route leak https://blog.cloudflare.com/cloudflare-1111-incident-on-june-27-2024
# RealTek晶片爆零點擊RCE漏洞
SIP ALG是使網路封包由公有網路進入私有網路的NAT穿透技術。在此過程中路由器的SIP ALG模組會呼叫strcpy函式將SIP封包內容複製到預先定義的固定緩衝。最新漏洞主因出在廠商對這網路功能安全實作不當，使網路設備的緩衝對複製內容的長度檢查不足。駭客可以改造SIP封包內的SDP資料引數或SIP標頭，利用WAN介面傳送到路由器開採漏洞。成功的開採可造成緩衝溢位，引發裝置崩潰或遠端程式碼執行。https://www.ithome.com.tw/news/152508 
# DDoS integrated defense
About NT$ 3500-4000 per month, provided by ISP.
# Starlink Technology and Protocol
<i>https://dashboard.satnogs.org/d/UXoGX0OGk/iss-monitor?orgId=1&refresh=1m</i><br>
ISS Monitor - Grafana
<i>https://www.starlink.com/technology</i><br>
Most satellite internet services come from single geostationary satellites that orbit the planet at 35,786 km. As a result, the round trip data time between the user and satellite—also known as latency—is high, making it nearly impossible to support streaming, online gaming, video calls or other high data rate activities.

Starlink is a constellation of thousands of satellites that orbit the planet much closer to Earth, at about 550km, and cover the entire globe. Because Starlink satellites are in a low orbit, latency is significantly lower—around 20 ms vs 600+ ms.

<i>https://www.tvunetworks.com/doc/TVU_Transceiver_3200.pdf</i><br>
Each TVU receiver can utilize up to 20mbps of downstream bandwidth per live Pack feed. - A minimum of 2mbps upstream bandwidth per Receiver is required for all features to function efficiently.

<i>https://www.starlink.com/business</i><br>
Starlink Business users can expect download speeds of up to 350 Mbps and latency of 20-40ms, enabling high throughput connectivity for offices of up to 20 users, storefronts, and demanding workloads across the globe.

<i>https://www.igf.org.tw/?page_id=8016</i><br>

論壇時間： 9/27(二) & 9/28(三) 09:00~17:00

Day 2 morning presentation.

 - Spectral regrowth: The decrease in signal level is caused by TX power decrease due to signal regrowth... https://itso.int/wp-content/uploads/2018/04/Presentation-by-Intelsat.pdf
 - 日凌，是在春分和秋分太陽穿過地球赤道上空的現象。當此現象發生時，太陽電磁輻射會對地球同步衛星的通訊造成影響，因為地球同步衛星只能定點在赤道上空。受到電磁輻射的影響，透過衛星轉播的電視訊號會受到干擾，令訊號不能接收而出現黑屏，又或訊號受干擾而出現雪花。

# 中共國網與千帆星座計畫
為了能先占得衛星軌位和通訊頻譜，中共搶在2020年11月「國際電信聯盟」（ITU）祕書長仍由中國人出任期間，向ITU提出以12,992顆衛星組網的「GW星座」（「國網Guo-Wang」）計劃。中共計劃發射的衛星數量僅次於美國，居世界第二位。https://www.epochtimes.com/b5/24/6/6/n14265460.htm

中國在 5G、自動化、監控技術與極音速武器上急速超前，美軍卻逐漸與矽谷分道揚鑣，陷入落後。隨著全球地緣風險升高、區域衝突不斷，五角大廈不得不面對殘酷現實：一旦與中國開戰，美國可能居於劣勢、甚至戰敗！扭轉局勢的關鍵，竟是一支被派駐到矽谷廢棄海軍基地、預算被歸零的實驗團隊：X 小組（Unit X）。他們只有一個任務，就是把矽谷的速度與技術導入華府國防體系。