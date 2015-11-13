#!/bin/env perl

use strict;
use warnings;

sub fibonnaci {
  my $value = shift;
  
  my @sequence = ();

  for ( my $number = 0; $number <= $value; $number++ ) {
    if ( $number <= 1 ) {
      push ( @sequence, $number );
    } else {
      push ( @sequence, $sequence[ -1 ] + $sequence[ -2 ] );
    }
  }

  return @sequence;
}

if ( ! caller ) {
  my $LIMIT = 44;

  my @sequence = ();
  for ( my $i = 0; $i <= 25000; $i++ ) {
    push ( @sequence, fibonnaci( $LIMIT ) );
  }

  my $index = 0;
  foreach my $value ( @sequence ) {
    printf ( "%02d: %9d\n", ( $index % ( $LIMIT + 1 ), $value ) );
    $index++;
  }
}
