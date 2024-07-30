#!/bin/ksh
# https://trackit.io/creating-an-openbsd-7-0-ami-on-aws-ec2/
# https://github.com/ajacoutot/aws-openbsd
pkg_add vmdktool git awscli
# newer version like 7.2 has awscli prebuilt.
# aws configure
git clone https://github.com/ajacoutot/aws-openbsd.git
rcctl -f start vmd
# follow instructions of the repo.
# Deploy OpenBSD Servers in Seconds Worldwide - Vultr.com
# https://www.vultr.com/servers/openbsd/
