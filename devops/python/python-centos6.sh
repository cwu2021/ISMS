#!/bin/bash
# https://en.wikipedia.org/wiki/History_of_Python
# https://www.python.org/ftp/python/
wget https://www.python.org/ftp/python/3.8.18/Python-3.8.18.tgz
tar zxvf Python-3.8.18.tgz
cd Python-3.8.18
# without ssl on old OS. pip3 also won't work.
# https://pip.pypa.io/en/stable/installation/
# https://pypi.org/project/APScheduler/#files
./configure --prefix=/opt
make
make install
