#!/usr/bin/perl
use warnings;
use strict;
my %hash = ('a' => 123, 'book' => 'end');
my $ref = \%hash;
print $ref,"\n";

my $key = 'book';
my $mate = ${$ref}{$key};
print "The key: $key\nPairs with: $mate\n";
