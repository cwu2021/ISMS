#!/bin/bash
# https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu
# https://blog.quickbreach.io/blog/powershell-remoting-from-linux-to-windows/
# Learn Windows PowerShell in a Month of Lunches https://www.books.com.tw/products/0010809471
sudo apt update
sudo apt install wget apt-transport-https software-properties-common
wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"
sudo dpkg -i packages-microsoft-prod.deb 
sudo apt update
sudo apt install powershell -y
