#!/usr/bin/env perl

use strict;
use warnings;

use File::Basename qw( dirname );
use File::Spec::Functions qw( catdir );
use FindBin;
use lib catdir( dirname( $FindBin::Bin ), 'include/libperl' );

use Getopt::Long;

use GameController v1.00.00;

our $VERSION = 'v1.00.00';

sub HELP_MESSAGE () {
  print "$0 -r|--rows NUMBER_OF_ROWS -c|--columns NUMBER_OF_COLUMNS\n\n";
  print "\t -r|--rows NUMBER_OF_ROWS: set the number of rows ( default is 3 )\n";
  print "\t -c|--columns NUMBER_OF_COLUMNS: set the number of columns ( default is 3 )\n";
  exit 0;
}

sub VERSION_MESSAGE () {
  print "HitOrMiss - Procedural $VERSION\n";
  exit 0;
}

__PACKAGE__ -> main() unless caller;

sub main {
  my $number_of_rows    = 3;
  my $number_of_columns = 3;

  my %options = ();
  GetOptions( 'rows=i'    => \$options{ r }
            , 'columns=i' => \$options{ c }
            , 'help'      => sub { HELP_MESSAGE    () }
            , 'version'   => sub { VERSION_MESSAGE () }
            ) or die( "Unable to parse command line options!\n" );
  $number_of_rows    = $options{ r } if ( defined( $options{ r } ) );
  $number_of_columns = $options{ c } if ( defined( $options{ c } ) );

  print "Playing with a board ${number_of_rows}x${number_of_columns}\n";
  play_game( $number_of_rows, $number_of_columns );
}
