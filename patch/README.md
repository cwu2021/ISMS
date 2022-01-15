# Restrictions on changes to software packages
## A.14.2.4 of ISO/IEC 27001:2013
## A.12.5.3 of ISO/IEC 27001:2005
<i>Control</i><br>
Modifications to software packages shall be discouraged, limited to necessary changes and all changes shall be strictly controlled.
## Updating software packages in Red Hat Enterprise Linux
yum allows you to check if your system has any pending updates. You can list packages that need updating and choose to update a single package, multiple packages, or all packages at once. If any of the packages you choose to update have dependencies, they are updated as well. <br>
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/managing-software-packages_configuring-basic-system-settings
## Proprietary Hardware, Blobs, and Firmware
### <i>Quoted from p.17 of Absolute OpenBSD, 2nd edition.</i>
Some vendors don't want to provide documentation, but do want users of open source operating systems to buy their hardware. These vendors provide drivers for their hardware in the form of binary objects, or <i>blobs</i>. This might sound reasonable at first, but the operating system must load these blobs into the kernel...If the blob has a security issue, or has some subtle interaction with the kernel that destablizes the system, there's no way for the developers to resolve the problem. The blob might only be inefficient or wasteful, but it could negatively impact other kernel subsystems or even include backdoors...

Note that blobs are not the same as <i>firmware</i>. Firmware is a binary object a piece of hardware needs in order to run, and is loaded into the hardware itself, rather than into the operating system. You'll find firmware in almost every computer component: CPUs, motherboards, NICs, disk controllers, and so on. Firmware is never loaded into the kernel; the kernel loads the firmware into the card...The firmware lets the hardware provide its documented interface to the operating system, and if it wasn't on the disk, it would be on the hardware itself.
