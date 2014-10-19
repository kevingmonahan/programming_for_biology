#!/usr/bin/perl
use strict;
use warnings;
my @numbers = (101,2,15,22,95,33,2,27,72,15,52);
my @sorted_numbers = sort {$a <=> $b} (@numbers);
my $even_sum = 0 ;
my $odd_sum = 0 ;
#print "@sorted_numbers\n"
foreach my $number (@sorted_numbers) {
	print $number,"\n";
	if(($number+1) % 2){
		$even_sum += $number ;
	}
	else {
		$odd_sum += $number ;
	}
}
print "Sum of even values: ", $even_sum, "\n" ;
print "Sum of odd values: ", $odd_sum, "\n" ;
