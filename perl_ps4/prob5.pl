#!/usr/bin/perl
use strict;
use warnings;
my @numbers = (101,2,15,22,95,33,2,27,72,15,52);
print "The starting array is ", "@numbers\n";
my $last = pop(@numbers);
print "The array is ", "@numbers", " if ", $last," is popped off\n";  
push (@numbers, 52);
my $first = shift(@numbers);
print "The array is ", "@numbers", " if ", $first," is shifted off\n";
unshift (@numbers, 101);
push (@numbers, 12);
print "The array is ", "@numbers", " if 12 is pushed on\n";
pop(@numbers);
unshift (@numbers, 4);
print "The array is ", "@numbers", " is 4 is unshifted on\n";
