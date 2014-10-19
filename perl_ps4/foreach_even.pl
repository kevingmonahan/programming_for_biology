#!/usr/bin/perl
use strict;
use warnings;
my @numbers = (101,2,15,22,95,33,2,27,72,15,52);
foreach my $number (@numbers) {
	if(($number+1) % 2){
		print $number,"\n";
	}
}

