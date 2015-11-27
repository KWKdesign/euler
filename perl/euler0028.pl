#! /usr/bin/perl

use 5.010;
use strict;
use warnings;

=for comment

Number spiral diagonals
Problem 28
Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

21 22 23 24 25
20  7  8  9 10
19  6  1  2 11
18  5  4  3 12
17 16 15 14 13

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

=cut

my $size = 1001;
my $sum = 1; # f(1) = 1
# Length of side starts at three and grows by two
for ( my $i = 3; $i <= $size; $i += 2 ) {
	# NE Corner
	$sum += $i**2;
	# NW Corner
	$sum += $i**2 - ( $i - 1 );
	# SW Corner
	$sum += $i**2 - 2 * ( $i - 1 );
	# SE Corner
	$sum += $i**2 - 3 * ( $i - 1 );
}
say $sum;
