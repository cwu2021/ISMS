pftop -f syntax # (=tcpdump) 
# https://stackoverflow.com/questions/23782333/tcpdump-filter-src-dst-port
tcpdump -i any -vvv -s0 port 5060 and (not src port 5060 and not dst port 5061)
# Network Traffic Troubleshooting Tool
The eBPF-based Ptcpdump replaces the legacy tcpdump, offering extensive CLI compatibility and the ability to display process information
# Maltrail is a free tool that can be a useful addition in your search for would-be attackers on your network.