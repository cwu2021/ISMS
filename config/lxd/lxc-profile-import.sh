#!/bin/bash
lxc profile create proxy-80
lxc profile device add proxy-80 hostport80 proxy connect="tcp:127.0.0.1:80" listen="tcp:0.0.0.0:80"
# lxc profile add focal proxy-80
# lxc profile list
lxc import focal.tar.gz r1
