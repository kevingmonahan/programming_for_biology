#!/usr/bin/perl
use strict;
use warnings;
my $file = shift @ARGV;
open (IN,'<',$file) or die "Can't open file: $file\n";
my %hash;
while (my $line = <IN>){
    chomp $line;
    if ($line) {
    my @input = split /\t/, $line;
    $hash{$input[0]} = $input[1];
}
    else{
	next}
}
foreach my $key (keys %hash) {
    my $len = length ($hash{$key});
    print "$key: $len","bp\n";
}
print  STDERR "Done\n"



