#!/usr/bin/perl
use warnings;
use strict;
my $input = shift @ARGV;
my $name = shift @ARGV;
my $out = $name.'.txt'; 
open (IN, '<', $input) or die "Can't open file $input\n";
open (OUT, '>', $out);
while (my $line = <IN>){
    chomp $line;
    $line =~ s/Nobody/$name/g;
    print OUT $line,"\n";
}

