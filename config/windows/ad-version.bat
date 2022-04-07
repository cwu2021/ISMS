@echo off
REM https://docs.microsoft.com/zh-tw/troubleshoot/windows-server/identity/find-current-schema-version
REM https://wiki.samba.org/index.php/AD_Schema_Version_Support
dsquery * "cn=schema,cn=configuration,dc=contoso,dc=local" -scope base -attr objectVersion
