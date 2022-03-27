#!/bin/bash
# Forwarding host ports tp LXD instances.
# lxdware.com
lxc profile create proxy-80
lxc profile list
lxc profile device add proxy-80 hostport80 proxy connect="tcp:127.0.0.1:8080" listen="tcp:0.0.0.0:80"
lxc profile show proxy-80
lxc profile add container1 proxy-80
lxc config show container1 -e
lxc profile remove container1 proxy-80
lxc profile delete proxy-80
