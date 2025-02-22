#use POSIX;
$filename = "/var/log/LogView";
$pattern = "reschedule";
#stackoverflow: how-can-i-decode-utf-16-data-in-perl-when-i-dont-know-the-byte-order
open($file,$filename) || die "error: $!\n";
while(<$file>) {
#stackoverflow: grep-a-pattern-in-file-using-perl-or-shell
#stackoverflow.com//perl-split-a-string-using-a-string-based-delimiter
	if(/$pattern/) { 
	@literal = split ':', $_ ; 
	$count[$literal[0]] = $count[$literal[0]] + 1 ;
	}
}
# grep ^00: $filename | grep $pattern | wc -l
print "Time series of $pattern : \n";
print $_,";" foreach @count;
print "\n";
close($file);
# count specific logs every hour and plot as bar chart on terminal with perl
`pip3 install termgraph`
# computingforgeeks.com/termgraph-command-line-tool-draw-graphs-in-termin
