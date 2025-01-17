use POSIX;
$filename = "/mypath/myutf.ply";
$pattern = "STARTTIME";
$live = "LIVE";
#stackoverflow: how-can-i-decode-utf-16-data-in-perl-when-i-dont-know-the-byte-order
open($file,$filename) || die "error: $!\n";
while(<$file>) {
#stackoverflow: grep-a-pattern-in-file-using-perl-or-shell
        #print "$_" if (/STARTTIME\ 1/);
        $count+=1 if (/$pattern/);
}
close($file);
if ($count) {
open($file,$filename) || die "error: $!\n";
        while(<$file>) {
         print "$_" if (/$pattern/);
         print "$_" if (/$live/);
         }
#stackoverflow: how-do-i-get-a-files-last-modified-time
$epoch = (stat($file))[9];
#stackoverflow: quickly-getting-to-yyyy-mm-dd-hhmmss-in-perl
$mtime = strftime "%F %T" , localtime $epoch;
close($file);
# file -bi <filename>
print "encoding:iso-8859-1","\n";
print "modified time: ",$mtime,"\n";
} else {
open($file,"<:encoding(UTF-16)",$filename) || die "error: $!\n";
        while(<$file>) {
         print "$_" if (/$pattern/);
         print "$_" if (/$live/);
         }
$epoch = (stat($file))[9];
$mtime = strftime "%F %T" , localtime $epoch;
close($file);
print "encoding:utf-16le","\n";
print "modified time: ",$mtime,"\n";
}
