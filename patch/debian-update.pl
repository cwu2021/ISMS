=pod
Updated Debian 12: 12.11 released
 - Linux 6.1.137-1, included with Debian 12.11 is unable to load the "watchdog" and "w83977f_wdt" modules on the "amd64" architecture. This is a regression. This issue will be fixed in a forthcoming update. Users who rely on the watchdog functionality should disable their watchdog or avoid upgrading to this version of the kernel until a fix is
available.