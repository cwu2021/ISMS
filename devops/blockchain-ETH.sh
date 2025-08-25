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
# https://www.ithome.com.tw/news/170723
:'
美國懷俄明州推出穩定幣FRNT
懷俄明州是依據該州在2023年通過的穩定幣法令《Wyoming Stable Token Act》設立了懷俄明州穩定幣委員會（Wyoming Stable Token Commission），並由州長Mark Gordon兼任委員會主席。此一法令同時也要求FRNT必須具備至少102%的儲備比例，來提升代幣的穩定性及信任度，而FRNT則以美元及短期美國國債來維持2%的超額抵押。
'
