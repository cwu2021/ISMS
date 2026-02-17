# kernel panic
 /bsd: panic: pmap_remove_ptes: unmanaged page marked PG_PVLIST, <br>
 https://misc.openbsd.narkive.com/1sLNfucz/bsd-panic-pmap-remove-ptes-unmanaged-page-marked-pg-pvlist <br>
 <i>i would suspect ram. i have had one system that had bad ram. when it
panic'd, guess where? almost always in the pmap. particularly if it has
gone from bad to worse.

there were some issues related to uvm/pmap and wired pages fixed recently,
but i don't think this is one of the panics that would result.</i> 
 - Tuning tools for AMD graphics chips https://www.linux-magazine.com/Issues/2025/297/Tuning-for-AMD-GPUs

CoreCtrl and RadeonTop monitor the utilization and clock frequency of AMD chips with the potential for boosting performance.

More than 10 years ago, Valve Corporation's Steam first saw the light of day as a gaming platform for Linux. Following this biggish bang, the free Linux operating system started to gain the attention of gamers. Thanks to Steam and its Proton Windows emulation layer, the selection of well-known game titles has grown steadily since then, with many top titles now released simultaneously for Windows and Linux.

Experience and benchmarks show that some games even run faster on Linux than on Windows thanks to the Proton runtime environment maintained by Valve and the modern Vulkan graphics API. The constant improvements to Linux driver support for graphics chips and technologies play a significant role here. These technologies include Deep Learning Super Sample (DLSS) [1], NVIDIA's real-time upscaling technology for computer games, and FidelityFX Super Resolution (FSR) [2], AMD's counterpart DLSS for upscaling and frame rate enhancement.

In most cases, even more improvements are possible: Optimally configured drivers tweak a few more frames per second out of the available graphics hardware. AI frameworks and renderers such as Blender also benefit from this: They also tend to use powerful GPU shaders for floating-point arithmetic because they handle the task more efficiently than the CPU.

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
 - Microsoft OS/2 2.0 on ESXi https://williamlam.com/2024/03/pre-release-microsoft-os-2-2-0-on-esxi.html
 - NFC hack: 臺大電機教授示範無線竄改悠遊卡金額 https://www.ithome.com.tw/news/63075
 - NFC 是什麼？與 RFID 有什麼差異？https://chci.com.tw/differences-between-nfc-and-rfid/
 - The New Nintendo Game & Watch: STM32H7B0 32-bit Cortex-M7 (ARM arch) from STMicroelectronics
https://www.hackster.io/news/the-new-nintendo-game-watch-is-certainly-some-hardware-we-ll-be-keeping-a-watchful-eye-on-2acf719ac8c1
 - JSlinux runs OS in a browser
 - ARM based Raspbian vs Raspberry Pi OS: legacy.raspbian.org
 - RealVNC is available with raspi-config on Pi
 - Build your own webcam with a Pi Zero 2W and a Cam Module 3 https://www.linux-magazine.com/Issues/2025/290/Pi-Zero-Based-Weather-Cam
### neofetch distros
 - ./neofetch --ascii_distro IRIX
 - ./neofetch --ascii_distro android
 - Enhance Your Terminal Display with Fastfetch
 - a history of the tty https://computer.rip/2024-02-25-a-history-of-the-tty.html
 - textbunny https://www2.b3ta.com/_bunny/texbunny.gif
### Announcing CrossOver 25.0.0
CrossOver 25 includes an update to Wine 10.0, bringing with it over 5,000 changes that oﬀer improvements to a variety of applications on Mac and Linux. This release also includes an update to Wine Mono 9.4.0, vkd3d 1.14 and MoltenVK 1.2.10.
 - [Announcements] Announcing CrossOver 25.1.0
 - [Announcements] Announcing CrossOver 26.0.0
