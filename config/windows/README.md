# Windows 11 release information ( 22H2 ~)
https://learn.microsoft.com/en-us/windows/release-health/windows11-release-information <br>
https://blogs.windows.com/windows-insider/2023/10/04/announcing-windows-11-insider-preview-build-23560-dev-channel/
## USB boot
 - make a bootable USB via official Media Creator.
 - put .reg in a folder for unsupported hardware of Windows 11.
 - Shift-F10 for cmd to run .reg after bootup. OOBE\BYPASSNRO if no Internet.
 - GUI rescue options or chkdsk, wmic are available. Installer with format can detect some more disk failure.
## Remote Desktop access
setting -> system -> remote desktop
 - power plan set to high to prevent sleep
 - Setting up secure RDP connections https://www.admin-magazine.com/Archive/2024/82/Setting-up-secure-RDP-connections
 - Throttling Network File Transfer Speed on Windows https://woshub.com/limit-network-file-transfer-speed-windows/
## Fight Windows ransomware with on-board tools
https://www.admin-magazine.com/Archive/2024/80/Fight-Windows-ransomware-with-on-board-tools
## Crowdstrike incident
https://www.twcert.org.tw/newepaper/cp-97-7954-27a6b-3.html
# Windows 11 Security Features
Application whitelisting can be implemented on Windows using AppLocker and Smart App Control in Windows 11.

If you are using Windows devices please upgrade to Windows 11 if possible. This is consistent with the principle of keeping the OS and applications up to date. There are significant improvements in security for Windows 11 devices. Some improvements are in the OS. Some improvements are based on the higher hardware requirements such as TPM2, etc.

We mentioned earlier that the ultimate defense is “only run trusted applications.” The Smart App Control in Windows 11 greatly simplifies the implementation of this defense.

Ransomware encrypts user files and demands ransom for decryption. Since ransomware would encrypt files that belong to this user, no administrative rights are needed for this encryption operation. Logging in as a standard user cannot prevent ransomware from causing damage. Windows 11 added Controlled Folder Access to allow only trusted applications to modify the files in these protected folders. Since ransomware will not be on the list of trusted applications, it will not be able to encrypt the files in the protected folders.

Windows 11 has Application Isolation to run dangerous files and web pages in a container. The system would be protected from harm even if the files and web pages are malicious. By default the Windows 11 Application Guard will open Word files, PowerPoint files, Excel files, Microsoft Edge in protected containers.

http://en.minghui.org/html/articles/2022/5/7/200215.html

## Windows 11 install with disable TPM and secureboot
 - Virtualbox 7 will cause BSOD. Use 6.1 instead. (fn)-shift-F10 for cmd.
- https://superuser.com/questions/1699669/windows-11-install-with-disable-tpm-and-secureboot-option-for-older-computer
- https://techsviewer.com/how-to-install-windows-11-on-mac-with-free-virtual-machine/

Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\Setup\LabConfig]

"BypassTPMCheck"=dword:00000001

"BypassSecureBootCheck"=dword:00000001

"BypassRAMCheck"=dword:00000001

## Windows Sandbox - Windows security | Microsoft Learn
 - https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-sandbox/windows-sandbox-overview <br>
 - https://youtu.be/uIjX4aOoeaQ
## netlogon fail in Active Directory
 - netlogon服務停止會導致NAS無法登入，先將異常dc停機，重啟原有dc群的AD及netlogon，可使用網域帳號正常登入。
 - 含GC(global catalog)的DC的FSMO的角色位階較高, 應該先啟動再接著啟動其他DC...應該會比較正常!! 一般說來, FSMO 建議要先啟動, 且讓所有 DC 的第一個 DNS 都指向他 https://ithelp.ithome.com.tw/questions/10091369
 - Can't promote a domain controller to a global catalog server - Windows Server | Microsoft Learn https://learn.microsoft.com/en-us/troubleshoot/windows-server/active-directory/cannot-promote-dc-to-global-catalog-server
 - windows server 2003 - How to Rebuilt Global Catalog? - Server Fault https://serverfault.com/questions/48964/how-to-rebuilt-global-catalog
## Netdom query Active Directory
 - netdom query /d:Northamerica DC
 - https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc835089(v=ws.11)
### Automate Active Directory management with the Python PyAD library
 - https://admin-magazine.us2.list-manage.com/track/click?u=1c76cb37f73773b4962ae429b&id=e628a2fb70&e=4554e8a0f9
## Microsoft shares mitigation for Windows KrbRelayUp LPE attacks
 - https://www.bleepingcomputer.com/news/security/microsoft-shares-mitigation-for-windows-krbrelayup-lpe-attacks/
 - https://www.ithome.com.tw/news/151458
# What are reasons for access violation?
https://community.intel.com/t5/Intel-Fortran-Compiler/What-are-reasons-for-access-violation/td-p/1129811
# HxTsr.exe error
 - Hidden Executable To Sync Remote Servers for Outlook  https://www.minitool.com/news/hxtsr-exe.html
#  BSOD REGISTRY_ERROR 
https://answers.microsoft.com/en-us/windows/forum/all/bsod-registryerror/53c43269-e2d4-4440-a230-cce80038bc30 <br>
If you receiver a Blue Screen with a error message REGISTRY_ERROR bug, that indicates that a severe registry error has occurred. In other words something has gone wrong with the registry. This error may indicate that the registry encountered an I/O error while trying to read one of its files. This can be caused by hardware problems or file system corruption.

when this occurs during console or rdp login, backups could be done via net share such as C$ with domain admin or other working drives.
# IRQL_NOT_LESS_OR_EQUAL
https://www.tomshardware.com/how-to/fix-irql-not-less-or-equal-errors-windows <br>
(sometimes referred to as just “IRQL”) is typically a memory related error that occurs if a system process or a device driver seeks access to a memory address for which it lacks valid access rights. 
## WMIC is deprecated, but WMI still works with powershell.
 - https://stackoverflow.com/questions/57121875/what-can-i-do-about-wmic-is-deprecated
 - https://learn.microsoft.com/en-us/windows/deployment/planning/windows-10-deprecated-features
 - quick key: Alt-F4 to close an active window on Windows
 - Ctrl-Shift-Esc for Windows Task Manager
 - F11 for fullscreen
 - Window-R then ctrl-shift enter can run as admin
## VM restoration related!! maybe failed or something similar.
 - 此工作站和主要網域間的信任關係失敗
https://ithelp.ithome.com.tw/articles/10259756
 - 電腦升級或是不明原因導致電腦 SID 更換
 - VM 還原/太久沒開導致 AD 認不出
那是什麼東西導致 AD 認不出來電腦呢? 原因就是預設每 7 天 AD 網域的電腦密碼，電腦密碼最多存活 30 天，所以這就是原因！
