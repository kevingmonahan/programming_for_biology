#!/usr/bin/perl
use strict;
use warnings;
my $a = shift @ARGV;
my $b = shift @ARGV;
(defined $a and defined $b) or die "Please provide two numbers.\n";
if ($b == 0){
    die "The divisor cannot be zero\n";
}
($a >= 0 and $b > 0) or die "Please provide two POSITIVE numbers.\n";
print "Quotient is: ",$a/$b,"\n";
