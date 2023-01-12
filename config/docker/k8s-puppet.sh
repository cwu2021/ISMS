#!/bin/bash
# microk8s.io with 4G/20G, also, microstack with 8G/100G.
# https://microk8s.io/docs/getting-started
# canonical oficially via snapd.
# or k8s via puppet module
sudo apt install puppet
sudo puppet help module
# https://forge.puppet.com/modules/puppetlabs/kubernetes
# https://zhekunhu.xyz/ps4-kubernetes.html
# also massive nrpe via puppet
wget https://apt.puppet.com/puppet-tools-release-bullseye.deb
sudo dpkg -i puppet-tools-release-bullseye.deb
sudo apt-get update
sudo apt-get install puppet-bolt
# with proper yaml: https://www.admin-magazine.com/Archive/2022/70/Puppet-Bolt-orchestration-tool/(offset)/6
bolt plan run apache::install -t containers
