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
