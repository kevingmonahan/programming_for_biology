#!/usr/bin/perl
use strict;
use warnings;
use parse_FASTA;

#changes line length of a fasta file
#outputs fasta file with specified line length to STDOUT
#takes original fasta file and line length as arguments

my $file = shift @ARGV;
my $length = shift @ARGV;
my @fasta = parse_FASTA($file);
my %genes = @fasta;
foreach my $gene (keys %genes) {
    my @formatted = reformat_seq($genes{$gene},$length);
    print ">","$gene\n";
    print join("\n",@formatted),"\n";
}


#print STDERR "done";


