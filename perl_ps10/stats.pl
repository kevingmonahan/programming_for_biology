#!/usr/bin/perl
use strict;
use warnings;
use Statistics::Descriptive;
my $stat = Statistics::Descriptive::Full -> new();
$stat->add_data(12,-13,-12,7,11,-4,-12,9,6,7,-9);
my $max = $stat->max();
my $min = $stat->min();
my $median = $stat->median();
my $stdev = $stat->standard_deviation();
print "Min: $min\nMax: $max\nMedian: $median\nStandard Deviation: $stdev\n";
