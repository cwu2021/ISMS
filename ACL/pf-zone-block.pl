=pod
Block countries on OpenBSD using pf
   Johnny Morano
   March 1, 2022
=cut
# download the latest country zone files
$russia = `curl -s https://www.ipdeny.com/ipblocks/data/countries/ru.zone > /etc/ru.zone`
$china = `curl -s https://www.ipdeny.com/ipblocks/data/countries/cn.zone > /etc/cn.zone`
=pod
   In the /etc/pf.conf, first add a table based on the files you have
   generated with the above statements:
# add a bad hosts table based on local disk text files
# one CIDR per line
table <badhosts> persist file "/etc/ru.zone" file "/etc/cn.zone"

# block bad IP addresses
block from <badhosts> to any
block from any to <badhosts>
