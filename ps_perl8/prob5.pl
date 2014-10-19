#!/usr/bin/perl
use strict;
use warnings;
use MINE::FASTA_tools;

#changes line length of a fasta file
#outputs fasta file with specified line length to STDOUT
#takes original fasta file and line length as arguments

my $file = shift @ARGV;
my $length = shift @ARGV;
my @fasta_names = get_name($file);
my @fasta_desc = get_desc($file);
my @fasta_seq = get_sequence($file);
reformat_seq ($file,$length);

print "Sequence names:\n";
print "@fasta_names\n\n";

print "Sequence descriptions:\n";
print "@fasta_desc\n\n";

print "Sequences\n";
print "@fasta_seq\n";

print STDERR "done";


