#!/usr/bin/env perl

use strict;
use warnings;
use 5.10.0;

my %PRIME_WORDS = ( 3 => 'Fizz', 5 => 'Buzz' );

my @range = ( 1 .. 100 );

my $line;
foreach my $i ( @range ) {
  $line = '';
  foreach my $key ( keys( %PRIME_WORDS ) ) {
    my $value = $PRIME_WORDS{ $key };
    $line .= $value if ( $i % $key == 0 );
  }
  $line .= sprintf( '%04d', $i ) if ( $line eq '' );

  say $line;
}
