#!/usr/bin/perl
use strict;
use warnings;
my @numbers = (101,2,15,22,95,33,2,27,72,15,52);
for (my $i=0; $i < scalar @numbers ; $i++ ) {
	if(($i) % 2){
		print $numbers[$i],"\n"
	}
}
