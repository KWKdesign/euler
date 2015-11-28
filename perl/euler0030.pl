#! /usr/bin/perl

use 5.010;
use strict;
use warnings;

=for comment

Digit fifth powers
Problem 30
Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 14^4 + 64^4 + 34^4 + 44^4
8208 = 84^4 + 24^4 + 04^4 + 84^4
9474 = 94^4 + 44^4 + 74^4 + 44^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.

=cut

my $power = 5;
# max number to check ( n +1 ) * ( 9 ^ 5 )
my $upper = ( $power + 1 ) * ( 9 ** 5 );
my $sum = 0;
for ( my $i = 2; $i < $upper; $i++ ) {
	my $x = 0;
	foreach my $digit ( split( '', $i ) ) {
		$x += $digit ** $power;
	}
	$sum += $i if $x == $i;
	say $i if $x == $i;
}
say $sum;
