#!/usr/bin/env perl

use strict;
use warnings;

use File::Basename qw( dirname );
use File::Spec::Functions qw( catdir );
use FindBin;
use lib catdir( dirname( $FindBin::Bin ), 'include/libperl' );

use Test::Simple tests => 2;

use ScoreController v1.00.00;
use DataComparator v1.00.00;

my @start_score_lines = ( 'Game Results:'
                        , "\tGames Played.........  0"
                        , "\tPlayer has won.......  0 time(s)"
                        , "\tPlayer has miss......  0 time(s)"
                        );
my @final_score_lines = ( 'Game Results:'
                        , "\tGames Played.........  3"
                        , "\tPlayer has won.......  2 time(s)"
                        , "\tPlayer has miss...... 10 time(s)"
                        );

use File::Spec;

my $standard_output;
open( $standard_output, ">&STDOUT" );
open( STDOUT, '>', File::Spec->devnull() );

initialize_score();
my @start_score_result = show_score();
ok ( compare_score_lines( @start_score_result, @start_score_lines ) == 1, 'show_score() using score at start' );

initialize_score();
store_games();
store_misses();
store_misses();
store_hits();
store_games();
store_misses();
store_misses();
store_misses();
store_misses();
store_misses();
store_games();
store_misses();
store_misses();
store_misses();
store_hits();
my @final_score_result = show_score();
ok ( compare_score_lines( @final_score_result, @final_score_lines ) == 1, 'show_score() using score at final' );

open( STDOUT, ">&", $standard_output );
