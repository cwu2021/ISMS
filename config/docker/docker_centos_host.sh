#!/bin/bash
# https://docs.docker.com/engine/install/centos/
: '
https://projectatomic.io/blog/2015/07/docker-centos-6-and-you/
Red Hat themselves only support Docker on RHEL7 (as stated by https://access.redhat.com/solutions/1378023, and confirmed by several people)
1.7.0 is broken on these (most notably because of libnetwork bridge creation code: #14024)
We shipped 1.7.0 without mentioning we would break compatibility, so this will be fixed in 1.7.1, but we will drop support in 1.8.0.
from: https://github.com/docker/docker/issues/14365
There are already release candidate packages for 1.7.1 available to test now, but a somewhat longer-term solution will require a newer kernel. While the official CentOS 6 kernel won’t be making any huge leaps forward, there’s a newer kernel maintained by the CentOS virtualization Special Interest Group for its Xen4CentOS variant.
I installed this kernel on a CentOS 6 VM, alongside the 1.7.0 package from Docker, and managed to start and use Docker normally:
'
yum install -y centos-release-xen
echo includepkgs=kernel kernel-firmware >> /etc/yum.repos.d/CentOS-Xen.repo
yum update -y kernel
# reboot
# yum install -y https://get.docker.com/rpm/1.7.0/centos-6/RPMS/x86_64/docker-engine-1.7.0-1.el6.x86_64.rpm
# service docker start
