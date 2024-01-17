# https://stackoverflow.com/questions/5751292/how-to-get-current-import-paths-in-python
# https://stackoverflow.com/questions/69452597/yum-error-errno-14-peer-cert-cannot-be-verified-or-peer-cert-invalid
# wget https://vault.centos.org/6.10/updates/x86_64/Packages/ca-certificates-2020.2.41-65.1.el6_10.noarch.rpm --no-check-certificate
# rpm -iU ca-certificates-2020.2.41-65.1.el6_10.noarch.rpm
# https://vault.centos.org/6.7/
# yum install gcc zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel
# https://www.geeksforgeeks.org/how-to-install-pip-on-windows/
# curl https://bootst/rap.pypa.io/get-pip.py -o get-pip.py
# python get-pip.py
# https://stackoverflow.com/questions/5226311/installing-specific-package-version-with-pip
# /opt/bin/pip install APScheduler==3.4.0
import apscheduler
import sys
print(sys.path)
