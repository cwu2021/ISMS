# What to Know Before Moving into HPC
https://www.admin-magazine.com/Articles/What-to-Know-Before-Moving-into-HPC/
# migrate from CentOS 8 to CentOS stream
<i> https://www.cyberciti.biz/howto/upgrade-migrate-from-centos-8-to-centos-stream-conversion/ </i>
<br> I decided to stick with CentOS Stream because I didn’t have time or energy to install a new replacement such as Rocky Linux or AlmaLinux. Then restore data. It is too much work for my side project. Eventually, I will convert my legacy app to Docker format, but for now, I am going to upgrade my VM and save some time.
 -  Backup
 -  Installing all updates on CentOS 8
 -  Installing CentOS Stream package
 <br>$ sudo dnf in centos-release-stream
 -  Migrating From CentOS 8 to CentOS Stream
 <br>$ sudo dnf swap centos-linux-repos centos-stream-repos
 <br>$ sudo dnf repolist
 <br>$ sudo dnf distro-sync
 -  Reboot the system
 -  Verification
## HCL Super Micro OS Compatibility Chart
https://www.supermicro.com/support/resources/OS/C741-DP.cfmWhat to Know Before Moving into HPC What to Know Before Moving into HPCWhat to Know Before Moving into HPCWhat to Know Before Moving into HPCWhat to Know Before Moving into HPC