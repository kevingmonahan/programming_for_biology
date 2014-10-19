#!/usr/bin/perl
use strict;
use warnings;
#parse a fasta formatted file into an array of sequence names and a correspond
my $file = shift @ARGV;
my $input = "";
open (IN,'<',$file);
while (my $line = <IN>){
    chomp $line;
    if (index($line,'>')==0){
        $line .= '>';
    }
    $input .= $line;
}
my @fasta = split(/>/,$input);
shift @fasta;
my %gene_info = (
    $fasta[0] => $fasta[1],
    $fasta[2] => $fasta[3],
    $fasta[4] => $fasta[5],
    $fasta[6] => $fasta[7],
    $fasta[8] => $fasta[9]);
foreach my $key (keys %gene_info) {
    print "$key\n";
} 




