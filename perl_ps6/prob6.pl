#!/usr/bin/perl
use warnings;
use strict;
my $FASTA = shift @ARGV;
my $seq_num = 0;
my @gene_name;
my @gene_desc;
my @gene_seq;
open (IN, '<', $FASTA) or die "Can't open file $FASTA\n";
while (my $line = <IN>){
    chomp $line;
    if ($line =~ />/) {
	$line =~ />(.*?)\s(.*)/;
	$gene_name[$seq_num] = $1;
	$gene_desc[$seq_num] = $2;
	$seq_num++;
    }
    else {
	$gene_seq[$seq_num] .= $line;
    }
}
my $count = scalar (@gene_name);
for (my $i=0; $i<$count; $i++){
    print "Extracted seq name: $gene_name[$i]\n";
    print "Extracted description: $gene_desc[$i]\n\n";
}
print STDERR "Done\n";
