@echo off
REM https://docs.microsoft.com/zh-tw/troubleshoot/windows-server/identity/find-current-schema-version
REM https://wiki.samba.org/index.php/AD_Schema_Version_Support
dsquery * "cn=schema,cn=configuration,dc=contoso,dc=local" -scope base -attr objectVersion
REM KDC certificate information.
certutil -scinfo
certutil -dcinfo
REM Event ID 29 — KDC Certificate Availability https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc734096(v=ws.10)?redirectedfrom=MSDN
REM KDC Certificate Availability https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc733882(v=ws.10)
REM Key Distribution: KDC, Certification, CA https://sls.weco.net/node/10687
REM 智慧卡疑難排解 https://docs.microsoft.com/zh-tw/windows/security/identity-protection/smart-cards/smart-card-debugging-information
REM 有關2003及2008 ad server上KDC的錯誤訊息? https://ithelp.ithome.com.tw/questions/10153686
