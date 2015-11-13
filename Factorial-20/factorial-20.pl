#!/bin/env perl

use strict;
use warnings;

sub factorial {
  my $value  = shift;
  my $result = 1;

  for ( my $iteration = 1; $iteration <= $value; $iteration++ ) {
    $result = $result * $iteration;
  }

  return $result;
}

if ( ! caller ) {
  for ( my $i = 0; $i <= 50000; $i++ ) {
    for ( my $value = 0; $value <= 20; $value++ ) {
      my $result = factorial( $value );
      print "$result\n"
    }
  }
}
