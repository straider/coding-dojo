#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use File::Basename qw( dirname );
use File::Spec::Functions qw( catdir );
use FindBin;
use lib catdir( dirname( $FindBin::Bin ), 'include/libperl' );

use Test::More tests => 41;

use_ok 'BoardModel v1.00.00';
use BoardModel v1.00.00;

my @no_cells_board          = ();
my @one_by_one_board        = ( [ '' ] );
my @two_by_two_board        = ( [ '', '' ], [ '', '' ] );
my @three_by_two_board      = ( [ '', '' ], [ '', '' ], [ '', '' ] );
my @three_by_three_board    = ( [ '', '' , '' ], [ '', '', ''  ], [ '' , '', '' ] );
my @board_with_pieces       = ( [ '', 'X', '' ], [ '', '', 'O' ], [ '' , '', '' ] );
my @board_with_more_pieces  = ( [ '', 'X', '' ], [ '', '', 'O' ], [ 'X', '', '' ] );
my @board_with_other_pieces = ( [ '', 'O', '' ], [ '', '', 'O' ], [ '' , '', '' ] );

my @create_board_result_1 = create_board( 1, 1 );
my @create_board_result_2 = create_board( 2, 2 );
my @create_board_result_3 = create_board( 3, 2 );
my @create_board_result_4 = create_board( 3, 3 );
is_deeply ( \@create_board_result_1, \@one_by_one_board    , 'create_board() 1x1' );
is_deeply ( \@create_board_result_2, \@two_by_two_board    , 'create_board() 2x2' );
is_deeply ( \@create_board_result_3, \@three_by_two_board  , 'create_board() 3x2' );
is_deeply ( \@create_board_result_4, \@three_by_three_board, 'create_board() 3x3' );

my @create_board_result_5 = create_board(  0   , undef );
my @create_board_result_6 = create_board( -1   , undef );
my @create_board_result_7 = create_board( undef, undef );
is_deeply ( \@create_board_result_5, \@no_cells_board, 'create_board() with size =  0'    );
is_deeply ( \@create_board_result_6, \@no_cells_board, 'create_board() with size = -1'    );
is_deeply ( \@create_board_result_7, \@no_cells_board, 'create_board() with size = undef' );

my @clear_board_result_1 = clear_board( @no_cells_board       );
my @clear_board_result_2 = clear_board( @one_by_one_board     );
my @clear_board_result_3 = clear_board( @two_by_two_board     );
my @clear_board_result_4 = clear_board( @three_by_three_board );
my @clear_board_result_5 = clear_board( @board_with_pieces    );
# my @clear_board_result_6 = clear_board( undef                 );

is_deeply ( \@clear_board_result_1, \@no_cells_board      , 'clear_board() with a no cells board'      );
is_deeply ( \@clear_board_result_2, \@one_by_one_board    , 'clear_board() with an empty 1x1 board'    );
is_deeply ( \@clear_board_result_3, \@two_by_two_board    , 'clear_board() with an empty 2x2 board'    );
is_deeply ( \@clear_board_result_4, \@three_by_three_board, 'clear_board() with an empty 3x3 board'    );
is_deeply ( \@clear_board_result_5, \@three_by_three_board, 'clear_board() with a not empty 3x3 board' );
# is_deeply ( \@clear_board_result_6, \@no_cells_board      , 'clear_board() with an undefined board'    );

is ( is_valid_row( @board_with_pieces, 1 ), 1, 'is_valid_row() is true for row 1' );
is ( is_valid_row( @board_with_pieces, 2 ), 1, 'is_valid_row() is true for row 2' );
is ( is_valid_row( @board_with_pieces, 3 ), 1, 'is_valid_row() is true for row 3' );

isnt ( is_valid_row( @board_with_pieces, 0     ), 1, 'is_valid_row() is false for row below range' );
isnt ( is_valid_row( @board_with_pieces, 4     ), 1, 'is_valid_row() is false for row above range' );
isnt ( is_valid_row( @board_with_pieces, undef ), 1, 'is_valid_row() is false for undefined row'   );
# isnt ( is_valid_row( undef              , 1     ), 1, 'is_valid_row() is false for undefined board'  );

is ( is_valid_column( @board_with_pieces, 1 ), 1, 'is_valid_column() is true for column 1' );
is ( is_valid_column( @board_with_pieces, 2 ), 1, 'is_valid_column() is true for column 2' );
is ( is_valid_column( @board_with_pieces, 3 ), 1, 'is_valid_column() is true for column 3' );

isnt ( is_valid_column( @board_with_pieces, 0     ), 1, 'is_valid_column() is false for column below range' );
isnt ( is_valid_column( @board_with_pieces, 4     ), 1, 'is_valid_column() is false for column above range' );
isnt ( is_valid_column( @board_with_pieces, undef ), 1, 'is_valid_column() is false for undefined column'   );
# isnt ( is_valid_column( undef              , 1     ), 1, 'is_valid_column() is false for undefined board'    );

is ( get_piece( @board_with_pieces, 1, 1 ), '' , 'get_piece() of an empty cell in row 1' );
is ( get_piece( @board_with_pieces, 1, 2 ), 'X', 'get_piece() of a filled cell in row 1' );
is ( get_piece( @board_with_pieces, 2, 3 ), 'O', 'get_piece() of a filled cell in row 2' );
is ( get_piece( @board_with_pieces, 3, 3 ), '' , 'get_piece() of an empty cell in row 3' );

is ( get_piece( @board_with_pieces, 0, 1 ), '', 'get_piece() when row is below range'    );
is ( get_piece( @board_with_pieces, 4, 2 ), '', 'get_piece() when row is above range'    );
is ( get_piece( @board_with_pieces, 2, 0 ), '', 'get_piece() when column is below range' );
is ( get_piece( @board_with_pieces, 3, 4 ), '', 'get_piece() when column is above range' );

is ( get_piece( @board_with_pieces, undef, 1     ), '', 'get_piece() when row is undefined'    );
is ( get_piece( @board_with_pieces, 1,   , undef ), '', 'get_piece() when column is undefined' );
# is ( get_piece( undef              , 1    , 1     ), '', 'get_piece() when board is undefined'  );

my @set_piece_result_1 = set_piece( @board_with_pieces, 3, 1, 'X' );
my @set_piece_result_2 = set_piece( @board_with_pieces, 1, 2, 'O' );
is_deeply ( \@set_piece_result_1, \@board_with_more_pieces , 'set_piece() is allowed on an empty cell' );
is_deeply ( \@set_piece_result_2, \@board_with_other_pieces, 'set_piece() is allowed on a filled cell' );

my @set_piece_result_3 = set_piece( @board_with_pieces, 1, 4, 'E' );
my @set_piece_result_4 = set_piece( @board_with_pieces, 0, 1, 'E' );
is_deeply ( \@set_piece_result_3, \@board_with_pieces, 'set_piece() not allowed outside column range' );
is_deeply ( \@set_piece_result_4, \@board_with_pieces, 'set_piece() not allowed outside row range'    );

my @set_piece_result_5 = set_piece( @board_with_pieces, undef, 1    , 'E' );
my @set_piece_result_6 = set_piece( @board_with_pieces, 1    , undef, 'E' );
# my @set_piece_result_7 = set_piece( undef             , 1    , 1    , 'E' );
is_deeply ( \@set_piece_result_5, \@board_with_pieces, 'set_piece() not allowed when row is undefined'    );
is_deeply ( \@set_piece_result_6, \@board_with_pieces, 'set_piece() not allowed when column is undefined' );
# is_deeply ( \@set_piece_result_7, \@no_cells_board   , 'set_piece() not allowed when board is undefined'  );
