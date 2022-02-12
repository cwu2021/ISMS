#!/usr/bin/perl
# https://www.giac.org/paper/gsec/3602/practical-perl-security-practitioners/105856
# This source code is original source code written by Holt Sorenson
# for the SANS GIAC GSEC practical, v1.4b Option 1.
#
# It was written using PERL 5.8.0 on Debian GNU/Linux 3.0.
use strict;
# test for MS03-039, sid: 2252
use IO::Socket::INET;
{
 my $peer = "192.168.253.51";
 my $port = "445";
 my ($dcerpc_str, $S) = ();
 # pad character
 my $pc = "\xa4";
 $S = IO::Socket::INET->new(PeerAddr => $peer,
 PeerPort => $port,
 PeerProto => 'tcp');
 if (defined($S))
 {
 print "sending dcerpc bits to $peer at $port\n";
$dcerpc_str =
 # content:"|FF|SMB|25|";
 # nocase;
 # offset:4;
 # depth:5;
 $pc x 4 . "\xffSMB\x25" . 


 # content:"|26 00|";
 # distance:56;
 # within:2;
 $pc x 56 . "\x26\x00" .

 # content:"|5c 00|P|00|I|00|P|00|E|00 5c 00|";
 # nocase;
 # distance:5;
 # within:12;
 $pc x 5 .
 "\x5c\x00P\x00I\x00P\x00E\x00\x5c\x00" .

 # content:"|05|";
 # distance:0;
 # within:1;
 "\x05" .

 # content:"|0b|";
 # distance:1;
 # within:1;
 # byte_test:1,&,1,0,relative;
 $pc . "\x0b" . "\x01" .

 # content:"|B8 4A 9F 4D 1C 7D CF 11 86 1E 00 20 AF 6E 7C 57|";
 # distance:29;
 # within:16;
 $pc x 28 .
 "\xb8\x4a\x9f\x4d\x1c\x7d\xcf\x11\x86\x1e" .
 "\x00\x20\xaf\x6e\x7c\x57" . $pc x 5;
 print $S $dcerpc_str;
 }
 else
 {
print "unable to connect to $peer at $port\n";
 }
}
