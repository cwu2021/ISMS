# apt install libmoose-perl
# perl -le "print for @INC"
# Intermediate Perl, p20.
BEGIN { unshift @INC, '/home/myuser/lib'; }
use Horse;
use v5.10;

my $talking = Horse->new( name => "Mr. Ed" );
$talking->color( "grey" ); #color setup

say $talking->name, ' is colored ', $talking->color;

=pod
# https://stackoverflow.com/questions/3828205/how-do-i-enter-a-multi-line-comment-in-perl
# Here's the Horse.pm from Intermediate Perl, p286.
package Horse;
use Moose;
use namespace::autoclean;

has 'name' => (is => 'rw' );
has 'color' => (is => 'rw' );

__PACKAGE__->meta->make_immutable;

1;
=cut
