#!/bin/bash
# https://serverfault.com/questions/505949/move-files-to-another-directory-which-are-older-than-a-date 
# find /sourcedirectory -maxdepth 1 -mmin +365 -exec mv “{}” /destination/directory/ \;
# this mv may be better: https://unix.stackexchange.com/questions/154818/how-to-integrate-mv-command-after-find-command
find path_A -name '*AAA*' -exec mv -t path_B {} +
# How to use "grep" command to find text including subdirectories
# https://askubuntu.com/questions/55325/how-to-use-grep-command-to-find-text-including-subdirectories
grep -rl "string" /path
