#!/usr/bin/perl
use warnings;
use strict;
use Math::Round;
#enter a number to be rounded as argument 1
my $number = shift @ARGV;
my $rounded = round($number);
print "$number rounds to $rounded\n";
