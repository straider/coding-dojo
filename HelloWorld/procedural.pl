#!/usr/bin/env perl

use strict;
use warnings;

use utf8;
binmode( STDOUT, ":unix:utf8" );

if ( $#ARGV + 1 == 0 ) {
  print "Hello, World!\n";
} else {
  print "Hello, " . $ARGV[ 0 ] . "!\n"
}

print "» José Carlos Monteiro «\n";
