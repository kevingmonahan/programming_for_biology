#!/usr/bin/perl
use warnings;
use strict;
#use Data::Dumper;
my %favs;
$favs{'book'}{'Name'} = "Midnight in the Garden of Good and Evil";
$favs{'book'}{'Author'} = "John Berendt";
$favs{'book'}{'Type'} = "non-fiction";
$favs{'book'}{'Year'} = 1994;
$favs{'song'}{'Name'} = "She Blinded Me with Science";
$favs{'song'}{'Artist'} = "Thomas Dolby";
$favs{'song'}{'Album'} = "Blinded by Science";
$favs{'song'}{'Year'} = 1982;
my $fav_song_name = $favs{'song'} {'Name'};
print "Favorite Song Name: ",$fav_song_name,"\n"; 
my $fav_book_type = $favs{'book'} {'Type'};
print "Favorite Book Type: $fav_book_type\n";
foreach my $key ( keys %favs) {
    foreach my $int_key ( keys % { $favs{$key}}) {
	my $info = $favs{$key} {$int_key};
	print "$key info: $info\n";
    }
}
print "\nMaking changes\n\n";
$favs{'book'} = {
'Name' => "Catch-22", 'Author' => "Joseph Heller", 'Type' => "Fiction",
'Year' => "Don't know"};
foreach my $key ( keys %favs) {
    foreach my $int_key ( keys % { $favs{$key}}) {
	    my $info = $favs{$key} {$int_key};
	    print "$key info, $int_key: $info\n";
    }
}


