#!/usr/bin/perl
use warnings;
use strict;
my $seq = shift @ARGV;
my $enzyme = shift @ARGV;
unless (defined($seq) and defined ($enzyme)) {
die "please provide a sequence file and an enzyme name\n"
}
my $string;
open (IN, '<', $seq) or die "Can't open file $seq\n";
while (my $line = <IN>){
    chomp $line;
    $string .= $line
}



my @rest_sites;
my $offset;
my $site = 'R^AATTY';
while ($site =~ /\^/g){
    $offset = (pos($site)-1);}
$site =~ s/\^//;
my $len = length($site);
$site =~ s/R/[AG]/;
$site =~ s/Y/[CT]/;


my $pattern = $site;
while ( $string =~ /$pattern/g){
    my $position=pos($string);
    push (@rest_sites, $position)
}
my @cut_sites;
foreach my $end (@rest_sites){
    my $cut = $end - $len + $offset;
    push (@cut_sites, $cut)
}
my @sequence = split (//, $string);
my $shift = 0;
foreach my $cut (@cut_sites){
    splice (@sequence,($cut+$shift),0,'^');
    $shift++;
}
my $digest = join ('',@sequence);
print "sequence with cut sites: \n $digest","\n\n";

my @frags = split (/\^/,$digest);
print "restriction fragments sorted by size:\n";
my @electro_frags = sort {length ($b) <=> length ($a)} (@frags);
foreach my $frag (@electro_frags){
print $frag,"\n"
}

print STDERR "\nDone\n";
