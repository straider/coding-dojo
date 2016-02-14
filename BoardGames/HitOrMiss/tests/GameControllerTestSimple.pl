#!/usr/bin/env perl

use strict;
use warnings;

use File::Basename qw( dirname );
use File::Spec::Functions qw( catdir );
use FindBin;
use lib catdir( dirname( $FindBin::Bin ), 'include/libperl' );

use Test::Simple tests => 37;

use GameController v1.00.00;
use DataComparator v1.00.00;

my @one_by_one_board_lines       = ( '     A  '
                                   , '   +---+'
                                   , ' 1 | . |'
                                   , '   +---+'
                                   );
my @winner_1x1_board_lines       = ( '     A  '
                                   , '   +---+'
                                   , ' 1 | X |'
                                   , '   +---+'
                                   );
my @one_by_two_board_lines       = ( '     A   B  '
                                   , '   +---+---+'
                                   , ' 1 | . | . |'
                                   , '   +---+---+'
                                   );
my @first_move_1x2_board_lines_1 = ( '     A   B  '
                                   , '   +---+---+'
                                   , ' 1 | X | . |'
                                   , '   +---+---+'
                                   );
my @first_move_1x2_board_lines_2 = ( '     A   B  '
                                   , '   +---+---+'
                                   , ' 1 | O | . |'
                                   , '   +---+---+'
                                   );

use File::Spec;

my $standard_output;
open( $standard_output, ">&STDOUT" );
open( STDOUT, '>', File::Spec->devnull() );

ok ( GameController::initialize_game( 1, 1 ) eq '1x1', 'initialize_game() for a 1x1 board' );
ok ( GameController::reset_game()            eq '1x1', 'reset_game() for a 1x1 board'      );
my @show_board_result_1x1 = GameController::print_board();
ok ( compare_board_lines( @show_board_result_1x1, @one_by_one_board_lines ), 'print_board() for an initialized 1x1 board' );
ok ( GameController::is_valid_cell_reference( 1, 'A' ) == 1 , 'is_valid_cell_reference() is true  for reference ( 1, A ) on a 1x1 board' );
ok ( GameController::is_valid_cell_reference( 1, 'B' ) eq '', 'is_valid_cell_reference() is false for reference ( 1, B ) on a 1x1 board' );
GameController::put_piece( 1, 'A' );
ok ( GameController::has_no_more_attempts() == 1, 'has_no_more_attempts() is true after first move on a 1x1 board' );
my @first_move_1x1_board_lines = GameController::print_board();
ok ( compare_board_lines( @first_move_1x1_board_lines, @winner_1x1_board_lines ), 'print_board() after first move on a 1x1 board' );
ok ( GameController::reset_game() eq '1x1', 'reset_board() for a 1x1 board' );
my @show_board_reset_1x1 = GameController::print_board();
ok ( compare_board_lines( @show_board_reset_1x1, @one_by_one_board_lines ), 'print_board() after a reset on a 1x1 board' );

ok ( GameController::initialize_game( 1, 2 ) eq '1x2', 'initialize_game() for a 1x2 board' );
ok ( GameController::reset_game()            eq '1x2', 'reset_game() for a 1x2 board'      );
my @show_board_result_1x2 = GameController::print_board();
ok ( compare_board_lines( @show_board_result_1x2, @one_by_two_board_lines ), 'print_board() for an initialized 1x2 board' );
ok ( GameController::is_valid_cell_reference( 1, 'A' ) == 1 , 'is_valid_cell_reference() is true  for reference ( 1, A ) on a 1x2 board' );
ok ( GameController::is_valid_cell_reference( 1, 'B' ) == 1 , 'is_valid_cell_reference() is true  for reference ( 1, B ) on a 1x2 board' );
ok ( GameController::is_valid_cell_reference( 2, 'A' ) eq '', 'is_valid_cell_reference() is false for reference ( 2, A ) on a 1x2 board' );
my @first_move_1x2_board_lines = ( GameController::is_win( 1, 'A' ) ) ? @first_move_1x2_board_lines_1 : @first_move_1x2_board_lines_2;
GameController::put_piece( 1, 'A' );
ok ( GameController::has_no_more_attempts() == 1, 'has_no_more_attempts() is true after first move on a 1x2 board' );
my @first_move_result_1x2 = GameController::print_board();
ok ( compare_board_lines( @first_move_result_1x2, @first_move_1x2_board_lines ), 'print_board() after first move on a 1x2 board' );
ok ( GameController::reset_game() eq '1x2', 'reset_board() for a 1x2 board' );
my @show_board_reset_1x2 = GameController::print_board();
ok ( compare_board_lines( @show_board_reset_1x2, @one_by_two_board_lines ), 'print_board() after a reset on a 1x2 board' );

ok ( GameController::initialize_game( 2, 2 ) eq '2x2', 'initialize_game() for a 2x2 board' );
ok ( GameController::reset_game()            eq '2x2', 'reset_game() for a 2x2 board'      );
GameController::put_piece( 1, 'A' );
ok ( GameController::has_no_more_attempts() eq '', 'has_no_more_attempts() is false after first move on a 2x2 board' );

ok ( GameController::is_valid_answer( 'y' ) == 1, 'is_valid_answer() is true for answer y' );
ok ( GameController::is_valid_answer( 'Y' ) == 1, 'is_valid_answer() is true for answer Y' );
ok ( GameController::is_valid_answer( 'n' ) == 1, 'is_valid_answer() is true for answer n' );
ok ( GameController::is_valid_answer( 'N' ) == 1, 'is_valid_answer() is true for answer N' );

ok ( GameController::is_valid_answer( 'yes' ) == 1, 'is_valid_answer() is true for answer yes' );
ok ( GameController::is_valid_answer( 'Yes' ) == 1, 'is_valid_answer() is true for answer Yes' );
ok ( GameController::is_valid_answer( 'YES' ) == 1, 'is_valid_answer() is true for answer YES' );
ok ( GameController::is_valid_answer( 'no'  ) == 1, 'is_valid_answer() is true for answer no'  );
ok ( GameController::is_valid_answer( 'No'  ) == 1, 'is_valid_answer() is true for answer No'  );
ok ( GameController::is_valid_answer( 'NO'  ) == 1, 'is_valid_answer() is true for answer NO'  );

ok ( GameController::is_valid_answer( ''    ) eq '', 'is_valid_answer() is false for an empty answer'     );
ok ( GameController::is_valid_answer( undef ) eq '', 'is_valid_answer() is false for an undefined answer' );
ok ( GameController::is_valid_answer( 1     ) eq '', 'is_valid_answer() is false for answer 1'            );
ok ( GameController::is_valid_answer( 'x'   ) eq '', 'is_valid_answer() is false for answer x'            );
ok ( GameController::is_valid_answer( 'X'   ) eq '', 'is_valid_answer() is false for answer X'            );

open( STDOUT, ">&", $standard_output );

