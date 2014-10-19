#!/usr/bin/perl
use warnings;
use strict;
use Bio::SearchIO;
my $cutoff = (1e-50);
my $blast_report = shift;
my $searchIO_obj = Bio::SearchIO->new(-file => $blast_report, -format => 'blast');
while(my $result_obj = $searchIO_obj->next_result){
    while(my $hit_obj = $result_obj->next_hit){
	while( my $hsp_obj = $hit_obj->next_hsp){
	    my $hit_name_obj = $hsp_obj->hit;
	    my $hit_name = $hit_name_obj->seq_id;
	    my $query_name_obj = $hsp_obj->query;
	    my $query_name = $query_name_obj->seq_id;
	    my $significance = $hsp_obj->evalue();
	    if ($significance <= $cutoff){
		print "query name: $query_name\nhit name: $hit_name\ne-value: $significance\n\n";
	    }
	}
    }

}
