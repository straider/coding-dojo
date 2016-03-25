#!/usr/bin/env ruby
# encoding: utf-8

require 'test/unit'
require 'stringio'

top_folder       = File.dirname( File.dirname( File.expand_path( __FILE__ ) ) )
libraries_folder = File.join( top_folder, 'include', 'libruby' )
$LOAD_PATH.unshift( libraries_folder ) unless $LOAD_PATH.include?( libraries_folder )

require 'game_controller'

$one_by_one_board_lines       = [ '     A  ' \
                                , '   +---+' \
                                , ' 1 | . |' \
                                , '   +---+' \
                                ]
$winner_1x1_board_lines       = [ '     A  ' \
                                , '   +---+' \
                                , ' 1 | X |' \
                                , '   +---+' \
                                ]
$one_by_two_board_lines       = [ '     A   B  ' \
                                , '   +---+---+' \
                                , ' 1 | . | . |' \
                                , '   +---+---+' \
                                ]
$first_move_1x2_board_lines_1 = [ '     A   B  ' \
                                , '   +---+---+' \
                                , ' 1 | X | . |' \
                                , '   +---+---+' \
                                ]
$first_move_1x2_board_lines_2 = [ '     A   B  ' \
                                , '   +---+---+' \
                                , ' 1 | O | . |' \
                                , '   +---+---+' \
                                ]

$start_score_lines = [ 'Game Results:'                      \
                     , '\tGames Played.........  0'         \
                     , '\tPlayer has won.......  0 time(s)' \
                     , '\tPlayer has miss......  0 time(s)' \
                     ]
$first_score_lines = [ 'Game Results:'                      \
                     , '\tGames Played.........  1'         \
                     , '\tPlayer has won.......  0 time(s)' \
                     , '\tPlayer has miss......  0 time(s)' \
                     ]

class TestCases < Test::Unit::TestCase

  def setup
    $stdout = StringIO.new
  end

  def teardown
    $stdout = STDOUT
  end

  def test_initialize_game_valid()
    assert_equal( '1x1', initialize_game( 1, 1 ), 'initialize_game() for a 1x1 board' )
    assert_equal( '1x2', initialize_game( 1, 2 ), 'initialize_game() for a 1x2 board' )
  end

  def test_initialize_game_invalid()
    assert_nil( initialize_game( nil, nil ), 'initialize_game() for a 1x1 board' )
    assert_nil( initialize_game( 1  , nil ), 'initialize_game() for a 1x2 board' )
    assert_nil( initialize_game( nil, 1   ), 'initialize_game() for a 1x2 board' )

    assert_nil( initialize_game( 0, 0 ), 'initialize_game() for a 0x0 board' )
    assert_nil( initialize_game( 1, 0 ), 'initialize_game() for a 1x0 board' )
    assert_nil( initialize_game( 0, 1 ), 'initialize_game() for a 0x1 board' )

    assert_nil( initialize_game( -1, -1 ), 'initialize_game() for a -1x-1 board' )
    assert_nil( initialize_game(  1, -1 ), 'initialize_game() for a  1x-1 board' )
    assert_nil( initialize_game( -1,  1 ), 'initialize_game() for a -1x1  board' )
  end

  def test_reset_game()
    initialize_game( 1, 1 )
    assert_equal( '1x1', reset_game, 'reset_game() for a 1x1 board' )

    initialize_game( 1, 2 )
    assert_equal( '1x2', reset_game, 'reset_game() for a 1x2 board' )
  end

  def test_print_board()
    initialize_game( 1, 1 )
    assert_equal( $one_by_one_board_lines, print_board(), 'print_board() for a 1x1 board' )

    initialize_game( 1, 2 )
    assert_equal( $one_by_two_board_lines, print_board(), 'print_board() for a 1x2 board' )
  end

  def test_is_valid_cell_reference_valid()
    initialize_game( 1, 1 )
    assert( is_valid_cell_reference?( 1, 'A' ), 'is_valid_cell_reference?() is true for reference ( 1, A ) on a 1x1 board' )

    initialize_game( 1, 2 )
    assert( is_valid_cell_reference?( 1, 'A' ), 'is_valid_cell_reference?() is true for reference ( 1, A ) on a 1x2 board' )
    assert( is_valid_cell_reference?( 1, 'B' ), 'is_valid_cell_reference?() is true for reference ( 1, B ) on a 1x2 board' )
  end

  def test_is_valid_cell_reference_invalid()
    refute( is_valid_cell_reference?( nil, nil ), 'is_valid_cell_reference?() is false when range is undefined in any board'                   )
    refute( is_valid_cell_reference?( nil, 1   ), 'is_valid_cell_reference?() is false when range has an undefined row    number in any board' )
    refute( is_valid_cell_reference?( 1  , nil ), 'is_valid_cell_reference?() is false when range has an undefined column number in any board' )

    refute( is_valid_cell_reference?( 'A', 'A' ), 'is_valid_cell_reference?() is false when ( A, A ) in any board' )
    refute( is_valid_cell_reference?( 'A', '1' ), 'is_valid_cell_reference?() is false when ( A, 1 ) in any board' )
    refute( is_valid_cell_reference?( 'A', 1   ), 'is_valid_cell_reference?() is false when ( A, 1 ) in any board' )
    refute( is_valid_cell_reference?( '1', 'A' ), 'is_valid_cell_reference?() is false when ( 1, A ) in any board' )
  end

  def test_is_valid_cell_reference_below_range()
    refute( is_valid_cell_reference?(  0, ' ' ), 'is_valid_cell_reference?() is false when (  0,   ) in any board' )
    refute( is_valid_cell_reference?(  0, 'A' ), 'is_valid_cell_reference?() is false when (  0, A ) in any board' )
    refute( is_valid_cell_reference?(  1, ' ' ), 'is_valid_cell_reference?() is false when (  1,   ) in any board' )
    refute( is_valid_cell_reference?( -1, ' ' ), 'is_valid_cell_reference?() is false when ( -1,   ) in any board' )
    refute( is_valid_cell_reference?( -1, 'A' ), 'is_valid_cell_reference?() is false when ( -1, A ) in any board' )
    refute( is_valid_cell_reference?(  1, ' ' ), 'is_valid_cell_reference?() is false when (  1,   ) in any board' )
  end

  def test_is_valid_cell_reference_above_range()
    initialize_game( 1, 1 )
    refute( is_valid_cell_reference?( 1, 'B' ), 'is_valid_cell_reference?() is false for reference ( 1, B ) on a 1x1 board' )

    initialize_game( 1, 1 )
    refute( is_valid_cell_reference?( 2, 'A' ), 'is_valid_cell_reference?() is false for reference ( 2, A ) on a 1x2 board' )
  end

  def test_is_valid_answer_valid()
    assert( is_valid_answer?( 'y' ), 'is_valid_answer?() is true for answer y' )
    assert( is_valid_answer?( 'Y' ), 'is_valid_answer?() is true for answer Y' )
    assert( is_valid_answer?( 'n' ), 'is_valid_answer?() is true for answer n' )
    assert( is_valid_answer?( 'N' ), 'is_valid_answer?() is true for answer N' )

    assert( is_valid_answer?( 'yes' ), 'is_valid_answer?() is true for answer yes' )
    assert( is_valid_answer?( 'Yes' ), 'is_valid_answer?() is true for answer Yes' )
    assert( is_valid_answer?( 'YES' ), 'is_valid_answer?() is true for answer YES' )
    assert( is_valid_answer?( 'no'  ), 'is_valid_answer?() is true for answer no'  )
    assert( is_valid_answer?( 'No'  ), 'is_valid_answer?() is true for answer No'  )
    assert( is_valid_answer?( 'NO'  ), 'is_valid_answer?() is true for answer NO'  )
  end

  def test_is_valid_answer_invalid()
    refute( is_valid_answer?( ''  ), 'is_valid_answer?() is false for an empty answer'     )
    refute( is_valid_answer?( nil ), 'is_valid_answer?() is false for an undefined answer' )
    refute( is_valid_answer?( 1   ), 'is_valid_answer?() is false for answer 1'            )
    refute( is_valid_answer?( 'a' ), 'is_valid_answer?() is false for answer a'            )
    refute( is_valid_answer?( 'A' ), 'is_valid_answer?() is false for answer A'            )
    refute( is_valid_answer?( 'x' ), 'is_valid_answer?() is false for answer x'            )
    refute( is_valid_answer?( 'X' ), 'is_valid_answer?() is false for answer X'            )
  end

  def test_print_score()
    initialize_game( 1, 1 )
    assert_equal( $start_score_lines, print_score(), 'print_score() without playing' )

    initialize_game( 1, 1 )
    reset_game
    assert_equal( $first_score_lines, print_score(), 'print_score() after first game starts' )
  end

  def test_playing_on_1x1()
    initialize_game( 1, 1 )
    reset_game
    assert( is_win?( 1, 'A' ), 'is_win?() is true after first move on a 1x1 board' )
    put_piece( 1, 'A' )
    assert( has_no_more_attempts?, 'has_no_more_attempts?() is true after first move on a 1x1 board' )
    assert_equal( $winner_1x1_board_lines, print_board(), 'print_board() after first move on a 1x1 board' )
    reset_game
    assert_equal( $one_by_one_board_lines, print_board(), 'print_board() after a reset on a 1x1 board' )
  end

  def test_playing_on_1x2()
    initialize_game( 1, 2 )
    reset_game
    first_move_1x2_board_lines = ( is_win?( 1, 'A' ) ) ? $first_move_1x2_board_lines_1 : $first_move_1x2_board_lines_2
    put_piece( 1, 'A' )
    assert( has_no_more_attempts?, 'has_no_more_attempts?() is true after first move on a 1x2 board' )
    assert_equal( first_move_1x2_board_lines, print_board(), 'print_board() after first move on a 1x2 board' )
    reset_game
    assert_equal( $one_by_two_board_lines, print_board(), 'print_board() after a reset on a 1x2 board' )
  end

  def test_playing_on_2x2()
    initialize_game( 2, 2 )
    reset_game
    put_piece( 1, 'A' )
    refute( has_no_more_attempts?, 'has_no_more_attempts?() is false after first move on a 2x2 board' )
  end

end

if __FILE__ == $0
end
