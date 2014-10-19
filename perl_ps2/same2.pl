#!/usr/bin/perl
use strict;
use warnings;
my $a = shift;
my $b = shift;
my $a_uc = uc($a);
my $b_uc = uc($b);
if (defined $a and defined $b){
    if ($a_uc eq $b_uc){
	print "Same.\n";
    }
    else {
	print "Different.\n";
    }
}
else {
    print "Please provide two strings.\n";
}
