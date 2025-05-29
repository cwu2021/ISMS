=pod
Perl Cookbook 3.2 Converting DMYHMS to Epoch Seconds
 - with standard module Time::Local
=cut
use Time::Local;
$year1 = "2024";
$mon1 = "7";
$mday1 = "19";
$year2 = "2025";
$mon2 = "5";
$mday2 = "24";
($sec,$min,$hour,$mday,$mon,$year) = localtime();
$time = timelocal($sec,$min,$hour,$mday,$mon,$year);
$time1 = timelocal(0,0,0,$mday1,$mon1-1,$year1-1900);
$time2 = timelocal(0,0,0,$mday2,$mon2-1,$year2-1900);
print $time,"\n";
print $time1,"\n";
print $time2,"\n";
print $time2-$time1,"\n";
$between = ($time2-$time1)/86400 ;
print $between,"\n";
