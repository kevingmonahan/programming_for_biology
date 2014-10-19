#!/usr/bin/perl
use strict;
use warnings;
my $sequence = 'GCGTGCTAGCAATACGATAAACCGG';
my @basewise = split(//,$sequence);
my $original = join ('-',@basewise);
my $len = scalar (@basewise);
for (my $i=0;$i<($len);$i++){
    my $randA=int(rand($len));
    my $randB=int(rand($len));
    ($basewise[$randA],$basewise[$randB]) = ($basewise[$randB],$basewise[$randA]);
}
my $shuffled = join ('-',@basewise);
print "Original sequence is $original\n";
print "Shuffled sequence is $shuffled\n";
