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
my %gene = @fasta;
foreach my $name (keys %gene) {
    my $seq = $gene{$name};
    print "$name: $seq\n";
}
print  STDERR "Done\n"



