#!/usr/bin/env perl

use strict;
use warnings;
use 5.10.0;

my @range = ( 1 .. 100 );

my $line;
foreach my $i ( @range ) {
  $line = '';
  $line .= 'Fizz' if ( $i % 3 == 0 );
  $line .= 'Buzz' if ( $i % 5 == 0 );
  $line .= 'Dazz' if ( $i % 7 == 0 );
  $line .= sprintf( '%04d', $i ) if ( $line eq '' );

  say $line;
}
