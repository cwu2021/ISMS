#!/bin/bash
# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/cask
brew install --cask docker
open /Applications/Docker.app
# https://blog.yowko.com/homebrew-docker/
docker run --rm -it --platform linux/amd64 rofrano/vagrant-provider:debian bash
# if you use the --platform linux/amd64 parameter Docker will run the Intel version for you.
# https://forums.docker.com/t/run-x86-intel-and-arm-based-images-on-apple-silicon-m1-macs/117123
# X11 with Docker on Mac
# https://medium.com/@mreichelt/how-to-show-x11-windows-within-docker-on-mac-50759f4b65cb
# https://www.xquartz.org/
# https://www.macrumors.com/2012/02/17/apple-removes-x11-in-os-x-mountain-lion-shifts-support-to-open-source-xquartz/
