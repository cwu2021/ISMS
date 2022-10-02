# Mastering Perl, page 11.

my $pattern = shift @ARGV;

my $regex = eval { qr/$pattern/ };
die "Check your pattern! $@" if $@;

print "Regex ---> $regex\n";

while ( <> )
        {
        print if m/$regex/;
        }
