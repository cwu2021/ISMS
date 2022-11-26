#!/bin/bash
# https://serverfault.com/questions/1092998/ssh-no-matching-host-key-type-found
# backward compatibility for older server < 8.8.
vi ~/.ssh/config
# PubKeyAcceptedKeyTypes=+ssh-dss
# HostKeyAlgorithms +ssh-rsa
ssh -V
uname -a
# OpenSSH_6.9p1, LibreSSL 2.1.8 may not use key auth for ubuntu 22.04.
# Darwin Kernel Version 15.6.0: Thu Jun 21 20:07:40 PDT 2018; root:xnu-3248.73.11~1/RELEASE_X86_64 x86_64
