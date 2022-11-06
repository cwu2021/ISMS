# https://metacpan.org/dist/Monitoring-Livestatus
# https://manpages.ubuntu.com/manpages/bionic/man3/Monitoring::Livestatus.3pm.html
# cpanm Monitoring::Livestatus
# dependency: Cpanel::JSON::XS . and Log::Log4perl below.
use warnings;
use strict;
use Data::Dumper;
use Getopt::Long;
use Pod::Usage;
use Time::HiRes qw( gettimeofday tv_interval );
use lib '/home/myuser/perl5/lib/perl5';
use Log::Log4perl qw(:easy);
#use lib 'lib';
#use lib '../lib';
use Monitoring::Livestatus;
# https://metacpan.org/release/NIERLEIN/Monitoring-Livestatus-0.84/source/exampl
es/test.pl
