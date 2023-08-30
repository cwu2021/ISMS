#!/usr/bin/perl
# perl v5.36.0 on Ubuntu 23.04 (lunar)
# apt install libproc-daemon-perl
# epel Perl(proc::daemon) Download (RPM)
# yum install perl-Proc-Daemon
use LWP::UserAgent;
use HTTP::Request;
use HTTP::Response;
use Proc::Daemon;

# retrieving ts from m3u url
# apt install wget
$URL = $BaseURL."playlist.m3u8?wowzasessionid=".$session_id;
$command = `wget -t 3 $tsfile -O $savefile`;
