#!/bin/bash
# removing an offline brick on centos 6.
umount -l /filestore
/etc/init.d/glusterd stop
/etc/init.d/glusterd start
# brick status should become Disconnected after restarting glusterd.
gluster peer status
gluster volume info
gluster volume remove-brick test-volume ip.of.peer:/gluster/folder force
gluster peer detach ip.of.peer
mount -t glusterfs 127.0.0.1:/test-volume /filestore
