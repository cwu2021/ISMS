# https://perldoc.perl.org/Net::Ping
# https://perlmaven.com/open-and-read-from-files
# use Net::Ping;
#use v5.16;
# strict automatically applied with use.  use feature to avoid strict.
use feature qw(say);

open($fh, 'hosts.csv');
# https://stackoverflow.com/questions/57061492/perl-split-string-by-semi-colon-not-glob
#my $p = Net::Ping->new("icmp");
#$p->bind($my_addr); # Specify source interface of pings
for $line (<$fh>) { @var = split(/;/, $line) ;
say $var[-2] ;
#$host = $var[-1] ;
#chomp($host);
#    print "$host is ";
#    print "NOT " unless $p->ping($host, 2);
#    print "reachable.\n";
#    sleep(1);
}
#$p->close();
