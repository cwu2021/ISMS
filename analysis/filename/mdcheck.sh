#/bin/bash
cat Accounts.csv | while read LINE
do
# grep -a for chinese characters
# http://lausai360.blogspot.com/2017/04/grep-binary-file-standard-input-matches.html
# https://www.everything-mdaemon.com/mdaemon/how-to-delete-all-disabled-accounts
echo $LINE | grep -a '0,0,C' | cut -d ',' -f1
# isForwarding.
echo $LINE | grep -a '0,1,Y' | cut -d ',' -f1
done
