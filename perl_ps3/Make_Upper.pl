#!/usr/bin/perl
use strict;
use warnings;
my $a = shift @ARGV;
my $b = shift @ARGV;
open(IN,'<',$a) or die "can't open $a: $!\n";
open(OUT,'>',$b) or die "can't open $b: $!\n"; 
while (my $line= <IN>){
    chomp $line;
    my $line_uc=uc($line);
    print OUT $line_uc,"\n";
}

