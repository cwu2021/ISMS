## Event log
Event ID 95: uncorrectable medium error<br>
https://ithelp.ithome.com.tw/m/questions/10194900 <br>
這是 RAID Controller 在作定期讀取巡查 (Patrol read) 時, 發現你的磁碟出現: 無法被修正的讀取錯誤, 通常這代表該硬碟已經快要出現故障了 (但是還有沒真正到硬體故障的階段, 所以 VD 仍然正常沒有 Degrade), 這是一個提前預警的軟故障 (Soft failure), 你最好提前換掉該顆硬碟, 避免他臨時突然發生無法挽救的硬故障 (Hard failure)....
## Event IDs to monitor
When it comes to Windows log collection, one of the most challenging tasks of a system administrator is deciding which event IDs to monitor. Due to the large number of event IDs in use, this can be daunting at first sight. Therefore, this section aims to provide guidance about selecting event IDs to monitor, with some example configurations. <br>
https://nxlog.co/documentation/nxlog-user-guide/eventlog-eventids.html
