#!/usr/bin/perl
use strict;
use warnings;
my $a = shift @ARGV;
my $line_count = 0;
my $char_ct = 0;
open(IN,'<',$a) or die "can't open $a: $!\n";
while (my $line= <IN>){
    chomp $line;
    $line_count++;
    $char_ct += length($line);
}
print "Number of lines: ",$line_count,"\n";
print "Number of characters: ",$char_ct,"\n";
print "Average line length: ",$char_ct/$line_count,"\n";
