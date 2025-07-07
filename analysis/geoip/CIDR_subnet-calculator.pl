$pkg = `sudo apt install ipcalc`;
$subnet = `ipcalc 192.168.66.0/23`;
print $subnet;
=pod 
 - old script as following
#!/bin/bash
sudo apt install sipcalc
sipcalc 192.168.0.0/26
