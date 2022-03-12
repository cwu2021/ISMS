#!/bin/bash
# running openstack with 8G/100G.
# https://ubuntu.com/openstack/install
# but, Microstack Init Fails on 16.04LTS. 20.04LTS OK.
# https://ubuntu.com/blog/openstack-is-dead
sudo snap install microstack --devmode --beta
sudo microstack init --auto --control
microstack.openstack image list
microstack.openstack flavor list
microstack launch cirros -n test
ssh -i /home/ubuntu/snap/microstack/common/.ssh/id_microstack cirros@10.20.20.87
