#!/usr/bin/perl
# https://www.giac.org/paper/gsec/3602/practical-perl-security-practitioners/105856
# This source code is original source code written by Holt Sorenson
# for the SANS GIAC GSEC practical, v1.4b Option 1.
# It was written using PERL 5.8.0 on Debian GNU/Linux 3.0.
# this is a quick hack, so 'use strict' is lazily omitted.
# this program works best when one has a machine on the broadcast domain
# that the spoof is attempted from, however one is easy to find
# the closer one is to the destination. When one is distant and
# using a network administrated by a clueful network group,
# egress filtering can make spoofing difficult, if not impossible
# import the Net::RawIP module
use Net::RawIP;
# $raw_net gets a Net::RawIP instance initialized for ICMP
$raw_net = new Net::RawIP({icmp =>{}});
$raw_net -> set(
 {
 ip =>
 {
 # spoof 192.168.127.1 to 192.168.127.149
 # 192.168.127.1 will get echo-replies from
 # 192.168.127.149 even though it never sent
 # echo-requests
 saddr => '192.168.127.1',
 daddr => '192.168.127.149'
 },
 icmp =>
 {
 # this is an echo-request
 type => 8,
 # some regular data that makes the packet easy
 # to identify when monitoring the wire with a
 # sniffer
 data => "460ae5dfaf7b03ef4978ff39939a442d".
 "6ecabd01faef60a26fed7e2997c4416a".
 "c0934a8eaa32582f68f8eb28fa6276b9" x 4;
 }
 }
 );
# send 5 packets (x), 1 per second (y)
#
# $raw_net -> send(y,x);
#
$raw_net -> send(1,5);
