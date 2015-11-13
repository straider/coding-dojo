#!/bin/env perl

use strict;
use warnings;

# http://learn.perl.org/faq/perlfaq5.html#How-do-I-count-the-number-of-lines-in-a-file
sub count_lines {
  my $filename = shift;

  open( FILE, $filename );
  while ( <FILE> ) {
  }
  my $lines = $.;
  close FILE;

  return $lines;
}

if ( ! caller ) {
  print count_lines( $ARGV[ 0 ] );
}
