#!/bin/bash
#split -b 1M booktitle.txt booktitle_
# split -b may cause binary issue. -l for lines instead.
split -l 18650 booktitle.txt booktitle_
# then use online tools to convert booktitle_aa to booktitle_aa.epub
# https://ebook.online-convert.com/convert/txt-to-epub
