#!/usr/bin/perl
use warnings;
use strict;
my $string = shift @ARGV;
$string =~ s/\W//g;
my $rev_string = reverse($string);
if ($rev_string =~ /$string/i){
    print "yes!\n";
}
else{
    print "no!\n";
}
