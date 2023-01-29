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
