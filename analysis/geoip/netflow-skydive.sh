#!/bin/bash
# pftop filter with iftop
# pftop: DIOCGETSTATUS: Permission denied
# pkg_add -r pftop
iftop -F 1.1.1.1/255.255.255.255
# Visualize netflow with Skydive
# https://www.linux-magazine.com/Issues/2022/255/Skydive
yum install go git make protobuf protobuf-c-compiler \
    npm patch libxml2-devel libvirt-devel libpcap-devel \
    protobuf-devel
mkdir $HOME/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
mkdir -p $GOPATH/src/github.com/skydive-project
git clone https://github.com/skydive-project/skydive.git \
    $GOPATH/src/github.com/skydive-project/skydive
cd $GOPATH/src/github.com/skydive-project/skydive
make
make install
