#!/usr/bin/perl
use warnings;
use strict;
use Data::Dumper;
use Bio::DB::Fasta;
use Bio::SeqIO;
my $path = shift;
my $db_obj = Bio::DB::Fasta->new($path);
my @ids=$db_obj->ids;
my @hits;
foreach my $id (@ids) {
    if($id =~ /HDAC/){
        push (@hits, $id);
    }
    
}
my $out_seqIO_Obj = Bio::SeqIO->new(-format => 'fasta');
#print "@hits","\n";
for (my $i =1; $i<6; $i=$i+2){
    my $seq_obj = $db_obj->get_Seq_by_id($hits[$i]);
    $out_seqIO_Obj->write_seq($seq_obj);
}
print "Done\n";
