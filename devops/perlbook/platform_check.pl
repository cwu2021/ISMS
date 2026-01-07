use strict;
use warnings;
use Config;
use POSIX qw(uname);

# Get the operating system name using Config module
my $os_name = $Config{osname};

# Get the operating system version using Config module
my $os_version = $Config{osvers};

# Get the operating system name using POSIX module
my $posix_os_name = uname();

# Print the detected platform information
print "Operating System Name (Config): $os_name\n";
print "Operating System Version (Config): $os_version\n";
print "Operating System Name (POSIX): $posix_os_name\n";

# Determine the type of operating system
if ($os_name =~ /win/i) {
    print "Platform: Windows\n";
} elsif ($os_name =~ /darwin/i) {
    print "Platform: Mac OS\n";
} elsif ($os_name =~ /linux|unix|aix/i) {
    print "Platform: Unix/Linux\n";
} else {
    print "Platform: Unknown\n";
}
