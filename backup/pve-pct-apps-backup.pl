$date = '20250302';
$backup = '/root/backup';
#`pct list` for container info
#`pct enter $vmid` to `tar zcvf $name.$app.root.$date.tar.gz` firt!

$vmid = '101';
$name = 'ct01';
$app = 'ffmpeg';
#$cmd = `pct pull $vmid /$name.$app.root.$date.tar.gz $backup/$name.$app.root.$date.tar.gz`; 
#print $cmd ;

$vmid = '102';
$name = 'ct02';
$app = 'recorder';
$cmd = `pct pull $vmid /$name.$app.root.$date.tar.gz $backup/$name.$app.root.$date.tar.gz`;
print $cmd ;
