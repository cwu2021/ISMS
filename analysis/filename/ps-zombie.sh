# https://askubuntu.com/questions/111422/how-to-find-zombie-process
ps aux | grep 'Z'
pstree -p -s 93572
