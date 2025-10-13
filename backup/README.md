# Information backup
## A.12.3.1 of ISO/IEC 27001:2013
## A.10.5.1 of ISO/IEC 27001:2005
<i>Control</i><br>
Backup copies of information, software and system images shall be taken and tested regularly in accordance with an agreed backup policy.
## Digital Asset Management
Specified personale should be assigned for listing and backup of the assets.
## 發行資訊： DSM | 群暉科技 Synology Inc.
updates could be schedully checked <br>
https://www.synology.com/zh-tw/releaseNote/DSM 
 - Starting from DSM 7.2, SMB Service supports Auto Block, which only blocks public IP addresses. https://kb.synology.com/en-id/DSM/tutorial/Why_IP_address_blocked_by_smb_service
 - Control Panel > Resource Monitor: Kill Connections
 - Control Panel > Security > Security for DSM browsing sessions: Logout timer
 - MDaemon > Security > Dynamic Screening > Ban Senders that connect more than..
 - MDaemon\app\Forward.dat can be set ro to lock https://help.mdaemon.com/mdaemon/en/ae_forwarding.html
## Review storage use across your organization
 - https://support.google.com/a/answer/12002268?hl=en
 - In the Admin console, go to (left side) Menu and then Storage. Google Workspace for Nonprofits: 100 TB for all End Users.
## Cloudflare R2 storage
 - https://developers.cloudflare.com/r2/pricing/
## 國家情報資源管理院（NIRS）位於韓國大田市（Daejeon）的資料中心，9月26日晚間8時發生火災
 - https://www.ithome.com.tw/voice/171616 原因是人員維護不斷電系統（UPS）時，將鋰電池從5樓伺服器機房搬移到地下室，以便將UPS系統與關鍵基礎架構區隔開來（電池距離伺服器僅60公分），卻不慎引發鋰電池的熱失控反應（thermal runaway）而發生爆炸的狀況，總共燒毀384個鋰電池，花了22小時才撲滅火勢，導致約 70 項政府服務癱瘓，涵蓋銀行與線上郵政營運、身分驗證，以及公共緊急救援服務，設置在此地的647個系統停擺（96個系統直接毀損，551個系統預先關閉），而這些系統占NIRS系統總數的比例，超過三分之一，而且，在事故發生最初72小時內，只有 46 個系統恢復，超過90個系統嚴重受損或無法恢復。到了9月30日上午10時，只有87個系統恢復運作，恢復率為13％，當局預估需要4個星期才能復原。10月4日115個系統恢復，恢復率為17.8％。
 - 值得注意的是，在這96個遭燒毀的系統中，有個大容量、低儲存層級（low-tier）的雲端資料儲存系統G-Drive（Government Drive），多達74個單位、12.5萬名公務員共同使用，每人可儲存30 GB資料，而且，這套系統存放2018年至今的工作相關文件，儲存資料量為858 TB，但令人訝異的是，竟從未備份至外部系統，而無法復原。當局表示，因G-Drive容量過大、儲存系統速度慢而無法備份，其餘95個系統都以線上或離線形式備份資料。

