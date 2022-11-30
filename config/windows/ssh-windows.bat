@echo off
REM Microsoft Announces Support for SSH https://undeadly.org/cgi?action=article;sid=20150603090420
REM Windows+R to run, +S to search.
PowerShell
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Start-Service sshd
REM  Internet connection required to fetch Windows Update. (Error 0x8024402c)
REM https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse
REM Cygwin also works on win10. 'binmode ntsec' for service value. finally mkpasswd for mapping local account. (Sep 21, 2021)
ssh-host-config
REM cmdlets for powershell management.
get-computerinfo
REM https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/?view=powershell-7.3
REM Powershell for Sysadmins: A Hands-On Guide to Automating Your Workflow
REM https://www.tenlong.com.tw/products/9789865026677?list_name=srh
