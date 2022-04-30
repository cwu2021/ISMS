#!/bin/bash
# https://fedoramagazine.org/converting-networkmanager-from-ifcfg-to-keyfiles/
# The legacy network service served us well for many years, but its days are now long over. Fedora Linux dropped it many releases ago and without it there is seemingly little reason to use the ifcfg files. That is, for new configurations. While Fedora Linux still supports the ifcfg files, it has defaulted to writing keyfiles for quite some time.
# Starting with Fedora Linux 36, the ifcfg support will no longer be present in new installations. If you’re still using ifcfg files, do not worry — the existing systems will keep it on upgrades. Nevertheless, you can still decide to uninstall it and carry your configuration over to keyfiles. Keep on reading to learn how.
nmcli connection migrate eth0
nmcli conn migrate --plugin ifcfg-rh eth0
nmcli conn migrate
dnf remove NetworkManager-initscripts-ifcfg-rh
