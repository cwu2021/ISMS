# Windows 11 Security Features
Application whitelisting can be implemented on Windows using AppLocker and Smart App Control in Windows 11.

If you are using Windows devices please upgrade to Windows 11 if possible. This is consistent with the principle of keeping the OS and applications up to date. There are significant improvements in security for Windows 11 devices. Some improvements are in the OS. Some improvements are based on the higher hardware requirements such as TPM2, etc.

We mentioned earlier that the ultimate defense is “only run trusted applications.” The Smart App Control in Windows 11 greatly simplifies the implementation of this defense.

Ransomware encrypts user files and demands ransom for decryption. Since ransomware would encrypt files that belong to this user, no administrative rights are needed for this encryption operation. Logging in as a standard user cannot prevent ransomware from causing damage. Windows 11 added Controlled Folder Access to allow only trusted applications to modify the files in these protected folders. Since ransomware will not be on the list of trusted applications, it will not be able to encrypt the files in the protected folders.

Windows 11 has Application Isolation to run dangerous files and web pages in a container. The system would be protected from harm even if the files and web pages are malicious. By default the Windows 11 Application Guard will open Word files, PowerPoint files, Excel files, Microsoft Edge in protected containers.

http://en.minghui.org/html/articles/2022/5/7/200215.html
## Windows Sandbox - Windows security | Microsoft Learn
 - https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-sandbox/windows-sandbox-overview <br>
 - https://youtu.be/uIjX4aOoeaQ
## Microsoft shares mitigation for Windows KrbRelayUp LPE attacks
 - https://www.bleepingcomputer.com/news/security/microsoft-shares-mitigation-for-windows-krbrelayup-lpe-attacks/
 - https://www.ithome.com.tw/news/151458
#  BSOD REGISTRY_ERROR 
https://answers.microsoft.com/en-us/windows/forum/all/bsod-registryerror/53c43269-e2d4-4440-a230-cce80038bc30 <br>
If you receiver a Blue Screen with a error message REGISTRY_ERROR bug, that indicates that a severe registry error has occurred. In other words something has gone wrong with the registry. This error may indicate that the registry encountered an I/O error while trying to read one of its files. This can be caused by hardware problems or file system corruption.

when this occurs during console or rdp login, backups could be done via net share such as C$ with domain admin or other working drives.
# IRQL_NOT_LESS_OR_EQUAL
https://www.tomshardware.com/how-to/fix-irql-not-less-or-equal-errors-windows <br>
(sometimes referred to as just “IRQL”) is typically a memory related error that occurs if a system process or a device driver seeks access to a memory address for which it lacks valid access rights. 
## VM restoration related!! maybe failed or something similar.
 - 此工作站和主要網域間的信任關係失敗
https://ithelp.ithome.com.tw/articles/10259756
 - 電腦升級或是不明原因導致電腦 SID 更換
 - VM 還原/太久沒開導致 AD 認不出
那是什麼東西導致 AD 認不出來電腦呢? 原因就是預設每 7 天 AD 網域的電腦密碼，電腦密碼最多存活 30 天，所以這就是原因！
