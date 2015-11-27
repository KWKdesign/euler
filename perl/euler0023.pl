#! /usr/bin/perl

use 5.010;
use strict;
use warnings;
use Data::Dump;

=for comment

Non-abundant sums
Problem 23
A perfect number is a number for which the sum of its proper divisors is exactly equal to the number. For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.

Answer: 4179871

=cut

my $abundant = {};
my $found;
my $sum;
for ( my $i = 0; $i < 28123; $i++ ) {
	$abundant->{$i} = 1 if is_abundant( $i );
	$found = 0;
	foreach my $k ( sort( keys %$abundant ) ) {
		last if $k > $i;
		$found = 1 if ( $abundant->{ $i  - $k } );
	}
	$sum += $i unless $found;
}
say $sum;

use POSIX qw/ceil/;
sub is_abundant {
	my ( $n ) = @_;
	my $sum = 0;
	for ( my $i = 1; $i < ceil( $n / 2 ) + 1; ++$i ) {
		if ( $n % $i == 0 ) {
			$sum += $i;
		}
	}
	return 1 if $sum > $n;
	return 0;
}
