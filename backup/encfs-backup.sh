#!/bin/bash
encfs ~/.encrypted ~/decrypted
fusermount -u ~/decrypted
# How likely is it to have encFS not recognize a valid password? #442
# https://github.com/vgough/encfs/issues/442
reboot
