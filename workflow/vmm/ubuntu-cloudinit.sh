#!/bin/bash
# https://www.admin-magazine.com/Archive/2022/69/Goodbye-cloud-VMs-hello-laptop-VMs
sudo snap install multipass
snap info multipass
sudo snap refresh multipass <--stable|--candidate|--beta|--edge>
multipass launch -n mycloudvm -c 2 -m 2G -d 10G --timeout 600
