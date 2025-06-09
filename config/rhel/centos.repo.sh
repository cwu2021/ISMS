#!/bin/bash
# Introducing CodeReady Linux Builder
# https://developers.redhat.com/blog/2018/11/15/introducing-codeready-linux-builder
# The AppStream repository
# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/package_manifest/appstream-repository
less /etc/yum.repos.d/centos.repo
# How to activate your no-cost Red Hat Enterprise Linux subscription
# https://developers.redhat.com/blog/2021/02/10/how-to-activate-your-no-cost-red-hat-enterprise-linux-subscription#step_2__download_no_cost_rhel
# Red Hat Enterprise Linux 10 Released with New AI Features https://www.admin-magazine.com/News/Red-Hat-Enterprise-Linux-10-Released-with-New-AI-Features
# 2.9 Creating a Local Yum Repository Using an ISO Image
# https://docs.oracle.com/cd/E37670_01/E37355/html/ol_create_repo.html
mkdir -p /var/OSimage/OL6.3_x86_64
mount -o loop,ro /ISOs/V33411-01.iso /var/OSimage/OL6.3_x86_64
yum-config-manager --disable \*
cat /etc/yum.repos.d/OL63.repo << EOF
[OL63]
name=Oracle Linux 6.3 x86_64
baseurl=file:///var/OSimage/OL6.3_x86_64
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY
gpgcheck=1 
enabled=1 
EOF
yum clean all
yum repolist
# Choosing your RHEL 8 clone after the death of CentOS
# https://www.getpagespeed.com/server-setup/choosing-your-rhel
#    AlmaLinux
#    Rocky Linux
#    Oracle Linux
