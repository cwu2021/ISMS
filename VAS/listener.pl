#!/usr/bin/perl
# https://www.giac.org/paper/gsec/3602/practical-perl-security-practitioners/105856
# This source code is original source code written by Holt Sorenson
# for the SANS GIAC GSEC practical, v1.4b Option 1.
#
# It was written using PERL 5.8.0 on Debian GNU/Linux 3.0.
use strict;
use Getopt::Long;
use IO::Socket::INET;
use POSIX qw(geteuid);
use vars qw($g_laddr $g_port $g_proto);
sub proc_args()
{
 my $ret = 1;
 GetOptions(
 'addr=s' => \$g_laddr,
 'port=s' => \$g_port,
 'proto=s' => \$g_proto
 );
 if (!defined($g_port))
 {
 print "--port not specified. Unable to continue.\n";
 $ret = 0;
 }
 if (!defined($g_proto) && $ret)
 {
 print "Setting --proto to default protocol \"tcp\".\n";
 $g_proto = 'tcp';
 }
 return ($ret);
}
# begin "main"
{
my ($lhs_hex, $rhs_chars) = ();
# set up format for PEER_DATA
format PEER_DATA =
@<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< @<<<<<<<<<<<<<<<
$lhs_hex, $rhs_chars
.
 my (@lxbuf, @lbuf, $t, $ctr) = ();
 my ($S, $P, $buf) = ();
 my $ret = 0;
 if (!&proc_args())
 {
 $ret = 1;
 }
 elsif ($g_port <= 1023 && geteuid() != 0)
 {
 print "Unable to bind to ports <= 1023 when non-root.";
 print " Exiting.\n";
 $ret = 1;
 }
 else
 {
 if (defined($g_laddr))
 {
 # bind to --addr ($g_laddr)
 $S = IO::Socket::INET->new(Listen => 1,
 LocalAddr => $g_laddr,
 LocalPort => $g_port,
 Proto => $g_proto,
 ReuseAddr => 1
 );
 }
 else
 {
 # bind to INADDR_ANY
 $S = IO::Socket::INET->new(Listen => 1,
 LocalPort => $g_port,
 Proto => $g_proto,
 ReuseAddr => 1
 );
 }
if (defined($S))
 {
 print "Listening socket created. Blocking on accept().\n";
 while ($P = $S->accept())
 {
 printf "Connection accepted from %s/%d.",
 inet_ntoa($P->peeraddr()), $P->peerport();
 print " receiving data: \n";
 $P->recv($buf, 1024, '');
 # set current format to PEER_DATA
 $~ = "PEER_DATA";
 $ctr = 1;
 # processing each char in buffer
 foreach $t (split (//, $buf))
 {
 # printable chars go into line buffer
 if (ord($t) >= 21 && ord($t) <= 127)
 {
 push (@lbuf, $t);
 }
 # non-printable chars get replaced with a
 # "." (\x2e)
 else
{
 push (@lbuf, ".");
 }
 # put hex value of char into line hex buffer
 push (@lxbuf, sprintf("%02x", ord($t)));
 # print full lines and re-init line buffers
 if ($ctr % 16 == 0)
 {
 $lhs_hex = join (' ', @lxbuf);
 $rhs_chars = join ('', @lbuf);
 # output remote response based on current
# format which is set to PEER_DATA
 write;
 (@lbuf, @lxbuf, $lhs_hex, $rhs_chars) = ();
 }
 $ctr++;
 }
 # print any extras not already printed out
 $lhs_hex = join (' ', @lxbuf);
 $rhs_chars = join ('', @lbuf);
 write;
 (@lbuf, @lxbuf, $lhs_hex, $rhs_chars) = ();
 print "Closing connection.\n\n";
 $P->close();
 }
 }
 else
{
 print "unable to bind to $g_port on addr $g_laddr." .
 "Exiting.\n";
 last;
 }
 }
 exit($ret);
}
# end "main"
# perltidy -pt=2 -bl -fnl, more or less
