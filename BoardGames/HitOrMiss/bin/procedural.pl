#!/usr/bin/env perl

use strict;
use warnings;

use File::Basename qw( dirname );
use File::Spec::Functions qw( catdir );
use FindBin;
use lib catdir( dirname( $FindBin::Bin ), 'include/libperl' );

use Getopt::Std;

use GameController v1.00.00;

$Getopt::Std::STANDARD_HELP_VERSION = 1;

sub HELP_MESSAGE ( $ ) {
  my $file_handle = shift;

  print $file_handle "$0 -r|--rows NUMBER_OF_ROWS -c|--columns NUMBER_OF_COLUMNS\n\n";
  print $file_handle "\t -r|--rows NUMBER_OF_ROWS: set the number of rows ( default is 3 )\n";
  print $file_handle "\t -c|--columns NUMBER_OF_COLUMNS: set the number of columns ( default is 3 )\n";
}

sub VERSION_MESSAGE ( $ ) {
  my $file_handle = shift;

  print $file_handle "HitOrMiss - Procedural 1.00.00\n";
}

__PACKAGE__ -> main() unless caller;

sub main {
  my $number_of_rows    = 3;
  my $number_of_columns = 3;

  my %options = ();
  getopts( 'r:c:', \%options );
  $number_of_rows    = $options{ r } if ( defined( $options{ r } ) );
  $number_of_columns = $options{ c } if ( defined( $options{ c } ) );

  print "Playing with a board ${number_of_rows}x${number_of_columns}\n";
  play_game( $number_of_rows, $number_of_columns );
}
