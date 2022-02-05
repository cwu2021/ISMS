#!/usr/bin/perl
# https://www.giac.org/paper/gsec/3602/practical-perl-security-practitioners/105856
# This source code is original source code written by Holt Sorenson
# for the SANS GIAC GSEC practical, v1.4b Option 1.
#
# It was written using PERL 5.8.0 on Debian GNU/Linux 3.0.
# rudimentary dns version query tool
use strict;
use IO::Socket::INET;
{
my ($lhs_hex, $rhs_chars) = ();
# set up format to for the query response
format QUERY_RESP =
@<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< @<<<<<<<<<<<<<<<
$lhs_hex, $rhs_chars
 my ($qstr, $s, $buf) = ();
 my (@lxbuf, @lbuf, $t, $ctr) = ();
 my $host = "ns-int.isc.org";
 # query string from packet dump
 $qstr = "\x00\x1e\xd3\x10\x01\x00\x00\x01\x00\x00\x00\x00\x00" .
 "\x00\x07\x76\x65\x72\x73\x69\x6f\x6e\x04\x62\x69\x6e" .
 "\x64\x00\x00\x10\x00\x03";
 # init socket to $host
 $s = IO::Socket::INET->new (PeerAddr => $host,
PeerPort => '53',
Proto => 'tcp') ||
 die "Can't initialize socket: $!";
 # send query string
 $s->send($qstr);
 # grab data that has returned from the host
 $s->recv($buf, 1024);
 # recv didn't return anything
 if (length($buf) == 0)
 {
print("peer didn't respond to query.\n");
 }
 # recv returned data in $buf, print it out
 else
 {
print("query response for $host:\n");
# set current format to QUERY_RESP
$~ = "QUERY_RESP";
$ctr = 1;
# processing each char in buffer
foreach $t (split(/ */, $buf))
{
 # printable chars go into line buffer
 if (ord($t) >= 21 && ord($t) <= 127)
 {
push(@lbuf, $t);
 }
 # non-printable chars get replaced with a "." (\x2e)
 else
 {
push(@lbuf, ".");
 }
 # put hex value of char into line hex buffer
 push(@lxbuf, sprintf("%02x", ord($t)));
 # print full lines and re-init line buffers
 if ($ctr % 16 == 0)
 {
$lhs_hex = join(' ', @lxbuf);
$rhs_chars = join('', @lbuf);
# output query response based on current format which is
 # set to QUERY_RESP
write;
(@lbuf, @lxbuf, $lhs_hex, $rhs_chars) = ();
 }
 $ctr++;
}
# print any extras not already printed out
$lhs_hex = join(' ', @lxbuf);
$rhs_chars = join('', @lbuf);
# output query response based on current format which is set to
# QUERY_RESP
write;
 }
}
