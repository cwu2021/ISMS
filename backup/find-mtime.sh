#!/bin/bash
# https://www.baeldung.com/linux/delete-files-older-than
find . -name /your/folder/*.avi -mtime +5 -delete
