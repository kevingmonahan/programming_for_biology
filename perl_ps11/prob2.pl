#!/usr/bin/perl
use warnings;
use strict;
use Bio::SeqIO;
use Bio::Seq;
use Data::Dumper;
my $file = shift;
my $in_obj = Bio::SeqIO->new(-file => $file , -format => 'genbank');
my $out_obj = Bio::SeqIO->new(-format => 'fasta');
my @pept_seq;
while (my $seq_obj = $in_obj->next_seq) {
    my $name = $seq_obj->id;
    foreach my $prim_feat ($seq_obj->get_all_SeqFeatures){
	#print Dumper $prim_feat;
	if (my $has_tag = $prim_feat->has_tag('translation')){
	    #print Dumper $prim_feat;
	    @pept_seq = $prim_feat->get_tag_values('translation')
	}
	
    }
    print "gene $name peptide sequence:\n@pept_seq\n";
  
}
print STDERR "done\n";
