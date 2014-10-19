#!/usr/bin/perl
use warnings;
use strict;
use Data::Dumper;
my $FASTA = shift @ARGV;
my $seq_num = -1;
my %genes;
my @gene_name;
my @gene_desc;
my @gene_seq;
open (IN, '<', $FASTA) or die "Can't open file $FASTA\n";
while (my $line = <IN>){
    chomp $line;
    if ($line =~ />/) {
        $seq_num++;
	$line =~ />(.*?)\s(.*)/;
        $gene_name[$seq_num] = $1;
        $gene_desc[$seq_num] = $2;      
    }
    else {
        $gene_seq[$seq_num] .= $line;
    }
}
my $count = scalar (@gene_name);
for (my $i=0; $i<$count; $i++){
    my $len = length $gene_seq[$i];
    $genes {$gene_name[$i]}{'desc'} = $gene_desc[$i];
    $genes {$gene_name[$i]}{'seq'} = $gene_seq[$i];
    $genes {$gene_name[$i]}{'len'} = $len;
}
print Dumper \%genes;
print STDERR "Done\n";
