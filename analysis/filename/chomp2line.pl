# Learning Perl, 5th Edition, p.88,24,135
# app may fail to start due to a really long input. BEWARE!

if ( ! open IPLIST, "/tmp/country.zone") {
 die "ip list not found! ($!)";
}
 $oneline = "STARTING";
while (<IPLIST>) {
 chomp;
 $oneline = $oneline . "," .  $_;
}
$_ = $oneline ;
s/STARTING,// ;
print $_, "\n"; 
