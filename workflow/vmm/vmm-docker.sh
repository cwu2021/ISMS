#!/bin/ksh
# https://www.tumfatig.net/2022/running-docker-host-openbsd-vmd/
# https://medium.com/@dave_voutila/docker-on-openbsd-6-1-current-c620513b8110

vmctl create -s 64G docker.qcow2
# vmctl: qcow2 imagefile created
cat >> /etc/vm.conf << EPF
switch "uplink" {
        interface bridge0
}

vm "docker" {
        disable

        memory 2G

        cdrom "/opt/vm/alpine-virt-3.16.2-x86_64.iso"
        disk "/opt/vm/docker.qcow2"

        interface {
                switch "uplink"
                locked lladdr fe:e1:ba:d2:02:30
        }
}
EPF
rcctl restart vmd
vmctl start -c -B cdrom docker
