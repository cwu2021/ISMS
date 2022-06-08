#!/bin/bash
# install temper-poll on debian wheezy manually.
apt-get install python-usb python-setuptools
tar zxvf temper-python.tar.gz
cd temper-python/
python setup.py install
# verify the path poll script.
ls -l /usr/local/bin/temper-poll
# manually place the required old package.
cd /usr/local/lib/python2.7/dist-packages
mv dist-packages/ dist-packages.bak
tar zxvf TEMPer_python2.7_dist-packages.tar.gz
