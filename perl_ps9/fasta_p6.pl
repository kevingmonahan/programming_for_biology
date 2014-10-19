#!/usr/bin/perl
use warnings;
use strict;
use Data::Dumper;
my $FASTA = shift @ARGV;
my $gc_cutoff = 51;
my $seq_num = -1;
my %genes;
my @gene_name;
my @gene_desc;
my @gene_seq;
open (IN, '<', $FASTA) or die "Can't open file $FASTA\n";
open (OUT, '>', 'highGC.fasta') or die "Can't write file\n";
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
foreach my $gene ( keys %genes) {
    my %nt_count;
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
my ($tally, $array_of_highGC) = GC_filter (\%genes , $gc_cutoff);
print "Nuber of genes above GC cutoff of $gc_cutoff \%: $tally\n";
my @arrays = @{$array_of_highGC};
foreach my $part (@arrays) {
    my @part = @{$part};
    my @output = $part[1] =~ /(.{60})/g;
    print OUT ">",$part[0],"\n";
    print OUT join("\n",@output,"\n");
}
print "Name\tDesc\tSeq\tLen\n";
foreach my $gene ( keys %genes){
    print "$gene\t";
    foreach my $int_key (sort( keys % { $genes{$gene}})) {
	my $info = $genes{$gene} {$int_key};
	print "$info\t";
    }
    print "\n";
}

sub GC_filter {
    my @hits;
    my $count = 0;
    my $hash_name = shift;
    my %hash = %{$hash_name};
    my $cutoff = shift;
foreach my $key (keys {%hash}){
    my $gene_gc_perc = ($hash{$key}{'GC_perc'});
    if ($gene_gc_perc >= $cutoff) {
	my $sequence = $hash{$key}{'seqs'};
	push(@hits,[$key,$sequence]);
	$count++;
    }
}
    return ($count,\@hits);
}

sub GCcont {
    my $gene = shift;
    my $GC = ($genes{$gene}{'nt_count'}{'G'}) + ($genes{$gene}{'nt_count'}{'C'});
    my $GC_cont = 100*($GC/($genes{$gene}{'zlen'}));
    return $GC_cont;
}

print Dumper \%genes;
print STDERR "Done\n";
