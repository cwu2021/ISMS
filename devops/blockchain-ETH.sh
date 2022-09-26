#!/bin/bash
# https://www.linuxjournal.com/content/blockchain-part-ii-configuring-blockchain-network-and-leveraging-technology
wget https://gethstore.blob.core.windows.net/builds/geth-linux-amd64-1.7.3-4bb3c89d.tar.gz
tar xzf geth-linux-amd64-1.7.3-4bb3c89d.tar.gz
cd geth-linux-amd64-1.7.3-4bb3c89d/
sudo cp geth /usr/bin/
sudo apt-get install -y build-essential golang
make geth
# If you are running on Ubuntu and decide to install the package from a public repository, run the following commands:
sudo apt-get install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install ethereum
# regular starup commands after private chain setup completely ..
geth --datadir /home/petros/eth-evm/data/PrivateBlockchain init /home/petros/eth-evm/config/Genesis.json
geth --datadir /home/petros/eth-evm/data/PrivateBlockchain --networkid 9999
