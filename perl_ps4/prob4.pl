#!/usr/bin/perl
use strict;
use warnings;
my @numbers = (101,2,15,22,95,33,2,27,72,15,52);
my @stand_sort_numbers = sort (@numbers) ;
print "@stand_sort_numbers\n";
my @num_sort_numbers = sort {$a <=> $b} (@numbers);
print "@num_sort_numbers\n";
my @rev_num_sort_numbers = sort {$b <=> $a} (@numbers);
print "@rev_num_sort_numbers\n";

