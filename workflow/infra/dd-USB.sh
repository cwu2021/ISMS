#!/bin/ksh
# this method works for creating bootable USB from img (OpenBSD, FreeDOS) and iso (Ubuntu).
# https://www.openbsd.org/faq/faq4.html
dd if=install70.img of=/dev/rsd6c bs=1M
