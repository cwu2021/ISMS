#!/bin/bash
# fireup an old version ubuntu on docker host, then run this script to install ruby 1.8.7.
# docker run -it --name precise ubuntu:12.04
sed -i -e 's/archive.ubuntu.com/old-releases.ubuntu.com/g' /etc/apt/sources.list
apt-get update
apt-get install vim ruby
ruby --version
