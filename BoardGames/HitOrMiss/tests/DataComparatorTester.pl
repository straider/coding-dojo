#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use File::Basename qw( dirname );
use File::Spec::Functions qw( catdir );
use FindBin;
use lib catdir( dirname( $FindBin::Bin ), 'include/libperl' );

use Test::Simple tests => 9;

use DataComparator v1.00.00;

my @no_cells_board          = ();
my @one_by_one_board        = ( [ '' ] );
my @two_by_two_board        = ( [ '', '' ], [ '', '' ] );
my @three_by_two_board      = ( [ '', '' ], [ '', '' ], [ '', '' ] );
my @three_by_three_board    = ( [ '', '' , '' ], [ '', '', ''  ], [ '' , '', '' ] );
my @board_with_pieces       = ( [ '', 'X', '' ], [ '', '', 'O' ], [ '' , '', '' ] );
my @board_with_more_pieces  = ( [ '', 'X', '' ], [ '', '', 'O' ], [ 'X', '', '' ] );
my @board_with_other_pieces = ( [ '', 'O', '' ], [ '', '', 'O' ], [ '' , '', '' ] );

ok ( compare_boards( @no_cells_board        , @no_cells_board       ), 'compare_boards() using no cells boards'      );
ok ( compare_boards( @one_by_one_board      , @one_by_one_board     ), 'compare_boards() using 1x1 board'            );
ok ( compare_boards( @two_by_two_board      , @two_by_two_board     ), 'compare_boards() using 2x2 board'            );
ok ( compare_boards( @three_by_two_board    , @three_by_two_board   ), 'compare_boards() using 3x2 board'            );
ok ( compare_boards( @three_by_three_board  , @three_by_three_board ), 'compare_boards() using 3x3 board'            );
ok ( compare_boards( @board_with_pieces     , @board_with_pieces    ), 'compare_boards() that match'                 );
# ok ( compare_boards( @three_by_three_board  , @two_by_two_board     ), 'compare_boards() that do not match in size'  );
# ok ( compare_boards( @board_with_more_pieces, @board_with_pieces    ), 'compare_boards() that do not match in cells' );

my @one_by_one_board_lines = ( '     A  '
                             , '   +---+'
                             , ' 1 | . |'
                             , '   +---+'
                             );
my @two_by_two_board_lines = ( '     A   B  '
                             , '   +---+---+'
                             , ' 1 | . | . |'
                             , '   +---+---+'
                             , ' 2 | . | . |'
                             , '   +---+---+'
                             );
my @winner_1x1_board_lines = ( '     A  '
                             , '   +---+'
                             , ' 1 | X |'
                             , '   +---+'
                             );

ok ( compare_board_lines( @one_by_one_board_lines, @one_by_one_board_lines ), 'compare_board_lines() for a clean 1x1 board'        );
ok ( compare_board_lines( @two_by_two_board_lines, @two_by_two_board_lines ), 'compare_board_lines() for a clean 2x2 board'        );
# ok ( compare_board_lines( @one_by_one_board_lines, @winner_1x1_board_lines ), 'compare_board_lines() between different 1x1 boards' );

my %start_score = ( 'games' => 0, 'hits' => 0, 'misses' => 0 );
my %final_score = ( 'games' => 3, 'hits' => 2, 'misses' => 7 );

ok ( compare_scores( %start_score, %start_score ), 'compare_scores() when scores have matching items ( start )' );
ok ( compare_scores( %final_score, %final_score ), 'compare_scores() when scores have matching items ( final )' );
# ok ( compare_scores( %start_score, %final_score ), 'compare_scores() when scores do not have mathcing items'    );

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

ok ( compare_score_lines( @start_score_lines, @start_score_lines ), 'compare_score_lines() when scores have matching lines ( start )' );
ok ( compare_score_lines( @final_score_lines, @final_score_lines ), 'compare_score_lines() when scores have matching lines ( final )' );
# ok ( compare_score_lines( @start_score_lines, @final_score_lines ), 'compare_score_lines() when scores do not have mathcing lines'    );
