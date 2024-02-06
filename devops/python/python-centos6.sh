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

# [1/3 at 10:29] venv 要用 3.8 來建：
python3.8 -m venv tutorial-env 
# https://docs.python.org/zh-tw/3/tutorial/venv.html
source tutorial-env/bin/activate
# 這樣切進虛擬環境預設就是跑3.8

