#!/usr/bin/perl
use strict;
use warnings;
#parse a fasta formatted file into an array of sequence names and a corresponding array of sequences
my $file = shift @ARGV;
my $input = "";
open (IN,'<',$file);
while (my $line = <IN>){
    chomp $line;
    if (index($line,'>')==0){
	$line .= '>';
    }
    $input .= $line;
    #my $dummy=0;
}
my @fasta = split(/>/,$input);
shift @fasta;
my $seq_ct = scalar(@fasta);
my @seq ;
my @name ;
for (my $i = 0; $i < $seq_ct; $i++){
    if(($i) % 2 == 0) {
	push (@name,$fasta[$i]);
	print "dummy" ;
    }
    else{
	push (@seq,$fasta[$i]);
    }
}
# back to solving the problem
my $olfr1507 = $seq[0];
my $olfr1508 = $seq[1];
my @or1507=split(//,$olfr1507);
my @or1508=split(//,$olfr1508);
my $len =scalar(@or1507);
for (my $j = 0; $j< $len; $j++) {
    if ($or1507[$j] ne $or1508[$j]){
	print "Difference at position: ",$j+1,"\n";
    }
}
print STDERR "complete\n" ;

