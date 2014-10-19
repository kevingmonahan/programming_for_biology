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
    $genes {$gene_name[$i]}{'seqs'} = $gene_seq[$i];
    $genes {$gene_name[$i]}{'zlen'} = $len;
}
print "Name\tDesc\tSeq\tLen\n";  
foreach my $gene ( keys %genes) {
    my %nt_count;
    print "$gene\t";
    foreach my $int_key (sort( keys % { $genes{$gene}})) {
	my $info = $genes{$gene} {$int_key};
	print "$info\t";
    }
    print "\n";
    my $seq = $genes{$gene} {'seqs'};
    my @nucs = split (//, $seq);
    foreach my $nuc (@nucs){
	$nt_count{$nuc}++;
    }
    my $nts = \%nt_count;
    $genes{$gene}{'nt_count'} = $nts;
    my $GC_perc = GCcont ($gene);
    $genes{$gene}{'GC_perc'} = $GC_perc;
}


sub GCcont {
    my $gene = shift;
    my $GC = ($genes{$gene}{'nt_count'}{'G'}) + ($genes{$gene}{'nt_count'}{'C'});
    my $GC_cont = 100*($GC/($genes{$gene}{'zlen'}));
    return $GC_cont;
}

print Dumper \%genes;
print STDERR "Done\n";
