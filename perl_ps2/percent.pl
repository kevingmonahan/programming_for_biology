#!/usr/bin/perl
use strict;
use warnings;
my $i = shift;
my $j = shift;
if ($i + $j == 0) {
    print "You are trying to trick me.\n";
}
else {
   my $p = $i/($i+$j)*100;
   my $n = sprintf '%.2f' , $p;
   print $n, " %\n" 
} 

