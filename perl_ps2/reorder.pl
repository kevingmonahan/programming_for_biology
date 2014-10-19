#!/usr/bin/perl
use strict;
use warnings;
my $a = shift;
my $b = shift ;
if ($a lt $b){
    print $a, " ", $b, "\n";
}
else {
    print $b, " ", $a, "\n";
}
