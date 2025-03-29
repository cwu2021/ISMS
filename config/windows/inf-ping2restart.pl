# https://perldoc.perl.org/perlpod
=pod
KVM e1000 may lose network connectivity on Windows randomly. Disable/Enable interface can restore it without reboot.
https://forum.proxmox.com/threads/kvm-windows-vms-and-losing-network-connectivity.46763/
A script to ping then restart inf if loss may be handy.
=cut
$check = `ping $ip`;
$restart_inf if $check ;
