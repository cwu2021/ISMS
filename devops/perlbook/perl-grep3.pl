# Mastering Perl, page 11.

my $pattern = shift @ARGV;

my $regex = eval { qr/$pattern/ };
die "Check your pattern! $@" if $@;

print "Regex ---> $regex\n";

while ( <> )
        {
        print if m/$regex/;
        }

# https://askubuntu.com/questions/467896/how-to-correctly-invoke-awk-in-perl-to-print-out-the-3rd-last-field-in-a-line
my $line="1 2 3 4 5 6 7";
my @tab = split(/\s+/, $line);
print $tab[-3],"\n";