#!/usr/bin/env ruby
# encoding: utf-8

require 'test/unit'
require 'stringio'

top_folder       = File.dirname( File.dirname( File.expand_path( __FILE__ ) ) )
libraries_folder = File.join( top_folder, 'include', 'libruby' )
$LOAD_PATH.unshift( libraries_folder ) unless $LOAD_PATH.include?( libraries_folder )

require 'board_controller'

$one_by_one_board_lines     = [ '     A  ' \
                              , '   +---+' \
                              , ' 1 | . |' \
                              , '   +---+' \
                              ];
$winner_1x1_board_lines     = [ '     A  ' \
                              , '   +---+' \
                              , ' 1 | X |' \
                              , '   +---+' \
                              ];
$one_by_two_board_lines     = [ '     A   B  ' \
                              , '   +---+---+' \
                              , ' 1 | . | . |' \
                              , '   +---+---+' \
                              ];
$full_1x2_board_lines_1     = [ '     A   B  ' \
                              , '   +---+---+' \
                              , ' 1 | X | O |' \
                              , '   +---+---+' \
                              ];
$full_1x2_board_lines_2     = [ '     A   B  ' \
                              , '   +---+---+' \
                              , ' 1 | O | X |' \
                              , '   +---+---+' \
                              ];
$two_by_two_board_lines     = [ '     A   B  ' \
                              , '   +---+---+' \
                              , ' 1 | . | . |' \
                              , '   +---+---+' \
                              , ' 2 | . | . |' \
                              , '   +---+---+' \
                              ];
$three_by_two_board_lines   = [ '     A   B  ' \
                              , '   +---+---+' \
                              , ' 1 | . | . |' \
                              , '   +---+---+' \
                              , ' 2 | . | . |' \
                              , '   +---+---+' \
                              , ' 3 | . | . |' \
                              , '   +---+---+' \
                              ];
$three_by_three_board_lines = [ '     A   B   C  ' \
                              , '   +---+---+---+' \
                              , ' 1 | . | . | . |' \
                              , '   +---+---+---+' \
                              , ' 2 | . | . | . |' \
                              , '   +---+---+---+' \
                              , ' 3 | . | . | . |' \
                              , '   +---+---+---+' \
                              ];
$two_by_four_board_lines    = [ '     A   B   C   D  ' \
                              , '   +---+---+---+---+' \
                              , ' 1 | . | . | . | . |' \
                              , '   +---+---+---+---+' \
                              , ' 2 | . | . | . | . |' \
                              , '   +---+---+---+---+' \
                              ];

class TestCases < Test::Unit::TestCase

  def setup
    $stdout = StringIO.new
  end

  def teardown
    $stdout = STDOUT
  end

  def test_initialize_board_valid()
    assert_equal( '1x1', initialize_board( 1, 1 ), 'initialize_board() for a 1x1 board' )
    assert_equal( '1x2', initialize_board( 1, 2 ), 'initialize_board() for a 1x2 board' )
    assert_equal( '2x2', initialize_board( 2, 2 ), 'initialize_board() for a 2x2 board' )
    assert_equal( '3x2', initialize_board( 3, 2 ), 'initialize_board() for a 3x2 board' )
    assert_equal( '3x3', initialize_board( 3, 3 ), 'initialize_board() for a 3x3 board' )
    assert_equal( '2x4', initialize_board( 2, 4 ), 'initialize_board() for a 2x4 board' )
  end

  def test_initialize_board_invalid()
    assert_nil( initialize_board( 0  , 1   ), 'initialize_board() for a 0x1 board'                     )
    assert_nil( initialize_board( 1  , 0   ), 'initialize_board() for a 1x0 board'                     )
    assert_nil( initialize_board( nil, nil ), 'initialize_board() for a board of undefined dimensions' )
  end

  def test_reset_board_valid()
    initialize_board( 1, 1 )
    assert_equal( '1x1', reset_board, 'reset_board() for a 1x1 board' )
    initialize_board( 1, 2 )
    assert_equal( '1x2', reset_board, 'reset_board() for a 1x2 board' )
    initialize_board( 2, 2 )
    assert_equal( '2x2', reset_board, 'reset_board() for a 2x2 board' )
    initialize_board( 3, 2 )
    assert_equal( '3x2', reset_board, 'reset_board() for a 3x2 board' )
    initialize_board( 3, 3 )
    assert_equal( '3x3', reset_board, 'reset_board() for a 3x3 board' )
    initialize_board( 2, 4 )
    assert_equal( '2x4', reset_board, 'reset_board() for a 2x4 board' )
  end

  def test_reset_board_invalid()
    initialize_board( nil, nil )
    assert_nil( reset_board, 'reset_board() before initialize_board()' )
  end

  def test_show_board_valid()
    initialize_board( 1, 1 )
    assert_equal( $one_by_one_board_lines    , show_board(), 'show_board() for a 1x1 board' )
    initialize_board( 1, 2 )
    assert_equal( $one_by_two_board_lines    , show_board(), 'show_board() for a 1x2 board' )
    initialize_board( 2, 2 )
    assert_equal( $two_by_two_board_lines    , show_board(), 'show_board() for a 2x2 board' )
    initialize_board( 3, 2 )
    assert_equal( $three_by_two_board_lines  , show_board(), 'show_board() for a 3x2 board' )
    initialize_board( 3, 3 )
    assert_equal( $three_by_three_board_lines, show_board(), 'show_board() for a 3x3 board' )
    initialize_board( 2, 4 )
    assert_equal( $two_by_four_board_lines   , show_board(), 'show_board() for a 2x4 board' )
  end

  def test_show_board_invalid()
    initialize_board( nil, nil )
    assert_nil( show_board(), 'show_board() before initialize_board()' )
  end

  def test_is_valid_cell_valid()
    initialize_board( 1, 1 )
    assert( is_valid_cell?( 1, 'A' ), 'is_valid_cell?() is true when ( 1, A ) in a 1x1 board' )

    initialize_board( 1, 2 )
    assert( is_valid_cell?( 1, 'A' ), 'is_valid_cell?() is true when ( 1, A ) in a 1x2 board' )
    assert( is_valid_cell?( 1, 'B' ), 'is_valid_cell?() is true when ( 1, B ) in a 1x2 board' )

    initialize_board( 2, 1 )
    assert( is_valid_cell?( 1, 'A' ), 'is_valid_cell?() is true when ( 1, A ) in a 2x1 board' )
    assert( is_valid_cell?( 2, 'A' ), 'is_valid_cell?() is true when ( 2, A ) in a 2x1 board' )
  end

  def test_is_valid_cell_invalid()
    refute( is_valid_cell?( nil, nil ), 'is_valid_cell?() is false when range is undefined in any board'                   )
    refute( is_valid_cell?( nil, 1   ), 'is_valid_cell?() is false when range has an undefined row    number in any board' )
    refute( is_valid_cell?( 1  , nil ), 'is_valid_cell?() is false when range has an undefined column number in any board' )

    refute( is_valid_cell?( 'A', 'A' ), 'is_valid_cell?() is false when ( A, A ) in any board' )
    refute( is_valid_cell?( 'A', '1' ), 'is_valid_cell?() is false when ( A, 1 ) in any board' )
    refute( is_valid_cell?( 'A', 1   ), 'is_valid_cell?() is false when ( A, 1 ) in any board' )
    refute( is_valid_cell?( '1', 'A' ), 'is_valid_cell?() is false when ( 1, A ) in any board' )
  end

  def test_is_valid_cell_below_range()
    refute( is_valid_cell?(  0, ' ' ), 'is_valid_cell?() is false when (  0,   ) in any board' )
    refute( is_valid_cell?(  0, 'A' ), 'is_valid_cell?() is false when (  0, A ) in any board' )
    refute( is_valid_cell?(  1, ' ' ), 'is_valid_cell?() is false when (  1,   ) in any board' )
    refute( is_valid_cell?( -1, ' ' ), 'is_valid_cell?() is false when ( -1,   ) in any board' )
    refute( is_valid_cell?( -1, 'A' ), 'is_valid_cell?() is false when ( -1, A ) in any board' )
    refute( is_valid_cell?(  1, ' ' ), 'is_valid_cell?() is false when (  1,   ) in any board' )
  end

  def test_is_valid_cell_above_range()
    initialize_board( 1, 1 )
    refute( is_valid_cell?( 1, 'B' ), 'is_valid_cell?() is false when ( 1, B ) in a 1x1 board' )
    refute( is_valid_cell?( 2, 'A' ), 'is_valid_cell?() is false when ( 2, A ) in a 1x1 board' )
  end

  def test_is_hit_valid()
    initialize_board( 1, 1 )
    reset_board
    assert( is_hit?( 1, 'A' ), 'is_hit?() is true when ( 1, A ) in a 1x1 board' )
  end

  def test_is_hit_invalid()
    refute( is_hit?( nil, nil ), 'is_hit?() is false when range is undefined in any board'                   )
    refute( is_hit?( nil, 1   ), 'is_hit?() is false when range has an undefined row number in any board'    )
    refute( is_hit?( 1  , nil ), 'is_hit?() is false when range has an undefined column number in any board' )

    refute( is_hit?( 'A', 'A' ), 'is_hit?() is false when ( A, A ) in any board' )
    refute( is_hit?( 'A', '1' ), 'is_hit?() is false when ( A, 1 ) in any board' )
    refute( is_hit?( 'A', 1   ), 'is_hit?() is false when ( A, 1 ) in any board' )
    refute( is_hit?( '1', 'A' ), 'is_hit?() is false when ( 1, A ) in any board' )
  end

  def test_is_hit_below_range()
    refute( is_hit?(  0, ' ' ), 'is_hit?() is false when (  0,   ) in any board' )
    refute( is_hit?(  0, 'A' ), 'is_hit?() is false when (  0, A ) in any board' )
    refute( is_hit?(  1, ' ' ), 'is_hit?() is false when (  1,   ) in any board' )
    refute( is_hit?( -1, ' ' ), 'is_hit?() is false when ( -1,   ) in any board' )
    refute( is_hit?( -1, 'A' ), 'is_hit?() is false when ( -1, A ) in any board' )
    refute( is_hit?(  1, ' ' ), 'is_hit?() is false when (  1,   ) in any board' )
  end

  def test_is_hit_above_range()
    initialize_board( 1, 1 )
    refute( is_hit?( 1, 'B' ), 'is_hit?() is false when ( 1, B ) in a 1x1 board' )
    refute( is_hit?( 2, 'A' ), 'is_hit?() is false when ( 2, A ) in a 1x1 board' )
  end

  def test_win_on_board_1x1()
    initialize_board( 1, 1 )
    reset_board

    assert( mark_cell( 1, 'A' ), 'mark_cell() is true  on an empty 1x1 board' )
    refute( mark_cell( 1, 'A' ), 'mark_cell() is false on a filled 1x1 board' )

    assert_equal( $winner_1x1_board_lines, show_board(), 'show_board() for a winning condition on a 1x1 board' )
  end

  def test_win_on_board_1x2()
    initialize_board( 1, 2 )
    reset_board

    full_1x2_board_lines = is_hit?( 1, 'A' ) ? $full_1x2_board_lines_1 : $full_1x2_board_lines_2

    assert( mark_cell( 1, 'A' ), 'mark_cell() is true on ( 1, A ) of a 1x2 board' )
    assert( mark_cell( 1, 'B' ), 'mark_cell() is true on ( 1, B ) of a 1x2 board' )
    assert_equal( full_1x2_board_lines, show_board(), 'show_board() for a winning condition on a 1x2 board' )
  end

end

if __FILE__ == $0
end
