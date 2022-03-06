@echo off
REM https://www.wikihow.com/Change-the-Time-Synchronization-Interval-in-Windows
regedit
REM HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\services\W32Time\TimeProviders\NtpClient. 
REM SpecialPollInterval/Decimal
REM Open Date and Time Settings. Click Internet Time, click Change Settings, then Update Now. 
REM the next synchronization time should be exactly one interval away from the time you synchronized.
