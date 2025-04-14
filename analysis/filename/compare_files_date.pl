#!/usr/bin/perl
#use strict;
#use warnings;
# https://www.educba.com/perl-copy-file/
use File::Copy;

# $EXPR = `perldoc perlfunc`; # search for localtime EXPR
($sec,$min,$hour,$mday,$mon,$year) = localtime;
$year += 1900;
$mon += 1;
$mon = "0".$mon if $mon < 10;
$mday = "0".$mday if $mday < 10;
print "target path is:", "/mnt/mylog/$year/$mon/LOG_$mday.log \n";
# Copy the new file to the same directory as the old file
my $log_file = "/var/log/syslog";
my $new_file = "/tmp/syslog.now";
my $old_file = "/tmp/syslog";

copy($log_file, $new_file) or die "Failed to copy: $!";

# Compare the new file with the old file and print only new lines
open(my $fh_new, '<', $new_file) or die "Could not open file '$new_file': $!";
open(my $fh_old, '<', $old_file) or die "Could not open file '$old_file': $!";

while (my $line1 = <$fh_new>) {
        my $line2 = <$fh_old>;
        #last unless defined $line2;

    if ($line1 ne $line2) {
        print $line1;
    }
}

close($fh_new);
close($fh_old);

# Replace the old file with the new file
rename($new_file, $old_file) or die "Failed to rename: $!";
=begin endnote
(modified from the response of Phind)
```
This script does the following:

1. Copies the new file to the same directory as the old file.
2. Opens both files for reading.
3. Compares each line of the new file with the corresponding line in the old file.
4. Prints any lines that are different between the two files.
5. Finally, renames the new file to replace the old one.

To use this script:

1. Save it as compare_files.pl in the same directory as your new_file.txt and old_file.txt.
2. Run it using perl compare_files.pl.

Make sure you have the necessary permissions to read and write files in the directory where you're running the script.
