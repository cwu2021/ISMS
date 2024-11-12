@echo off
REM https://blog.hmes.kh.edu.tw/wordpress/wang1126/2021/05/05/%E8%A8%AD%E5%AE%9A-windows-10%E8%87%AA%E5%8B%95%E7%99%BB%E5%85%A5/
REM auto login
netplwiz
REM auto screensaveer, then setup screen off after minutes.
C:\Windows\System32\ssText3d.scr
REM auto screen off. network may be off too.
REM https://nircmd.nirsoft.net/monitor.html
REM https://www.quora.com/How-can-I-turn-off-display-in-Windows-from-command-line	
.\nircmd.exe monitor off
REM or via scheduled tasks
schtasks
REM attributes - How can I add NTFS metadata to any file? - Stack Overflow
REM https://stackoverflow.com/questions/63701814/how-can-i-add-ntfs-metadata-to-any-file
REM Windows NTFS Streams | Hostwinds https://www.hostwinds.com/blog/windows-ntfs-alternate-data-streams
REM NTFS Filesystem: Alternate Data Stream (ADS) | by David Varghese | InfoSec Write-ups REMhttps://infosecwriteups.com/ntfs-filesystem-alternate-data-stream-ads-c0e4a2402563
REM Finding and reading alternate data streams (ADS) with PowerShell on an NTFS partition · GitHub https://gist.github.com/chriselgee/bf41951d0b51d0ef9d2504a36921cd13
REM How do I read Windows NTFS's Alternate Data Stream using Java's IO? - Stack Overflow https://stackoverflow.com/questions/33085253/how-do-i-read-windows-ntfss-alternate-data-stream-using-javas-io
REM Map a network drive in Windows - Microsoft Support
REM https://support.microsoft.com/en-us/windows/map-a-network-drive-in-windows-29ce55d1-34e3-a7e2-4801-131475f9557d
net use s: \\tower\movies /user:HTG CrazyFourHorseMen
REM https://www.howtogeek.com/118452/how-to-map-network-drives-from-the-command-prompt-in-windows/
REM (SMB1 for older host may need to be enabled in Windows feature)
