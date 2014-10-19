#!/usr/bin/perl
#File: script.pl
use strict; 
use warnings;
use Microarray2;
my $microarray = Microarray2-> new('gene' => 'CDC2',
'expression' => 45, 'tissue' => 'liver');
my $gene_name = $microarray->gene();
my $expr_value = $microarray->expression();
print "Gene for this microarray is $gene_name\n";
print "Its expression value = $expr_value\n";
my $new_name = 'Pol2';
#my $gene_name = $microarray->gene("$new_name");
$microarray->gene("$new_name");
print "Gene for this microarray is ", $microarray->gene(),"\n";
