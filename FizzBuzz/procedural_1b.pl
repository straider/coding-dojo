#!/usr/bin/env perl

use strict;
use warnings;
use 5.10.0;

my @range = ( 1 .. 100 );

my $line;
foreach my $i ( @range ) {
  if      ( $i % 3 == 0 and $i % 5 == 0 and $i % 7 == 0 ) {
    $line = 'FizzBuzzDazz';
  } elsif ( $i % 5 == 0 and $i % 7 == 0 ) {
    $line = 'BuzzDazz';
  } elsif ( $i % 3 == 0 and $i % 7 == 0 ) {
    $line = 'FizzDazz';
  } elsif ( $i % 3 == 0 and $i % 5 == 0 ) {
    $line = 'FizzBuzz';
  } elsif ( $i % 7 == 0 ) {
    $line = 'Dazz';
  } elsif ( $i % 5 == 0 ) {
    $line = 'Buzz';
  } elsif ( $i % 3 == 0 ) {
    $line = 'Fizz';
  } else {
    $line = sprintf( '%04d', $i );
  }

  say $line;
}
