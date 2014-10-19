#!/usr/bin/perl
use strict;
use warnings;
$a = shift;
$b = shift;
if ($a lt $b) {
    print "Right order.\n";
} 
elsif ($a eq $b) {
    print "Same.\n";
}
else {
    print "Wrong order.\n";
}
