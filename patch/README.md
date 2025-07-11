# Restrictions on changes to software packages
## A.14.2.4 of ISO/IEC 27001:2013
## A.12.5.3 of ISO/IEC 27001:2005
<i>Control</i><br>
Modifications to software packages shall be discouraged, limited to necessary changes and all changes shall be strictly controlled.
## Updates including drivers and hotfixes from the Windows Update Catalog
https://learn.microsoft.com/en-us/troubleshoot/windows-client/deployment/download-updates-drivers-hotfixes-windows-update-catalog
### 2023 年 9 月 26 日 KB5030649 Windows 10 版本 22H2 .NET Framework 3.5 和 4.8.1 的累積更新
https://support.microsoft.com/zh-tw/topic/2023-年-9-月-26-日kb5030649-windows-10-版本-22h2-的-net-framework-3-5-和-4-8-1-累積更新預覽-5b4ecdd8-f632-47ca-b313-41993bec91de
### .NET 9, the successor to .NET 8, has a special focus on cloud-native apps and performance. .NET is the free, open-source, cross-platform framework for building modern apps and powerful cloud services. https://dotnet.microsoft.com/en-us/?utm_medium=email&utm_source=IaaN&utm_campaign=11212024&mkt_tok=MTEzLURUTi0yNjYAAAGW70zFUmpsZQHWtpXMpUA73vLNPWhezSkf9eKHaoPcZ760QogEZM-kly_ODDdz3h44EPZuLj4bIuUnWruUpupCskTDnHVk4UsqAc41V8XguR0
## Beware of "Software Transformed" vendors and "New Features" updates. 
### Verify updates carefully and apply after one week observation.
- 7.0.1-42218 Update 1 01-12 recalled.
- Updated core to version D208 to address a rare issue with artifacts seen on SDI Inputs.
### GPU and SDI I/O Temperature
- GPU idle Temp is around 30-50 degrees Celcius, while working Temp os 60-85.
- SDI I/O such as Decklink requires environmental Temp at 5-50 degrees.
### Self-lab of Hardware verification would also be necessary. 
 - standalone converters and monitors required. 
 - backup/restore drives , versions build disks needs to be prepared.
## Updating software packages in Red Hat Enterprise Linux
yum allows you to check if your system has any pending updates. You can list packages that need updating and choose to update a single package, multiple packages, or all packages at once. If any of the packages you choose to update have dependencies, they are updated as well. <br>
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/managing-software-packages_configuring-basic-system-settings
 - Linux 6.12 LTS at a glance https://www.linux-magazine.com/Issues/2025/295/Linux-6.12-LTS
## Proprietary Hardware, Blobs, and Firmware
### <i>Quoted from p.17 of Absolute OpenBSD, 2nd edition.</i>
Some vendors don't want to provide documentation, but do want users of open source operating systems to buy their hardware. These vendors provide drivers for their hardware in the form of binary objects, or <i>blobs</i>. This might sound reasonable at first, but the operating system must load these blobs into the kernel...If the blob has a security issue, or has some subtle interaction with the kernel that destablizes the system, there's no way for the developers to resolve the problem. The blob might only be inefficient or wasteful, but it could negatively impact other kernel subsystems or even include backdoors...

Note that blobs are not the same as <i>firmware</i>. Firmware is a binary object a piece of hardware needs in order to run, and is loaded into the hardware itself, rather than into the operating system. You'll find firmware in almost every computer component: CPUs, motherboards, NICs, disk controllers, and so on. Firmware is never loaded into the kernel; the kernel loads the firmware into the card...The firmware lets the hardware provide its documented interface to the operating system, and if it wasn't on the disk, it would be on the hardware itself.
## Offline Updates
https://fedoramagazine.org/offline-updates-and-fedora-35/ <br>
The process of restarting, applying updates, and then restarting again is called Offline Updates. Your computer boots into a special save-mode, where all other systems are disabled and where network access is unavailable. It then applies the updates and restarts.

Offline Updates is there to protect you. Computers have become way more complex in the past twenty years. Back in the day, it was possible to apply updates without too much worry since the system itself was smaller and less interconnected. Multitasking was also in its infancy, so users were not actually using the computer and updating it at the same time.

## remove DSA support in OpenSSH
2024/01 - this announcement
2024/03 (estimated) - DSA compile-time optional, enabled by default
2024/06 (estimated) - DSA compile-time optional, *disabled* by default
2025/01 (estimated) - DSA is removed from OpenSSH
### SSH連線可能遭前綴截斷攻擊
 - https://www.ithome.com.tw/news/160452
 - old ssh client connection to AL2023 fails with "no hostkey alg": This is a key exchange algorithm mismatch - the RHEL6 host is offering to use methods that AL2023 considers too old and insecure, and there isn't one on which they can both agree. https://repost.aws/zh-Hant/questions/QU0Gh0VqHjQauzZ9Q8LQujjg/old-ssh-client-connection-to-al2023-fails-with-no-hostkey-alg

## Using an unsupported browser
..some features might not work, or an application might not open. For example, on an unsupported browser: You may be able to view, but not update, your calendars. Drawings and presentations in Docs editors may not display properly. https://support.google.com/a/answer/33864?hl=en
