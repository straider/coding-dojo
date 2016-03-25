#!/usr/bin/env ruby
# encoding: utf-8

require 'test/unit'

top_folder       = File.dirname( File.dirname( File.expand_path( __FILE__ ) ) )
libraries_folder = File.join( top_folder, 'include', 'libruby' )
$LOAD_PATH.unshift( libraries_folder ) unless $LOAD_PATH.include?( libraries_folder )

require 'board_view'

$one_by_one_board     = [ [ 'x' ] ];
$one_by_two_board     = [ [ '', 'x' ] ];
$two_by_two_board     = [ [ '', '' ], [ '', 'x' ] ];
$three_by_three_board = [ [ '' , '' , ''  ], [ '' , 'x', '' ], [ '' , '', '' ] ];
$board_with_misses    = [ [ 'O', 'O', 'O' ], [ 'O', 'x', '' ], [ '' , '', '' ] ];

$one_by_one_board_lines     = [ '     A  ' \
                              , '   +---+' \
                              , ' 1 | . |' \
                              , '   +---+' \
                              ];
$one_by_two_board_lines     = [ '     A   B  ' \
                              , '   +---+---+' \
                              , ' 1 | . | . |' \
                              , '   +---+---+' \
                              ];
$two_by_two_board_lines     = [ '     A   B  ' \
                              , '   +---+---+' \
                              , ' 1 | . | . |' \
                              , '   +---+---+' \
                              , ' 2 | . | . |' \
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
$board_with_misses_lines    = [ '     A   B   C  ' \
                              , '   +---+---+---+' \
                              , ' 1 | O | O | O |' \
                              , '   +---+---+---+' \
                              , ' 2 | O | . | . |' \
                              , '   +---+---+---+' \
                              , ' 3 | . | . | . |' \
                              , '   +---+---+---+' \
                              ];

class TestCases < Test::Unit::TestCase

  def test_build_separator_line_valid()
    assert_equal( '   +---+'        , build_separator_line( 1 ), 'build_separator_line() for a board of size = 1' )
    assert_equal( '   +---+---+'    , build_separator_line( 2 ), 'build_separator_line() for a board of size = 2' )
    assert_equal( '   +---+---+---+', build_separator_line( 3 ), 'build_separator_line() for a board of size = 3' )
  end

  def test_build_separator_line_invalid()
    assert_nil( build_separator_line(  0  ), 'build_separator_line() for a board of size =  0'      )
    assert_nil( build_separator_line( -1  ), 'build_separator_line() for a board of size = -1'      )
    assert_nil( build_separator_line( nil ), 'build_separator_line() for a board of undefined size' )
  end

  def test_build_header_line_valid()
    assert_equal( '     A  '        , build_header_line( 1 ), 'build_header_line() for a board of size = 1' )
    assert_equal( '     A   B  '    , build_header_line( 2 ), 'build_header_line() for a board of size = 2' )
    assert_equal( '     A   B   C  ', build_header_line( 3 ), 'build_header_line() for a board of size = 3' )
  end

  def test_build_header_line_invalid()
    assert_nil( build_header_line(  0  ), 'build_header_line() for a board of size =  0'      )
    assert_nil( build_header_line( -1  ), 'build_header_line() for a board of size = -1'      )
    assert_nil( build_header_line( nil ), 'build_header_line() for a board of undefined size' )
  end

  def test_build_row_line_valid()
    assert_equal( ' 1 | . |'        , build_row_line( $one_by_one_board    , 1 ), 'build_row_line() for row #1 of a clean 1x1 board'       )
    assert_equal( ' 1 | . | . |'    , build_row_line( $one_by_two_board    , 1 ), 'build_row_line() for row #1 of a clean 1x2 board'       )
    assert_equal( ' 1 | . | . |'    , build_row_line( $two_by_two_board    , 1 ), 'build_row_line() for row #1 of a clean 2x2 board'       )
    assert_equal( ' 2 | . | . |'    , build_row_line( $two_by_two_board    , 2 ), 'build_row_line() for row #2 of a clean 2x2 board'       )
    assert_equal( ' 1 | . | . | . |', build_row_line( $three_by_three_board, 1 ), 'build_row_line() for row #1 of a clean 3x3 board'       )
    assert_equal( ' 2 | . | . | . |', build_row_line( $three_by_three_board, 2 ), 'build_row_line() for row #2 of a clean 3x3 board'       )
    assert_equal( ' 3 | . | . | . |', build_row_line( $three_by_three_board, 3 ), 'build_row_line() for row #3 of a clean 3x3 board'       )
    assert_equal( ' 1 | O | O | O |', build_row_line( $board_with_misses   , 1 ), 'build_row_line() for row #1 of a 3x3 board with misses' )
    assert_equal( ' 2 | O | . | . |', build_row_line( $board_with_misses   , 2 ), 'build_row_line() for row #2 of a 3x3 board with misses' )
    assert_equal( ' 3 | . | . | . |', build_row_line( $board_with_misses   , 3 ), 'build_row_line() for row #3 of a 3x3 board with misses' )
  end

  def test_build_row_line_invalid()
    assert_nil( build_row_line( $three_by_three_board, 0   ), 'build_row_line() for row below range' )
    assert_nil( build_row_line( $three_by_three_board, 4   ), 'build_row_line() for row above range' )
    assert_nil( build_row_line( $three_by_three_board, nil ), 'build_row_line() for undefined row'   )
  end

  def test_build_board_lines_valid()
    assert_equal( $one_by_one_board_lines    , build_board_lines( $one_by_one_board     ), 'build_board_lines() for a clean 1x1 board'       )
    assert_equal( $one_by_two_board_lines    , build_board_lines( $one_by_two_board     ), 'build_board_lines() for a clean 1x2 board'       )
    assert_equal( $two_by_two_board_lines    , build_board_lines( $two_by_two_board     ), 'build_board_lines() for a clean 2x2 board'       )
    assert_equal( $three_by_three_board_lines, build_board_lines( $three_by_three_board ), 'build_board_lines() for a clean 3x3 board'       )
    assert_equal( $board_with_misses_lines   , build_board_lines( $board_with_misses    ), 'build_board_lines() for a 3x3 board with misses' )
  end

  def test_build_board_lines_invalid()
    assert_nil( build_board_lines( []  ), 'build_board_lines() for a 0x0 board'      )
    assert_nil( build_board_lines( nil ), 'build_board_lines() for an invalid board' )
  end

end

if __FILE__ == $0
end
