#!/bin/bash
#  https://serverfault.com/questions/505949/move-files-to-another-directory-which-are-older-than-a-date 
find /sourcedirectory -maxdepth 1 -mmin +365 -exec mv “{}” /destination/directory/ \;
# How to use "grep" command to find text including subdirectories
# https://askubuntu.com/questions/55325/how-to-use-grep-command-to-find-text-including-subdirectories
grep -rl "string" /path
