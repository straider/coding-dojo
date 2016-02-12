#!/usr/bin/env perl

use strict;
use warnings;

use File::Basename qw( dirname );
use File::Spec::Functions qw( catdir );
use FindBin;
use lib catdir( dirname( $FindBin::Bin ), 'include/libperl' );

use Test::Simple tests => 37;

use BoardController v1.00.00;
use DataComparator v1.00.00;

my @one_by_one_board_lines     = ( '     A  '
                                 , '   +---+'
                                 , ' 1 | . |'
                                 , '   +---+'
                                 );
my @winner_1x1_board_lines     = ( '     A  '
                                 , '   +---+'
                                 , ' 1 | X |'
                                 , '   +---+'
                                 );
my @full_1x2_board_lines_1     = ( '     A   B  '
                                 , '   +---+---+'
                                 , ' 1 | X | O |'
                                 , '   +---+---+'
                                 );
my @full_1x2_board_lines_2     = ( '     A   B  '
                                 , '   +---+---+'
                                 , ' 1 | O | X |'
                                 , '   +---+---+'
                                 );
my @two_by_two_board_lines     = ( '     A   B  '
                                 , '   +---+---+'
                                 , ' 1 | . | . |'
                                 , '   +---+---+'
                                 , ' 2 | . | . |'
                                 , '   +---+---+'
                                 );
my @three_by_two_board_lines   = ( '     A   B  '
                                 , '   +---+---+'
                                 , ' 1 | . | . |'
                                 , '   +---+---+'
                                 , ' 2 | . | . |'
                                 , '   +---+---+'
                                 , ' 3 | . | . |'
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
my @two_by_four_board_lines    = ( '     A   B   C   D  '
                                 , '   +---+---+---+---+'
                                 , ' 1 | . | . | . | . |'
                                 , '   +---+---+---+---+'
                                 , ' 2 | . | . | . | . |'
                                 , '   +---+---+---+---+'
                                 );

use File::Spec;

my $standard_output;
open( $standard_output, ">&STDOUT" );
open( STDOUT, '>', File::Spec->devnull() );

ok ( initialize_board( 0    , 1     ) eq '', 'initialize_board() for a 0x1 board' );
ok ( initialize_board( 1    , 0     ) eq '', 'initialize_board() for a 1x0 board' );
ok ( initialize_board( undef, undef ) eq '', 'initialize_board() for a board of undefined dimensions' );

ok ( initialize_board( 1, 1 ) eq '1x1', 'initialize_board() for a 1x1 board' );
ok ( reset_board()            eq '1x1', 'reset_board() for a 1x1 board'      );
my @show_board_result_1x1 = show_board();
ok ( compare_board_lines( @show_board_result_1x1, @one_by_one_board_lines ), 'show_board() for a 1x1 board' );
ok ( is_valid_cell( 1    , 'A'   ) == 1 , 'is_valid_cell() is true  when ( 1, A ) on a 1x1 board'          );
ok ( is_valid_cell( 0    , 'A'   ) eq '', 'is_valid_cell() is false when ( 0, A ) on a 1x1 board'          );
ok ( is_valid_cell( 1    , 'B'   ) eq '', 'is_valid_cell() is false when ( 1, B ) on a 1x1 board'          );
ok ( is_valid_cell( undef, undef ) eq '', 'is_valid_cell() is false when pair is undefined on a 1x1 board' );
ok ( is_hit( 1, 'A' ), 'is_hit() is always true when ( 1, A ) on a 1x1 board' );
ok ( mark_cell( 1, 'A' ) == 1 , 'mark_cell() is true  on an empty 1x1 board' );
ok ( mark_cell( 1, 'A' ) eq '', 'mark_cell() is false on a filled 1x1 board' );
my @show_board_result_win = show_board();
ok ( compare_board_lines( @show_board_result_win, @winner_1x1_board_lines ), 'show_board() for a winning condition on a 1x1 board' );

ok ( initialize_board( 1, 2 ) eq '1x2', 'initialize_board() for a 1x2 board' );
ok ( reset_board()            eq '1x2', 'reset_board() for a 1x2 board'      );
my @full_1x2_board_lines = ( is_hit( 1, 'A' ) ) ? @full_1x2_board_lines_1 : @full_1x2_board_lines_2;
ok ( mark_cell( 1, 'A' ) eq 1, 'mark_cell() is true on ( 1, A ) of a 1x2 board' );
ok ( mark_cell( 1, 'B' ) eq 1, 'mark_cell() is true on ( 1, B ) of a 1x2 board' );
my @show_board_result_full = show_board();
ok ( compare_board_lines( @show_board_result_full, @full_1x2_board_lines ), 'show_board() for a full a 1x2 board' );

ok ( initialize_board( 2, 2 ) eq '2x2', 'initialize_board() for a 2x2 board' );
ok ( reset_board()            eq '2x2', 'reset_board() for a 2x2 board'      );
my @show_board_result_2x2 = show_board();
ok ( compare_board_lines( @show_board_result_2x2, @two_by_two_board_lines ), 'show_board() for a 2x2 board' );
ok ( is_valid_cell( 1, 'A' ) == 1 , 'is_valid_cell() is true  when ( 1, A ) on a 2x2 board' );
ok ( is_valid_cell( 2, 'B' ) == 1 , 'is_valid_cell() is true  when ( 2, B ) on a 2x2 board' );
ok ( is_valid_cell( 3, 'C' ) eq '', 'is_valid_cell() is false when ( 3, C ) on a 2x2 board' );

ok ( initialize_board( 3, 2 ) eq '3x2', 'initialize_board() for a 3x2 board' );
ok ( reset_board()            eq '3x2', 'reset_board() for a 3x2 board'      );
my @show_board_result_3x2 = show_board();
ok ( compare_board_lines( @show_board_result_3x2, @three_by_two_board_lines ), 'show_board() for a 3x2 board' );

ok ( initialize_board( 3, 3 ) eq '3x3', 'initialize_board() for a 3x3 board' );
ok ( reset_board()            eq '3x3', 'reset_board() for a 3x3 board'      );
my @show_board_result_3x3 = show_board();
ok ( compare_board_lines( @show_board_result_3x3, @three_by_three_board_lines ), 'show_board() for a 3x3 board' );
ok ( is_valid_cell( 1, 'A' ) == 1, 'is_valid_cell() is true when ( 1, A ) on a 3x3 board' );
ok ( is_valid_cell( 2, 'B' ) == 1, 'is_valid_cell() is true when ( 2, B ) on a 3x3 board' );
ok ( is_valid_cell( 3, 'C' ) == 1, 'is_valid_cell() is true when ( 3, C ) on a 3x3 board' );

ok ( initialize_board( 2, 4 ) eq '2x4', 'initialize_board() for a 3x3 board' );
ok ( reset_board()            eq '2x4', 'reset_board() for a 4x4 board'      );
my @show_board_result_4x2 = show_board();
ok ( compare_board_lines( @show_board_result_4x2, @two_by_four_board_lines ), 'show_board() for a 2x4 board' );

open( STDOUT, ">&", $standard_output );
