#!/usr/bin/perl
use strict;
use warnings;
my $file = shift @ARGV;
my $input = "";
open (IN,'<',$file) or die "Can't open file: $file\n";
while (my $line = <IN>){
    chomp $line;
    if (index($line,'>')==0){
        $line .= '>';
    }
    $input .= $line;
}
my @fasta = split(/>/,$input);
shift @fasta;
my %codon_table;
my $string = $fasta[1];
my $len = length ($string);
my $units = int($len / 3);
for (my $i = 0; $i < $units; $i++) {
   my $codon = substr($string,$i,3);
   $codon_table{$codon}++; 
}
foreach my $key (keys %codon_table) {
    my $count = $codon_table{$key};
    print "$key: $count","\n";
}
print  STDERR "Done\n"



