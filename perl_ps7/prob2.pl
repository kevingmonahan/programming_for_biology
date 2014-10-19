#!/usr/bin/perl
use strict;
use warnings;
#changes line length of a fasta file
#outputs fasta file with specified line length to STDOUT
#takes original fasta file and line length as arguments

my $file = shift @ARGV;
my $length = shift @ARGV;
my @fasta = parse_FASTA($file);
my %genes = @fasta;
foreach my $gene (keys %genes) {
    my @formatted = reformat_seq($genes{$gene},$length);
    print ">","$gene\n";
    print join("\n",@formatted),"\n";
    }

############ 
sub parse_FASTA {
    #takes the name of a FASTA formatted file as input
    my $input = "";
    my $file = shift;
    open (IN,'<',$file);
    while (my $line = <IN>){
	chomp $line;
	if (index($line,'>')==0){
	    $line .= '>';
	}
	$input .= $line;
    }
    my @fasta = split(/>/,$input);
    shift @fasta;
    #outputs and array with pattern (seq_name1,sequence1,seq_name2,sequence2,...)
    return @fasta;
#the next line will make a hash from the array. but we don't know how to export a hash yet
#my %gene = @fasta;
}


##########
sub reformat_seq {
    #takes a sequence (as a string) and a line length as arguments
    my $sequence = shift;
    my $len = shift;
    my @output = $sequence =~ /(.{$len})/g;
    return @output;
}



#print STDERR "done";


