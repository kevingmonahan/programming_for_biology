#!/usr/bin/perl
use strict;
use warnings;
my $a = shift;
my $b = shift;
if (defined $a and defined $b){
    if ($a eq $b){
	print "Same.\n";
    }
    else {
	print "Different.\n";
    }
}
else {
    print "Please provide two strings.\n";
}
