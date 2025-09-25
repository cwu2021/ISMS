$vmid = "123" ;
$mydir = "/path/to/my/dir" ;
$task = `vzdump $vmid --compress lzo --dumpdir $mydir` ;
# if sftp dump files stalled, vm network may be disconnected!
print $task ;
# The ratarmount archive mounting tool offers fast, random access to archived resources.