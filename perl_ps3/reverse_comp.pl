#!/usr/bin/perl
use strict;
use warnings;
my $a = shift @ARGV;
open(IN,'<',$a) or die "can't open $a: $!\n";
while (my $line= <IN>){
    chomp $line;
    if ($line=~ m/>/){
	print $line,"_rev-comp\n";
    }
    else{
	my $r_line = reverse $line;
	my $rc_line= $r_line;
	$rc_line =~ tr/AGCT/TCGA/;
	print $rc_line, "\n";
    }
}
