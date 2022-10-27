$output=$ARGV[0];
$record_min=$ARGV[1];
if (length ($record_min) == 1) {$record_min = '0'.$record_min;}
$url='https://mychannel.url/first.m3u8';

# ffmpeg 更新到 3.3.4 才能錄 https
system "/my/bin/ffmpeg -re -i $url -acodec copy -absf aac_adtstoasc -vcodec copy -t 00:$record_min:00 -y $output";
#system "timecode.sh $output $record_min";
