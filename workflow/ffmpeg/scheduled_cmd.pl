use Time::Local;

# scheduled time.
$sch_hour = '15';
$sch_min = '0';

($sec, $min, $hour, $mday, $mon, $year)=localtime;
$UTC = timelocal($sec, $min, $hour, $mday, $mon, $year);
$UTC2 = timelocal(0, $sch_min, $sch_hour, $mday, $mon, $year);

if (($UTC2-$UTC) <= 0) {
         $UTC2 = $UTC2 + 86400;
}

#print "sleep $UTC2-$UTC seconds..\n";
sleep $UTC2-$UTC;
`./your_local_cmd`
