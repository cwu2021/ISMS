#!/bin/bash
cat server.list | while read $SERVER
do
# https://stackoverflow.com/questions/9393038/ssh-breaks-out-of-while-loop-in-bash
ssh $USER@$SERVER tail my.log < /dev/null
done
