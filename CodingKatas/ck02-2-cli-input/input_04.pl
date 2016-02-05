#!/usr/bin/env perl

use strict;
use warnings;

my @input = <>;
foreach my $line ( @input ) {
  print $line;
}

# Usages:
#  input_04.pl               # Reads from STDIN, until EOF ( usually ^D ).
#  input_04.pl file
#  input_04.pl file1 file2
#  input_04.pl file1 - file2 # Always reads from STDIN first, no matter where "-" is positioned.
