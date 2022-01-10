#!/bin/bash
# running headless kali as a docker instanse is really convenient.
# https://www.kali.org/docs/containers/official-kalilinux-docker-images/
# First prepare a suitable docker host, e.g. CentOS > 7, ubuntu > trusty.
: '
$ sudo yum install -y yum-utils
$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
$ sudo yum install docker-ce docker-ce-cli containerd.io
If prompted to accept the GPG key, verify that the fingerprint matches 
 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35, and if so, accept it.
'
# After firing up kalilinux/kali-rolling in docker, fetch complete suite as following:
# https://www.kali.org/docs/containers/official-kalilinux-docker-images/
apt update && apt -y install kali-linux-headless
