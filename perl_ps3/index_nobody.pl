#!/usr/bin/perl
use strict;
use warnings;
my $a = shift @ARGV;
my $line_count = 0;
open (IN,'<',$a) or die "can't open $a: $!\n";
while (my $line= <IN>){
    chomp $line;
    $line_count++;
    my $Nobody = index($line,'Nobody'); 
    my $somebody = index($line, 'somebody');
    print "Line Number:", $line_count,"\n";
    if ($Nobody>=0) {
	print "\tFirst position of \'Nobody\': ", $Nobody,"\n";
    }
    if ($somebody>=0) {
	print "\tFirst position of \'somebody\': ", $somebody,"\n";
	warn("\tsomebody is here\n");
    }
}

