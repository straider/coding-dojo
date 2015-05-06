#!/usr/bin/env perl

use strict;
use warnings;

use v5.10.0;
use utf8;
binmode( STDOUT, ":unix:utf8" );

if ( $#ARGV + 1 == 0 ) {
  say "Hello, World!";
} else {
  say "Hello, " . $ARGV[ 0 ] . "!"
}

say "» José Carlos Monteiro «";
