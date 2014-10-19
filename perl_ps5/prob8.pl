#!/usr/bin/perl
use strict;
use warnings;
my $input = "";
my $file = shift @ARGV;
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

print "\nNow sorted by gene name:\n";

foreach my $name (sort(keys %gene)) {
    my $seq = $gene{$name};
    print "$name: $seq\n";
}

print "\nNow sorted by sequence length\n";

foreach my $name (sort{length($gene{$a}) <=> length($gene{$b})} (keys %gene)) {
	my $seq = $gene{$name};
	my $len = length($gene{$name}); 
	print "$name: $seq\n","Length = $len","\n";
}

print "\nNow sorted by sequence length, biggest to smallest\n";

foreach my $name (sort{length($gene{$b}) <=> length($gene{$a})} (keys %gene)) {
    my $seq = $gene{$name};
    my $len = length($gene{$name});
    print "$name: $seq\n","Length = $len","\n";
}
print  STDERR "Done\n";



