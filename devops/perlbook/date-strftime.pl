# https://www.gyata.ai/perl/perl-strftime
# perldoc POSIX
use POSIX 'strftime' ;
my $date = strftime "%Y-%m-%d", localtime ;
print $date,"\n" ;
# perldoc perlfunc for alternative way with localtime()
