# https://discuss.linuxcontainers.org/t/vga-console-connect/8814
lxc console openbsd --type=vga

# https://www.microsoft.com/zh-tw/software-download/windows11
# https://ubuntu.com/tutorials/how-to-install-a-windows-11-vm-using-lxd#2-prepare-your-windows-image
# https://discuss.linuxcontainers.org/t/running-virtual-machines-with-lxd-4-0/7519/172?page=9
sudo snap install distrobuilder --classic
sudo distrobuilder repack-windows 下載/Win11_23H2_Chinese_Traditional_x64v2.iso win11.lxd.iso

# https://linuxcontainers.org/incus/docs/main/installing/
# https://github.com/zabbly/incus
sudo incus admin init
sudo incus launch images:debian/11 debian11
sudo incus list
sudo incus shell debian11
sudo incus stop debian11
sudo incus export debian11 debian11.tar.gz
