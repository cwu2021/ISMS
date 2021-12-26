## Event log
Event ID 95: uncorrectable medium error<br>
https://ithelp.ithome.com.tw/m/questions/10194900 <br>
這是 RAID Controller 在作定期讀取巡查 (Patrol read) 時, 發現你的磁碟出現: 無法被修正的讀取錯誤, 通常這代表該硬碟已經快要出現故障了 (但是還有沒真正到硬體故障的階段, 所以 VD 仍然正常沒有 Degrade), 這是一個提前預警的軟故障 (Soft failure), 你最好提前換掉該顆硬碟, 避免他臨時突然發生無法挽救的硬故障 (Hard failure)....
## Event IDs to monitor
When it comes to Windows log collection, one of the most challenging tasks of a system administrator is deciding which event IDs to monitor. Due to the large number of event IDs in use, this can be daunting at first sight. Therefore, this section aims to provide guidance about selecting event IDs to monitor, with some example configurations. <br>
https://nxlog.co/documentation/nxlog-user-guide/eventlog-eventids.html
## IDS
https://github.com/John-Lin/snort-base/tree/master/mysnortrules/rules <br>
alert icmp any any -> any any (msg:"Pinging...";sid:1000004;) <br>
alert tcp any 6667 -> any any (msg:"C&C Server sent netinfo command";content:"!netinfo";sid:1000006;) <br>
alert tcp any 6667 -> any any (msg:"C&C Server sent sysinfo command";content:"!sysinfo";sid:1000007;) <br>
alert tcp any 6667 -> any any (msg:"C&C Server sent port scan command";content:"!scan";sid:1000008;) <br>
alert tcp any 6667 -> any any (msg:"C&C Server sent download command";content:"!download";sid:1000009;) <br>
