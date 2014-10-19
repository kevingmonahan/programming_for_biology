#!/usr/bin/perl
# file: add.pl
use strict;
use warnings;
my $a = shift;
my $b = shift;
if (defined $a and defined $b) {
    if ( $a < 0 or $b < 0) {
	print "Please provide two positive numbers.\n";
    }
    elsif (defined $a and defined $b) {
	print $a+$b, "\n";
    }
}
else {
    print "Please proved two numbers.\n"; 
}
