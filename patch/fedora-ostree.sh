#!/bin/bash
# https://fedoramagazine.org/updating-edge-devices-with-ostree-and-pulp/
systemctl is-active sshd
rpm-ostree upgrade
systemctl reboot
