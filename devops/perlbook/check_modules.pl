# Programming with Perl Modules, p14.
# perldoc perlfaq3
# apt install cpanminus
use lib '/home/myuser/perl5/lib/perl5';
# perl -le "print for @INC"
# Intermediate Perl, p20.
# BEGIN { unshift @INC, '/home/myuser/lib'; }
use ExtUtils::Installed;
my $inst = ExtUtils::Installed->new();
my @modules = $inst->modules();
#print "$_\n"for @modules;
print "$_ " for @modules
