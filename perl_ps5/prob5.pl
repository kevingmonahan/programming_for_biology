#!/usr/bin/perl
use strict;
use warnings;
my $file = shift @ARGV;
open (IN,'<',$file) or die "Can't open file: $file\n";
my %hash;
my @input;
while (my $line = <IN>){
    chomp $line;
    my @input = split /\t/, $line;
    $hash{$input[0]} = $input[1];
}
foreach my $key (keys %hash) {
    print "$key\n";
}
print  STDERR "Done\n"



