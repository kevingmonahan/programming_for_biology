#!/usr/bin/perl
use strict;
use warnings;
#parse a fasta formatted file into a hash
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
my %gene = @fasta;
foreach my $name (keys %gene) {
    my $seq = $gene{$name};
    print "$name: $seq\n";
} 
print STDERR "Done\n"



