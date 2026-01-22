#!/bin/bash
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
: '
The BSDCan Call For Papers (CFP) is open until January 17th, see https://www.bsdcan.org/2026/papers.html

If you tried to sign up as a new indico user and did not get the confirmation mail in time, please try again. The problem has been fixed.

The holidays can be a great time to get that submission done!

Want to know more about the BSD conferences? See https://nxdomain.no/~peter/what_is_bsd_come_to_a_conference_to_find_out.html (and links therein)

All the best,
Peter
'