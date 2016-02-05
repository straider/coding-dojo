#!/usr/bin/env perl

use strict;
use warnings;

my @input = <STDIN>;
foreach my $line ( @input ) {
  print "User has typed: ${line}";
}
