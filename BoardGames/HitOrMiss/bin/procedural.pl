#!/usr/bin/env perl

use strict;
use warnings;

use File::Basename qw( dirname );
use File::Spec::Functions qw( catdir );
use FindBin;
use lib catdir( dirname( $FindBin::Bin ), 'include/libperl' );

use GameController v1.00.00;

__PACKAGE__ -> main() unless caller;

sub main {
  # 2016.02.01: Should parse command line options for number of rows and columns ( -r --rows, -c --columns ).
  play_game( 3, 3 );
}
