#!/usr/bin/perl
use warnings;
use strict;
my @array = ('a', 123, 'book', 'end');
my $ref = \@array;
print $ref,"\n";
print @{\@array}[1], "\n";
print @{$ref}[2],"\n";
