#!/usr/bin/perl
use strict;
use warnings;
my @seq = ('ATGCCCGGCCCGGC', 'GCGTGCTAGCAATACGATAAACCGG' , 'ATATATATCGAT' , 'ATGGGCCC');
my @sorted_seq = sort (@seq);
print "Sorted sequence is @sorted_seq\n";

