#!/usr/bin/perl
use strict;
use warnings;
my @seq = ('ATGCCCGGCCCGGC', 'GCGTGCTAGCAATACGATAAACCGG' , 'ATATATATCGAT' , 'ATGGGCCC');
foreach my $sequence (@seq) {
    print "For sequence $sequence\n";
    my @basewise = split(//,$sequence);
    my $len = scalar(@basewise);
    my $C_count = 0;
    my $G_count = 0;
    #print "Sequence length = $len\n";
    foreach my $base (@basewise) {
	if ($base eq 'C') {
	    $C_count++;
    }
	if ($base eq 'G') {
	    $G_count++;
    }
}
    #print "Number of G's = $G_count\n";
    #print "Number of C's = $C_count\n";
    my $gc_content = (($G_count+$C_count)/$len)*100;
    print "GC content is $gc_content %\n\n";
}
