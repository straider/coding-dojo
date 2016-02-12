#!/usr/bin/env perl

use strict;
use warnings;

use File::Basename qw( dirname );
use File::Spec::Functions qw( catdir );
use FindBin;
use lib catdir( dirname( $FindBin::Bin ), 'include/libperl' );

use Test::More tests => 29;

use_ok 'BoardView v1.00.00';
use BoardView v1.00.00;

my @one_by_one_board     = ( [ 'x' ] );
my @two_by_two_board     = ( [ '', '', ], [ '', 'x' ] );
my @three_by_three_board = ( [ '' , '' , ''  ], [ '' , 'x', '' ], [ '' , '', '' ] );
my @board_with_misses    = ( [ 'O', 'O', 'O' ], [ 'O', 'x', '' ], [ '' , '', '' ] );

is ( BoardView::build_separator_line( 1 ), '   +---+'        , 'build_separator_line() for a board of size = 1' );
is ( BoardView::build_separator_line( 2 ), '   +---+---+'    , 'build_separator_line() for a board of size = 2' );
is ( BoardView::build_separator_line( 3 ), '   +---+---+---+', 'build_separator_line() for a board of size = 3' );

is ( BoardView::build_separator_line( 0     ), '', 'build_separator_line() for a board of size =  0'      );
is ( BoardView::build_separator_line( -1    ), '', 'build_separator_line() for a board of size = -1'      );
is ( BoardView::build_separator_line( undef ), '', 'build_separator_line() for a board of size undefined' );

is ( BoardView::build_header_line( 1 ), '     A  '        , 'build_header_line() for a board of size = 1' );
is ( BoardView::build_header_line( 2 ), '     A   B  '    , 'build_header_line() for a board of size = 2' );
is ( BoardView::build_header_line( 3 ), '     A   B   C  ', 'build_header_line() for a board of size = 3' );

isnt ( BoardView::build_header_line( 0     ), 1, 'build_header_line() for a board of size =  0'      );
isnt ( BoardView::build_header_line( -1    ), 1, 'build_header_line() for a board of size = -1'      );
isnt ( BoardView::build_header_line( undef ), 1, 'build_header_line() for a board of size undefined' );

is ( BoardView::build_row_line( @one_by_one_board    , 1 ), ' 1 | . |'        , 'build_row_line() for row #1 of a clean 1x1 board'       );
is ( BoardView::build_row_line( @two_by_two_board    , 1 ), ' 1 | . | . |'    , 'build_row_line() for row #1 of a clean 2x2 board'       );
is ( BoardView::build_row_line( @two_by_two_board    , 2 ), ' 2 | . | . |'    , 'build_row_line() for row #2 of a clean 2x2 board'       );
is ( BoardView::build_row_line( @three_by_three_board, 1 ), ' 1 | . | . | . |', 'build_row_line() for row #1 of a clean 3x3 board'       );
is ( BoardView::build_row_line( @three_by_three_board, 2 ), ' 2 | . | . | . |', 'build_row_line() for row #2 of a clean 3x3 board'       );
is ( BoardView::build_row_line( @three_by_three_board, 3 ), ' 3 | . | . | . |', 'build_row_line() for row #3 of a clean 3x3 board'       );
is ( BoardView::build_row_line( @board_with_misses   , 1 ), ' 1 | O | O | O |', 'build_row_line() for row #1 of a 3x3 board with misses' );
is ( BoardView::build_row_line( @board_with_misses   , 2 ), ' 2 | O | . | . |', 'build_row_line() for row #2 of a 3x3 board with misses' );
is ( BoardView::build_row_line( @board_with_misses   , 3 ), ' 3 | . | . | . |', 'build_row_line() for row #3 of a 3x3 board with misses' );

isnt ( BoardView::build_row_line( @three_by_three_board, 0     ), 1, 'build_row_line() for row below range' );
isnt ( BoardView::build_row_line( @three_by_three_board, 4     ), 1, 'build_row_line() for row above range' );
isnt ( BoardView::build_row_line( @three_by_three_board, undef ), 1, 'build_row_line() for undefined row'   );

my @one_by_one_board_lines     = ( '     A  '
                                 , '   +---+'
                                 , ' 1 | . |'
                                 , '   +---+'
                                 );
my @two_by_two_board_lines     = ( '     A   B  '
                                 , '   +---+---+'
                                 , ' 1 | . | . |'
                                 , '   +---+---+'
                                 , ' 2 | . | . |'
                                 , '   +---+---+'
                                 );
my @three_by_three_board_lines = ( '     A   B   C  '
                                 , '   +---+---+---+'
                                 , ' 1 | . | . | . |'
                                 , '   +---+---+---+'
                                 , ' 2 | . | . | . |'
                                 , '   +---+---+---+'
                                 , ' 3 | . | . | . |'
                                 , '   +---+---+---+'
                                 );
my @board_with_misses_lines    = ( '     A   B   C  '
                                 , '   +---+---+---+'
                                 , ' 1 | O | O | O |'
                                 , '   +---+---+---+'
                                 , ' 2 | O | . | . |'
                                 , '   +---+---+---+'
                                 , ' 3 | . | . | . |'
                                 , '   +---+---+---+'
                                 );

my @build_board_lines_result_1 = build_board_lines( @one_by_one_board     );
my @build_board_lines_result_2 = build_board_lines( @two_by_two_board     );
my @build_board_lines_result_3 = build_board_lines( @three_by_three_board );
my @build_board_lines_result_4 = build_board_lines( @board_with_misses    );
is_deeply ( \@build_board_lines_result_1, \@one_by_one_board_lines    , 'compare_board_lines() for a clean 1x1 board'       );
is_deeply ( \@build_board_lines_result_2, \@two_by_two_board_lines    , 'compare_board_lines() for a clean 2x2 board'       );
is_deeply ( \@build_board_lines_result_3, \@three_by_three_board_lines, 'compare_board_lines() for a clean 3x3 board'       );
is_deeply ( \@build_board_lines_result_4, \@board_with_misses_lines   , 'compare_board_lines() for a 3x3 board with misses' );
