@echo off
REM https://stackoverflow.com/questions/1565434/how-do-i-find-the-net-version
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\NET Framework Setup\NDP"
