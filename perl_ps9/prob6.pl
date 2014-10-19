#!/usr/bin/perl
use warnings;
use strict;
use Data::Dumper;
my %favs;
$favs{'book'}{'Name'} = "Midnight in the Garden of Good and Evil";
$favs{'book'}{'Author'} = "John Berendt";
$favs{'book'}{'Type'} = "non-fiction";
$favs{'book'}{'Year'} = 1994;
$favs{'song'}{'Name'} = "She Blinded Me with Science";
$favs{'song'}{'Artist'} = "Thomas Dolby";
$favs{'song'}{'Album'} = "Blinded by Science";
$favs{'song'}{'Year'} = 1982;

print Dumper \%favs;
 
