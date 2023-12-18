# kernel panic
 /bsd: panic: pmap_remove_ptes: unmanaged page marked PG_PVLIST, <br>
 https://misc.openbsd.narkive.com/1sLNfucz/bsd-panic-pmap-remove-ptes-unmanaged-page-marked-pg-pvlist <br>
 <i>i would suspect ram. i have had one system that had bad ram. when it
panic'd, guess where? almost always in the pmap. particularly if it has
gone from bad to worse.

there were some issues related to uvm/pmap and wired pages fixed recently,
but i don't think this is one of the panics that would result.</i> 
### Keep getting a 'fatal protection fault in supervisor mode' on VirtualBox
https://www.reddit.com/r/openbsd/comments/yew0ri/keep_getting_a_fatal_protection_fault_in/?rdt=54025
 - I mounted the VDI on the AHCI SATA controller and it worked.
 - I also chose the ICH9 Chipset and enabled Nested VT-x/AMD-V.
 - rdate correctly to make pkg work.
### bad system call (core dumped)
https://www.mail-archive.com/search?l=misc@openbsd.org&q=subject:%22%5C-current%22&o=newest&f=1 <br>
...it's very likely that you're
running into a problem from some old binary or cached build somewhere.
## NIC/networking with temporal correlation removed, which also simplified vm networking. unused services disabled. keep observing.
 - VM can also consider migrating between Hosts as physical RAM changing. Host rebooting may be RAM related.
## Emulators
 - dgen for sega. https://www.mankier.com/5/dgenrc
 - snes9x for super nintendo.
 - mame for IRIX. https://sgi.neocities.org/
<br> https://wiki.mamedev.org/index.php/Driver:MIPS
- Love: install IRIX from IRIX, Linux, or Windows 
<br> https://www.osnews.com/story/135816/love-install-irix-from-irix-linux-or-windows/
 - darling for darwin, current 11.7 Big Sur. neofetch, htop via brew works fine, as well as built-in binaries.
 - open source alternatives to Minecraft https://opensource.com/alternatives/minecraft
### neofetch distros
 - ./neofetch --ascii_distro IRIX
 - ./neofetch --ascii_distro android
