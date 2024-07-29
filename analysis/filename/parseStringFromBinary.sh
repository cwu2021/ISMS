#!/bin/bash
# apt install unrar
# unrar e mybin.rar
ls *.bin | while read LINE
do
cat $LINE | while read BINTXT
do
echo $BINTXT >> $LINE.txt
done
done
# https://stackoverflow.com/questions/15336386/count-the-number-of-occurences-of-binary-data
grep -a -c -P 'Live' *txt
