#! /usr/bin/perl

use 5.010;
use strict;
use warnings;
use Data::Dump qw/dd/;

=for comment

Lexicographic permutations
Problem 24
A permutation is an ordered arrangement of objects. For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4. If all of the permutations are listed numerically or alphabetically, we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?

=cut

use Math::BigInt lib => 'FastCalc';
sub fact { return Math::BigInt->new( $_[0] )->bfac() }

my $digits = [ 0 .. 9 ];
# Find the millionth directly instead of brute-forcing
my $answer;

my $remain = 1000000 - 1; # how many permutations left
# find first digit of target permutation
for ( my $i = 1; $i < 10; $i++ ) {
	# 9! = 362880 ways to arrange it with the same first digit
	my $j = $remain / fact( 10 - $i );
	# divide and round down for index of Xth digit
	$remain = $remain % fact( 10 - $i );
	$answer .= $digits->[$j];
	splice( @$digits, $j, 1 );
	last if $remain == 0;
}
$answer .= shift @$digits;

say $answer;