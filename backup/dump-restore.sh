#!/bin/bash
# dump/restore suite
# How to backup and restore a whole Red Hat Enterprise Linux system with the dump/restore commands?
# https://access.redhat.com/solutions/17525
dump -0u -f - /dev/sda1 | ssh root@remoteserver.example.com dd of=/tmp/sda1.dump
