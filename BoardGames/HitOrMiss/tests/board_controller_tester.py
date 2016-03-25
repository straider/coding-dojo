#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unittest

import os
import sys

top_folder = os.path.dirname( sys.path[ 0 ] )
sys.path.append( os.path.join( top_folder, 'include', 'libpython' ) )

import board_controller

one_by_one_board_lines     = [ '     A  '
                             , '   +---+'
                             , ' 1 | . |'
                             , '   +---+'
                             ]
winner_1x1_board_lines     = [ '     A  '
                             , '   +---+'
                             , ' 1 | X |'
                             , '   +---+'
                             ]
one_by_two_board_lines     = [ '     A   B  '
                             , '   +---+---+'
                             , ' 1 | . | . |'
                             , '   +---+---+'
                             ]
full_1x2_board_lines_1     = [ '     A   B  '
                             , '   +---+---+'
                             , ' 1 | X | O |'
                             , '   +---+---+'
                             ]
full_1x2_board_lines_2     = [ '     A   B  '
                             , '   +---+---+'
                             , ' 1 | O | X |'
                             , '   +---+---+'
                             ]
two_by_two_board_lines     = [ '     A   B  '
                             , '   +---+---+'
                             , ' 1 | . | . |'
                             , '   +---+---+'
                             , ' 2 | . | . |'
                             , '   +---+---+'
                             ]
three_by_two_board_lines   = [ '     A   B  '
                             , '   +---+---+'
                             , ' 1 | . | . |'
                             , '   +---+---+'
                             , ' 2 | . | . |'
                             , '   +---+---+'
                             , ' 3 | . | . |'
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
two_by_four_board_lines    = [ '     A   B   C   D  '
                             , '   +---+---+---+---+'
                             , ' 1 | . | . | . | . |'
                             , '   +---+---+---+---+'
                             , ' 2 | . | . | . | . |'
                             , '   +---+---+---+---+'
                             ]

class TestCases( unittest.TestCase ) :

  standard_output = None

  @classmethod
  def setUpClass( klass ) :
    global standard_output

    standard_output = sys.stdout
    sys.stdout      = open( os.devnull, 'w' )

  @classmethod
  def tearDownClass( klass ) :
    sys.stdout = standard_output

  def test_initialize_board_valid( self ) :
    self.assertEqual( board_controller.initialize_board( 1, 1 ), '1x1', 'initialize_board() for a 1x1 board' )
    self.assertEqual( board_controller.initialize_board( 1, 2 ), '1x2', 'initialize_board() for a 1x2 board' )
    self.assertEqual( board_controller.initialize_board( 2, 2 ), '2x2', 'initialize_board() for a 2x2 board' )
    self.assertEqual( board_controller.initialize_board( 3, 2 ), '3x2', 'initialize_board() for a 3x2 board' )
    self.assertEqual( board_controller.initialize_board( 3, 3 ), '3x3', 'initialize_board() for a 3x3 board' )
    self.assertEqual( board_controller.initialize_board( 2, 4 ), '2x4', 'initialize_board() for a 2x4 board' )

  def test_initialize_board_invalid( self ) :
    self.assertIsNone( board_controller.initialize_board( 0   , 1    ), 'initialize_board() for a 0x1 board'                     )
    self.assertIsNone( board_controller.initialize_board( 1   , 0    ), 'initialize_board() for a 1x0 board'                     )
    self.assertIsNone( board_controller.initialize_board( None, None ), 'initialize_board() for a board of undefined dimensions' )

  def test_reset_board_valid( self ) :
    board_controller.initialize_board( 1, 1 )
    self.assertEqual( board_controller.reset_board(), '1x1', 'reset_board() for a 1x1 board' )
    board_controller.initialize_board( 1, 2 )
    self.assertEqual( board_controller.reset_board(), '1x2', 'reset_board() for a 1x2 board' )
    board_controller.initialize_board( 2, 2 )
    self.assertEqual( board_controller.reset_board(), '2x2', 'reset_board() for a 2x2 board' )
    board_controller.initialize_board( 3, 2 )
    self.assertEqual( board_controller.reset_board(), '3x2', 'reset_board() for a 3x2 board' )
    board_controller.initialize_board( 3, 3 )
    self.assertEqual( board_controller.reset_board(), '3x3', 'reset_board() for a 3x3 board' )
    board_controller.initialize_board( 2, 4 )
    self.assertEqual( board_controller.reset_board(), '2x4', 'reset_board() for a 2x4 board' )

  def test_reset_board_invalid( self ) :
    board_controller.initialize_board( None, None )
    self.assertIsNone( board_controller.reset_board(), 'reset_board() before initialize_board()' )

  def test_show_board_valid( self ) :
    board_controller.initialize_board( 1, 1 )
    self.assertListEqual( board_controller.show_board(), one_by_one_board_lines    , 'show_board() for a 1x1 board' )
    board_controller.initialize_board( 1, 2 )
    self.assertListEqual( board_controller.show_board(), one_by_two_board_lines    , 'show_board() for a 1x2 board' )
    board_controller.initialize_board( 2, 2 )
    self.assertListEqual( board_controller.show_board(), two_by_two_board_lines    , 'show_board() for a 2x2 board' )
    board_controller.initialize_board( 3, 2 )
    self.assertListEqual( board_controller.show_board(), three_by_two_board_lines  , 'show_board() for a 3x2 board' )
    board_controller.initialize_board( 3, 3 )
    self.assertListEqual( board_controller.show_board(), three_by_three_board_lines, 'show_board() for a 3x3 board' )
    board_controller.initialize_board( 2, 4 )
    self.assertListEqual( board_controller.show_board(), two_by_four_board_lines   , 'show_board() for a 2x4 board' )

  def test_show_board_invalid( self ) :
    board_controller.initialize_board( None, None )
    self.assertIsNone( board_controller.show_board(), 'show_board() before initialize_board()' )

  def test_is_valid_cell_valid( self ) :
    board_controller.initialize_board( 1, 1 )
    self.assertTrue( board_controller.is_valid_cell( 1, 'A' ), 'is_valid_cell() is true when ( 1, A ) in a 1x1 board' )

    board_controller.initialize_board( 1, 2 )
    self.assertTrue( board_controller.is_valid_cell( 1, 'A' ), 'is_valid_cell() is true when ( 1, A ) in a 1x2 board' )
    self.assertTrue( board_controller.is_valid_cell( 1, 'B' ), 'is_valid_cell() is true when ( 1, B ) in a 1x2 board' )

    board_controller.initialize_board( 2, 1 )
    self.assertTrue( board_controller.is_valid_cell( 1, 'A' ), 'is_valid_cell() is true when ( 1, A ) in a 2x1 board' )
    self.assertTrue( board_controller.is_valid_cell( 2, 'A' ), 'is_valid_cell() is true when ( 2, A ) in a 2x1 board' )

  def test_is_valid_cell_invalid( self ) :
    self.assertFalse( board_controller.is_valid_cell( None, None ), 'is_valid_cell() is false when range is undefined in any board'                   )
    self.assertFalse( board_controller.is_valid_cell( None, 1    ), 'is_valid_cell() is false when range has an undefined row    number in any board' )
    self.assertFalse( board_controller.is_valid_cell( 1   , None ), 'is_valid_cell() is false when range has an undefined column number in any board' )

    self.assertFalse( board_controller.is_valid_cell( 'A', 'A' ), 'is_valid_cell() is false when ( A, A ) in any board' )
    self.assertFalse( board_controller.is_valid_cell( 'A', '1' ), 'is_valid_cell() is false when ( A, 1 ) in any board' )
    self.assertFalse( board_controller.is_valid_cell( 'A', 1   ), 'is_valid_cell() is false when ( A, 1 ) in any board' )
    self.assertFalse( board_controller.is_valid_cell( '1', 'A' ), 'is_valid_cell() is false when ( 1, A ) in any board' )

  def test_is_valid_cell_below_range( self ) :
    self.assertFalse( board_controller.is_valid_cell(  0, ' ' ), 'is_valid_cell() is false when (  0,   ) in any board' )
    self.assertFalse( board_controller.is_valid_cell(  0, 'A' ), 'is_valid_cell() is false when (  0, A ) in any board' )
    self.assertFalse( board_controller.is_valid_cell(  1, ' ' ), 'is_valid_cell() is false when (  1,   ) in any board' )
    self.assertFalse( board_controller.is_valid_cell( -1, ' ' ), 'is_valid_cell() is false when ( -1,   ) in any board' )
    self.assertFalse( board_controller.is_valid_cell( -1, 'A' ), 'is_valid_cell() is false when ( -1, A ) in any board' )
    self.assertFalse( board_controller.is_valid_cell(  1, ' ' ), 'is_valid_cell() is false when (  1,   ) in any board' )

  def test_is_valid_cell_above_range( self ) :
    board_controller.initialize_board( 1, 1 )
    self.assertFalse( board_controller.is_valid_cell( 1, 'B' ), 'is_valid_cell() is false when ( 1, B ) in a 1x1 board' )
    self.assertFalse( board_controller.is_valid_cell( 2, 'A' ), 'is_valid_cell() is false when ( 2, A ) in a 1x1 board' )

  def test_is_hit_valid( self ) :
    board_controller.initialize_board( 1, 1 )
    board_controller.reset_board()
    self.assertTrue( board_controller.is_hit( 1, 'A' ), 'is_hit() is true when ( 1, A ) in a 1x1 board' )

  def test_is_hit_invalid( self ) :
    self.assertFalse( board_controller.is_hit( None, None ), 'is_hit() is false when range is undefined in any board'                   )
    self.assertFalse( board_controller.is_hit( None, 1    ), 'is_hit() is false when range has an undefined row number in any board'    )
    self.assertFalse( board_controller.is_hit( 1   , None ), 'is_hit() is false when range has an undefined column number in any board' )

    self.assertFalse( board_controller.is_hit( 'A', 'A' ), 'is_hit() is false when ( A, A ) in any board' )
    self.assertFalse( board_controller.is_hit( 'A', '1' ), 'is_hit() is false when ( A, 1 ) in any board' )
    self.assertFalse( board_controller.is_hit( 'A', 1   ), 'is_hit() is false when ( A, 1 ) in any board' )
    self.assertFalse( board_controller.is_hit( '1', 'A' ), 'is_hit() is false when ( 1, A ) in any board' )

  def test_is_hit_below_range( self ) :
    self.assertFalse( board_controller.is_hit(  0, ' ' ), 'is_hit() is false when (  0,   ) in any board' )
    self.assertFalse( board_controller.is_hit(  0, 'A' ), 'is_hit() is false when (  0, A ) in any board' )
    self.assertFalse( board_controller.is_hit(  1, ' ' ), 'is_hit() is false when (  1,   ) in any board' )
    self.assertFalse( board_controller.is_hit( -1, ' ' ), 'is_hit() is false when ( -1,   ) in any board' )
    self.assertFalse( board_controller.is_hit( -1, 'A' ), 'is_hit() is false when ( -1, A ) in any board' )
    self.assertFalse( board_controller.is_hit(  1, ' ' ), 'is_hit() is false when (  1,   ) in any board' )

  def test_is_hit_above_range( self ) :
    board_controller.initialize_board( 1, 1 )
    self.assertFalse( board_controller.is_hit( 1, 'B' ), 'is_hit() is false when ( 1, B ) in a 1x1 board' )
    self.assertFalse( board_controller.is_hit( 2, 'A' ), 'is_hit() is false when ( 2, A ) in a 1x1 board' )

  def test_win_on_board_1x1( self ) :
    board_controller.initialize_board( 1, 1 )
    board_controller.reset_board()

    self.assertTrue  ( board_controller.mark_cell( 1, 'A' ), 'mark_cell() is true  on an empty 1x1 board' )
    self.assertFalse ( board_controller.mark_cell( 1, 'A' ), 'mark_cell() is false on a filled 1x1 board' )

    self.assertListEqual( board_controller.show_board(), winner_1x1_board_lines, 'show_board() for a winning condition on a 1x1 board' )

  def test_win_on_board_1x2( self ) :
    board_controller.initialize_board( 1, 2 )
    board_controller.reset_board()

    full_1x2_board_lines = full_1x2_board_lines_1 if board_controller.is_hit( 1, 'A' ) else full_1x2_board_lines_2

    self.assertTrue( board_controller.mark_cell( 1, 'A' ), 'mark_cell() is true on ( 1, A ) of a 1x2 board' )
    self.assertTrue( board_controller.mark_cell( 1, 'B' ), 'mark_cell() is true on ( 1, B ) of a 1x2 board' )
    self.assertListEqual( board_controller.show_board(), full_1x2_board_lines, 'show_board() for a winning condition on a 1x2 board' )

if __name__ == '__main__' :
  unittest.main()
