#!/bin/bash
# https://blog.gtwang.org/useful-tools/how-to-use-vim-as-a-hex-editor
vim roster.dat
# :%! xxd (to enter HEX mode, change 0012 to 9912 = 9*16+9 = lv153 for example)
# :%! xxd -r (to exit HEX mode)
