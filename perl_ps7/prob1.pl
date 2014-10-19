#!/usr/bin/perl
use strict;
use warnings;

my $sequence = shift @ARGV;
my $rev_comp_sequence = rev_comp($sequence);
print "$rev_comp_sequence\n";





#subroutines
sub rev_comp {
    my $seq = shift;
    my $r_seq = reverse ($seq);
    my $rc_seq = uc($r_seq);
    $rc_seq =~ tr/AGCT/TCGA/;
    return $rc_seq;
}

print STDERR "done";


