#!/bin/bash
# https://docs.openstack.org/image-guide/convert-images.html
qemu-img convert -f vmdk -O qcow2 image.vmdk image.qcow2
