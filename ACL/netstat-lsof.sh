#!/bin/bash
# no netstat environment https://www.cyberciti.biz/faq/unix-linux-check-if-port-is-in-use-command/
lsof -i -P -n | grep LISTEN
