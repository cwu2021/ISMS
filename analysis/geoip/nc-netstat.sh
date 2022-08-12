#!/bin/bash
# https://www.linux-magazine.com/Issues/2021/250/Bash-Web-Server
while true;
  do echo \
   -e "HTTP/1.1 200 OK\n\n$(netstat)" \
  | nc -l -k -p 8080 -q 1;
done
