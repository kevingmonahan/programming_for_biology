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
my %gene_info;
$gene_info{$fasta[0]} = $fasta[1];
$gene_info{$fasta[2]} = $fasta[3];
$gene_info{$fasta[4]} = $fasta[5];
$gene_info{$fasta[6]} = $fasta[7];
$gene_info{$fasta[8]} = $fasta[9];
foreach my $key (keys %gene_info) {
    print "$key\n";
} 




