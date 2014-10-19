#!/usr/bin/perl
use strict;
use warnings;
open (IN,'<','numbers.txt') or die "can't open input file: $!\n";
open (OUT,'>','myresult.txt') or die "can't write out file: $!\n";
while (my $line= <IN>){
    chomp $line;
    if (($line+1) % 2) {
	if ($line<24) {
	    print $line,"\n";
	}
    }
    else{
	my $factorial=$line;
	my $factorial_output = $factorial;
	while($factorial >1){
	    $factorial--;
	    $factorial_output*=$factorial;
	}
	print OUT $factorial_output,"\n";
    }    
}

