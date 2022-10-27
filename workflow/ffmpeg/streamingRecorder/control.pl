use Date::Calc qw(Day_of_Week);
$filepath = '/my/filepath';

# scan configuration ini
open CONFIG, "Recorder_schedule.ini" or die "No Recorder_schedule.ini!!!";
open MYLOG, ">>$filepath/Recorder.log";
while (<CONFIG>) {
 chomp; # no new line
 s/#.*//; # no comments
 s/^\s+//; # no loading white
 s/\s+$//; # no trailing white
 next unless length; # anything left?
 my ($sdow,$start,$duration) = split(/,/,$_,3);
 my ($starthour,$startmin) = split(/:/,$start,2);
 
 #$duration_sec = 60*$duration;
($now_sec,$now_min,$now_hour,$now_day,$now_mon,$now_year)=localtime(time);
$now_mon++;
$now_year+=1900;
$now_dow = Day_of_Week($now_year,$now_mon,$now_day);

# Start and stop recording here.
if ($now_dow == $sdow and $now_hour == $starthour and $now_min == $startmin) {
 if (length ($now_mon) == 1) {$now_mon = '0'.$now_mon;}
 if (length ($now_day) == 1) {$now_day = '0'.$now_day;}
 if (length ($now_hour) == 1) {$now_hour = '0'.$now_hour;}
 if (length ($now_min) == 1) {$now_min = '0'.$now_min;}
 print MYLOG "RECORDING STARTS at $now_hour:$now_min, Day $now_dow ...\n";
 system "perl ffmpeg-recorder.pl $filepath/MYCHANNEL-$now_year-$now_mon-$now_day-$now_hour-$now_min.mp4 $duration";
# sleep($duration_sec);
 print MYLOG "RECORDING STOPS.\n";
# system 'killall ffmpeg';
  }

 }
