#!/bin/bash
#  https://serverfault.com/questions/505949/move-files-to-another-directory-which-are-older-than-a-date 
find /sourcedirectory -maxdepth 1 -mmin +365 -exec mv “{}” /destination/directory/ \;
