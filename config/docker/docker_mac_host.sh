#!/bin/bash
# https://brew.sh/
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/cask
brew install --cask docker
open /Applications/Docker.app
# https://blog.yowko.com/homebrew-docker/
