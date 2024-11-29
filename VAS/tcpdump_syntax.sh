pftop -f syntax # (=tcpdump) 
# https://stackoverflow.com/questions/23782333/tcpdump-filter-src-dst-port
tcpdump -i any -vvv -s0 port 5060 and (not src port 5060 and not dst port 5061)
