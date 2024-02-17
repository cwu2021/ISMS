#!/bin/bash
# https://github.com/anbox
# https://docs.darlinghq.org/build-instructions.html
# https://github.com/darlinghq/darling
# https://www.darlinghq.org/

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# ==> Next steps:
# - Run these two commands in your terminal to add Homebrew to your PATH:
#     (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> /Users/ubuntu/.bash_profile
#     eval "$(/usr/local/bin/brew shellenv)"
# - Run brew help to get started
# - Further documentation:
#     https://docs.brew.sh

# htop cab also built ok.
# https://stackoverflow.com/questions/66891968/clang-error-invalid-version-number-in-mmacosx-version-min-11-2
export SYSTEM_VERSION_COMPAT=1 (other build err occured)
# https://stackoverflow.com/questions/21272479/how-can-i-find-out-if-i-have-xcode-commandline-tools-installed/21272675
pkgutil --pkg-info=com.apple.pkg.CLTools_Executables
