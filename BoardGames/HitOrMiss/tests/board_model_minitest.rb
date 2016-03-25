#!/usr/bin/env ruby
# encoding: utf-8

require 'minitest/autorun'

top_folder       = File.dirname( File.dirname( File.expand_path( __FILE__ ) ) )
libraries_folder = File.join( top_folder, 'include', 'libruby' )
$LOAD_PATH.unshift( libraries_folder ) unless $LOAD_PATH.include?( libraries_folder )

require 'board_model'

$one_by_one_board        = [ [ '' ] ];
$two_by_two_board        = [ [ '', '' ], [ '', '' ] ];
$two_by_four_board       = [ [ '', '', '', '' ], [ '', '', '', '' ] ];
$three_by_two_board      = [ [ '', '' ], [ '', '' ], [ '', '' ] ];
$three_by_three_board    = [ [ '', '' , '' ], [ '', '', ''  ], [ '' , '', '' ] ];
$board_with_pieces       = [ [ '', 'X', '' ], [ '', '', 'O' ], [ '' , '', '' ] ];
$board_with_more_pieces  = [ [ '', 'X', '' ], [ '', '', 'O' ], [ 'X', '', '' ] ];
$board_with_other_pieces = [ [ '', 'O', '' ], [ '', '', 'O' ], [ '' , '', '' ] ];

class TestCases < Minitest::Test

  def test_create_board_valid()
    assert_equal( $one_by_one_board    , create_board( 1, 1 ), 'create_board() 1x1' )
    assert_equal( $two_by_two_board    , create_board( 2, 2 ), 'create_board() 2x2' )
    assert_equal( $two_by_four_board   , create_board( 2, 4 ), 'create_board() 2x4' )
    assert_equal( $three_by_two_board  , create_board( 3, 2 ), 'create_board() 3x2' )
    assert_equal( $three_by_three_board, create_board( 3, 3 ), 'create_board() 3x3' )
  end

  def test_create_board_invalid()
    assert_nil( create_board( 0, 0 ), 'create_board() 0x0' )
    assert_nil( create_board( 0, 1 ), 'create_board() 0x1' )
    assert_nil( create_board( 1, 0 ), 'create_board() 1x0' )

    assert_nil( create_board( -1, -1 ), 'create_board() with invalid dimensions ' )
    assert_nil( create_board( -1,  1 ), 'create_board() with invalid dimensions ' )
    assert_nil( create_board(  1, -1 ), 'create_board() with invalid dimensions ' )

    assert_nil( create_board( nil, nil ), 'create_board() with no dimensions' )
  end

  def test_clear_board()
    assert_equal( $one_by_one_board    , clear_board( $one_by_one_board     ), 'clear_board() with empty 1x1 board'       )
    assert_equal( $two_by_two_board    , clear_board( $two_by_two_board     ), 'clear_board() with empty 2x2 board'       )
    assert_equal( $three_by_three_board, clear_board( $three_by_three_board ), 'clear_board() with empty 3x3 board'       )
    assert_equal( $three_by_three_board, clear_board( $board_with_pieces    ), 'clear_board() with a non empty 3x3 board' )
  end

  def test_is_valid_row_true()
    assert( is_valid_row?( $three_by_three_board, 1 ), 'is_valid_row?() is true when row #1 on a 3x3 board' )
    assert( is_valid_row?( $three_by_three_board, 2 ), 'is_valid_row?() is true when row #2 on a 3x3 board' )
    assert( is_valid_row?( $three_by_three_board, 3 ), 'is_valid_row?() is true when row #3 on a 3x3 board' )
  end

  def test_is_valid_row_false()
    refute( is_valid_row?( $three_by_three_board, 0 ), 'is_valid_row?() is false when row below range on a 3x3 board' )
    refute( is_valid_row?( $three_by_three_board, 4 ), 'is_valid_row?() is false when row above range on a 3x3 board' )

    refute( is_valid_row?( $three_by_three_board, nil ), 'is_valid_row?() is false when row is undefined on a 3x3 board' )

    refute( is_valid_row?( nil, 1 ), 'is_valid_row?() is false when row #1 on an undefined board' )
  end

  def test_is_valid_column_true()
    assert( is_valid_column?( $three_by_three_board, 1 ), 'is_valid_column?() is true when column #1 on a 3x3 board' )
    assert( is_valid_column?( $three_by_three_board, 2 ), 'is_valid_column?() is true when column #2 on a 3x3 board' )
    assert( is_valid_column?( $three_by_three_board, 3 ), 'is_valid_column?() is true when column #3 on a 3x3 board' )
  end

  def test_is_valid_column_false()
    refute( is_valid_column?( $three_by_three_board, 0 ), 'is_valid_column?() is false when column below range on a 3x3 board' )
    refute( is_valid_column?( $three_by_three_board, 4 ), 'is_valid_column?() is false when column above range on a 3x3 board' )

    refute( is_valid_column?( $three_by_three_board, nil ), 'is_valid_column?() is false when column is undefined on a 3x3 board' )

    refute( is_valid_column?( nil, 1 ), 'is_valid_column?() is false when column #1 on an undefined board' )
  end

  def test_get_piece_valid()
    assert_equal( '' , get_piece( $board_with_pieces, 1, 1 ), 'get_piece() empty cell at ( 1, 1 ) on a 3x3 board' )
    assert_equal( 'X', get_piece( $board_with_pieces, 1, 2 ), 'get_piece() X in  cell at ( 1, 2 ) on a 3x3 board' )
    assert_equal( 'O', get_piece( $board_with_pieces, 2, 3 ), 'get_piece() O in  cell at ( 2, 3 ) on a 3x3 board' )
  end

  def test_get_piece_invalid()
    assert_nil( get_piece( $board_with_pieces, 0, 0 ), 'get_piece() in cell at ( 0, 0 ) on a 3x3 board' )
    assert_nil( get_piece( $board_with_pieces, 0, 1 ), 'get_piece() in cell at ( 0, 1 ) on a 3x3 board' )
    assert_nil( get_piece( $board_with_pieces, 1, 0 ), 'get_piece() in cell at ( 1, 0 ) on a 3x3 board' )

    assert_nil( get_piece( $board_with_pieces, 4, 4 ), 'get_piece() in cell at ( 4, 4 ) on a 3x3 board' )
    assert_nil( get_piece( $board_with_pieces, 3, 4 ), 'get_piece() in cell at ( 3, 4 ) on a 3x3 board' )
    assert_nil( get_piece( $board_with_pieces, 4, 3 ), 'get_piece() in cell at ( 4, 3 ) on a 3x3 board' )

    assert_nil( get_piece( $board_with_pieces, nil, nil ), 'get_piece() in cell at invalid_range on a  3x3 board' )

    assert_nil( get_piece( nil, 1, 1 ), 'get_piece() in cell at ( 1, 1 ) on an undefined board' )
  end

  def test_set_piece_valid()
    assert_equal( $board_with_more_pieces , set_piece( $board_with_pieces, 3, 1, 'X' ), 'set_piece() X at cell ( 3, 1 ) on a 3x3 board' )
    assert_equal( $board_with_other_pieces, set_piece( $board_with_pieces, 1, 2, 'O' ), 'set_piece() O at cell ( 1, 2 ) on a 3x3 board' )
  end

  def test_set_piece_invalid()
    assert_equal( $board_with_pieces, set_piece( $board_with_pieces, 0, 0, 'E' ), 'set_piece() E on cell ( 0, 0 ) on a 3x3 board' )
    assert_equal( $board_with_pieces, set_piece( $board_with_pieces, 0, 1, 'E' ), 'set_piece() E on cell ( 0, 1 ) on a 3x3 board' )
    assert_equal( $board_with_pieces, set_piece( $board_with_pieces, 1, 0, 'E' ), 'set_piece() E on cell ( 1, 0 ) on a 3x3 board' )
                  
    assert_equal( $board_with_pieces, set_piece( $board_with_pieces, 4, 4, 'E' ), 'set_piece() E on cell ( 4, 4 ) on a 3x3 board' )
    assert_equal( $board_with_pieces, set_piece( $board_with_pieces, 3, 4, 'E' ), 'set_piece() E on cell ( 3, 4 ) on a 3x3 board' )
    assert_equal( $board_with_pieces, set_piece( $board_with_pieces, 4, 3, 'E' ), 'set_piece() E on cell ( 4, 3 ) on a 3x3 board' )

    assert_equal( $board_with_pieces, set_piece( $board_with_pieces, nil, nil, 'E' ), 'set_piece() E on cell at invalid range on a 3x3 board' )

    assert_nil( set_piece( nil, 1, 1, 'E' ), 'set_piece() E on cell ( 1, 1 ) on an undefined board' )
  end

end

if __FILE__ == $0
end
