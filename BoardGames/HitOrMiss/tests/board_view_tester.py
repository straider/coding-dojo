#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unittest

import os
import sys

top_folder = os.path.dirname( sys.path[ 0 ] )
sys.path.append( os.path.join( top_folder, 'include', 'libpython' ) )

import board_view

one_by_one_board     = [ [ 'x' ] ]
one_by_two_board     = [ [ '', 'x' ] ]
two_by_two_board     = [ [ '', '' ], [ '', 'x' ] ]
three_by_three_board = [ [ '' , '' , ''  ], [ '' , 'x', '' ], [ '' , '', '' ] ]
board_with_misses    = [ [ 'O', 'O', 'O' ], [ 'O', 'x', '' ], [ '' , '', '' ] ]

one_by_one_board_lines     = [ '     A  '
                             , '   +---+'
                             , ' 1 | . |'
                             , '   +---+'
                             ]
one_by_two_board_lines     = [ '     A   B  '
                             , '   +---+---+'
                             , ' 1 | . | . |'
                             , '   +---+---+'
                             ]
two_by_two_board_lines     = [ '     A   B  '
                             , '   +---+---+'
                             , ' 1 | . | . |'
                             , '   +---+---+'
                             , ' 2 | . | . |'
                             , '   +---+---+'
                             ]
three_by_three_board_lines = [ '     A   B   C  '
                             , '   +---+---+---+'
                             , ' 1 | . | . | . |'
                             , '   +---+---+---+'
                             , ' 2 | . | . | . |'
                             , '   +---+---+---+'
                             , ' 3 | . | . | . |'
                             , '   +---+---+---+'
                             ]
board_with_misses_lines    = [ '     A   B   C  '
                             , '   +---+---+---+'
                             , ' 1 | O | O | O |'
                             , '   +---+---+---+'
                             , ' 2 | O | . | . |'
                             , '   +---+---+---+'
                             , ' 3 | . | . | . |'
                             , '   +---+---+---+'
                             ]

class TestCases( unittest.TestCase ) :

  def test_build_separator_line_valid( self ) :
    self.assertEqual( board_view.build_separator_line( 1 ), '   +---+'        , 'build_separator_line() for a board of size = 1' )
    self.assertEqual( board_view.build_separator_line( 2 ), '   +---+---+'    , 'build_separator_line() for a board of size = 2' )
    self.assertEqual( board_view.build_separator_line( 3 ), '   +---+---+---+', 'build_separator_line() for a board of size = 3' )

  def test_build_separator_line_invalid( self ) :
    self.assertIsNone( board_view.build_separator_line(  0   ), 'build_separator_line() for a board of size =  0'      )
    self.assertIsNone( board_view.build_separator_line( -1   ), 'build_separator_line() for a board of size = -1'      )
    self.assertIsNone( board_view.build_separator_line( None ), 'build_separator_line() for a board of undefined size' )

  def test_build_header_line_valid( self ) :
    self.assertEqual( board_view.build_header_line( 1 ), '     A  '        , 'build_header_line() for a board of size = 1' )
    self.assertEqual( board_view.build_header_line( 2 ), '     A   B  '    , 'build_header_line() for a board of size = 2' )
    self.assertEqual( board_view.build_header_line( 3 ), '     A   B   C  ', 'build_header_line() for a board of size = 3' )

  def test_build_header_line_invalid( self ) :
    self.assertIsNone( board_view.build_header_line(  0   ), 'build_header_line() for a board of size =  0'      )
    self.assertIsNone( board_view.build_header_line( -1   ), 'build_header_line() for a board of size = -1'      )
    self.assertIsNone( board_view.build_header_line( None ), 'build_header_line() for a board of undefined size' )

  def test_build_row_line_valid( self ) :
    self.assertEqual( board_view.build_row_line( one_by_one_board    , 1 ), ' 1 | . |'        , 'build_row_line() for row #1 of a clean 1x1 board'       )
    self.assertEqual( board_view.build_row_line( one_by_two_board    , 1 ), ' 1 | . | . |'    , 'build_row_line() for row #1 of a clean 1x2 board'       )
    self.assertEqual( board_view.build_row_line( two_by_two_board    , 1 ), ' 1 | . | . |'    , 'build_row_line() for row #1 of a clean 2x2 board'       )
    self.assertEqual( board_view.build_row_line( two_by_two_board    , 2 ), ' 2 | . | . |'    , 'build_row_line() for row #2 of a clean 2x2 board'       )
    self.assertEqual( board_view.build_row_line( three_by_three_board, 1 ), ' 1 | . | . | . |', 'build_row_line() for row #1 of a clean 3x3 board'       )
    self.assertEqual( board_view.build_row_line( three_by_three_board, 2 ), ' 2 | . | . | . |', 'build_row_line() for row #2 of a clean 3x3 board'       )
    self.assertEqual( board_view.build_row_line( three_by_three_board, 3 ), ' 3 | . | . | . |', 'build_row_line() for row #3 of a clean 3x3 board'       )
    self.assertEqual( board_view.build_row_line( board_with_misses   , 1 ), ' 1 | O | O | O |', 'build_row_line() for row #1 of a 3x3 board with misses' )
    self.assertEqual( board_view.build_row_line( board_with_misses   , 2 ), ' 2 | O | . | . |', 'build_row_line() for row #2 of a 3x3 board with misses' )
    self.assertEqual( board_view.build_row_line( board_with_misses   , 3 ), ' 3 | . | . | . |', 'build_row_line() for row #3 of a 3x3 board with misses' )

  def test_build_row_line_invalid( self ) :
    self.assertIsNone( board_view.build_row_line( three_by_three_board, 0    ), 'build_row_line() for row below range' )
    self.assertIsNone( board_view.build_row_line( three_by_three_board, 4    ), 'build_row_line() for row above range' )
    self.assertIsNone( board_view.build_row_line( three_by_three_board, None ), 'build_row_line() for undefined row'   )

  def test_build_board_lines_valid( self ) :
    self.assertListEqual( board_view.build_board_lines( one_by_one_board     ), one_by_one_board_lines    , 'build_board_lines() for a clean 1x1 board'       )
    self.assertListEqual( board_view.build_board_lines( one_by_two_board     ), one_by_two_board_lines    , 'build_board_lines() for a clean 1x2 board'       )
    self.assertListEqual( board_view.build_board_lines( two_by_two_board     ), two_by_two_board_lines    , 'build_board_lines() for a clean 2x2 board'       )
    self.assertListEqual( board_view.build_board_lines( three_by_three_board ), three_by_three_board_lines, 'build_board_lines() for a clean 3x3 board'       )
    self.assertListEqual( board_view.build_board_lines( board_with_misses    ), board_with_misses_lines   , 'build_board_lines() for a 3x3 board with misses' )

  def test_build_board_lines_invalid( self ) :
    self.assertIsNone( board_view.build_board_lines( []   ), 'build_board_lines() for a 0x0 board'      )
    self.assertIsNone( board_view.build_board_lines( None ), 'build_board_lines() for an invalid board' )

if __name__ == '__main__' :
  unittest.main()
