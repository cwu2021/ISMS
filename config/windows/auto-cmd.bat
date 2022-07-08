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
