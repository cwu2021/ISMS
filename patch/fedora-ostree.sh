#!/bin/bash
# https://fedoramagazine.org/updating-edge-devices-with-ostree-and-pulp/
systemctl is-active sshd
rpm-ostree upgrade
systemctl reboot
# rollback/downgrade packages while 'Cannot find rpm nevra..'.
# https://forums.fedoraforum.org/showthread.php?326163-dnf-history-rollback-can-t-find-rpm-s&p=1847962
# https://robbinespu.gitlab.io/posts/rollback-with-fedora-repos-archive/
dnf history
dnf info fedora-repos-archive
dnf install fedora-repos-archive
dnf history undo 158
# Test Week for Kernel 6.0 
# https://fedoramagazine.org/contribute-at-the-fedora-linux-37-test-week-for-kernel-6-0/
koji list-builds –package=kernel –after=”2022-10-16″ | grep “6.00”
koji list-builds –package=kernel –after=”2022-10-16″ 
# While doing release upgrade:
# https://www.cyberciti.biz/faq/upgrade-fedora-31-to-fedora-32-using-the-cli/
sudo dnf --refresh upgrade
sudo dnf system-upgrade download --releasever=37
# Error Summary
# -------------
# Disk Requirements:
#   At least 878MB more space needed on the / filesystem.
## cleanup /var/log in f36 would be a good option.
sudo journalctl --vacuum-time=2d
# Vacuuming done, freed 895.7M of archived journals from /var/log/journal/3acc037fe00849caa68a572f6534a2bd.
# https://unix.stackexchange.com/questions/139513/how-to-clear-journalctl
# Running transaction check
# Transaction check succeeded.
# Running transaction test
# Transaction test succeeded.
# Complete!
# Transaction saved to /var/lib/dnf/system-upgrade/system-upgrade-transaction.json.
dnf system-upgrade reboot
dnf system-upgrade clean
dnf clean packages
