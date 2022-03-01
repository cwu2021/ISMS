#!/bin/ksh
# Ubuntu 18.04 on OpenBSD's vmm
# https://giocher.com/words/2018/ubuntu-on-openbsd-vmm/
vmctl create disk.img -s 30G
du -h disk.img
cat > /etc/vm.conf << EOF
vm "ubuntu" {
	memory 2G
	cdrom "/path/to/image.iso"
	disk "/path/to/disk.img"
	interfaces 1
	local interface tap
	owner user
	disable
}
EOF
vmctl start ubuntu -c
# $ vmctl start ubuntu
