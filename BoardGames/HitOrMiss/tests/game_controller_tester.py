#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unittest

import os
import sys

top_folder = os.path.dirname( sys.path[ 0 ] )
sys.path.append( os.path.join( top_folder, 'include', 'libpython' ) )

import game_controller

one_by_one_board_lines       = [ '     A  '
                               , '   +---+'
                               , ' 1 | . |'
                               , '   +---+'
                               ]
winner_1x1_board_lines       = [ '     A  '
                               , '   +---+'
                               , ' 1 | X |'
                               , '   +---+'
                               ]
one_by_two_board_lines       = [ '     A   B  '
                               , '   +---+---+'
                               , ' 1 | . | . |'
                               , '   +---+---+'
                               ]
first_move_1x2_board_lines_1 = [ '     A   B  '
                               , '   +---+---+'
                               , ' 1 | X | . |'
                               , '   +---+---+'
                               ]
first_move_1x2_board_lines_2 = [ '     A   B  '
                               , '   +---+---+'
                               , ' 1 | O | . |'
                               , '   +---+---+'
                               ]

start_score_lines = [ 'Game Results:'
                    , '\tGames Played.........  0'
                    , '\tPlayer has won.......  0 time(s)'
                    , '\tPlayer has miss......  0 time(s)'
                    ]
first_score_lines = [ 'Game Results:'
                    , '\tGames Played.........  1'
                    , '\tPlayer has won.......  0 time(s)'
                    , '\tPlayer has miss......  0 time(s)'
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

  def test_initialize_game_valid( self ) :
    self.assertEqual( game_controller.initialize_game( 1, 1 ), '1x1', 'initialize_game() for a 1x1 board' )
    self.assertEqual( game_controller.initialize_game( 1, 2 ), '1x2', 'initialize_game() for a 1x2 board' )

  def test_initialize_game_invalid( self ) :
    self.assertIsNone( game_controller.initialize_game( None, None ), 'initialize_game() for a 1x1 board' )
    self.assertIsNone( game_controller.initialize_game( 1   , None ), 'initialize_game() for a 1x2 board' )
    self.assertIsNone( game_controller.initialize_game( None, 1    ), 'initialize_game() for a 1x2 board' )

    self.assertIsNone( game_controller.initialize_game( 0, 0 ), 'initialize_game() for a 0x0 board' )
    self.assertIsNone( game_controller.initialize_game( 1, 0 ), 'initialize_game() for a 1x0 board' )
    self.assertIsNone( game_controller.initialize_game( 0, 1 ), 'initialize_game() for a 0x1 board' )

    self.assertIsNone( game_controller.initialize_game( -1, -1 ), 'initialize_game() for a -1x-1 board' )
    self.assertIsNone( game_controller.initialize_game(  1, -1 ), 'initialize_game() for a  1x-1 board' )
    self.assertIsNone( game_controller.initialize_game( -1,  1 ), 'initialize_game() for a -1x1  board' )

  def test_reset_game( self ) :
    game_controller.initialize_game( 1, 1 )
    self.assertEqual( game_controller.reset_game(), '1x1', 'reset_game() for a 1x1 board' )

    game_controller.initialize_game( 1, 2 )
    self.assertEqual( game_controller.reset_game(), '1x2', 'reset_game() for a 1x2 board' )

  def test_print_board( self ) :
    game_controller.initialize_game( 1, 1 )
    self.assertListEqual( game_controller.print_board(), one_by_one_board_lines, 'print_board() for a 1x1 board' )

    game_controller.initialize_game( 1, 2 )
    self.assertListEqual( game_controller.print_board(), one_by_two_board_lines, 'print_board() for a 1x2 board' )

  def test_is_valid_cell_reference_valid( self ) :
    game_controller.initialize_game( 1, 1 )
    self.assertTrue( game_controller.is_valid_cell_reference( 1, 'A' ), 'is_valid_cell_reference() is true for reference ( 1, A ) on a 1x1 board' )

    game_controller.initialize_game( 1, 2 )
    self.assertTrue( game_controller.is_valid_cell_reference( 1, 'A' ), 'is_valid_cell_reference() is true for reference ( 1, A ) on a 1x2 board' )
    self.assertTrue( game_controller.is_valid_cell_reference( 1, 'B' ), 'is_valid_cell_reference() is true for reference ( 1, B ) on a 1x2 board' )

  def test_is_valid_cell_reference_invalid( self ) :
    self.assertFalse( game_controller.is_valid_cell_reference( None, None ), 'is_valid_cell_reference() is false when range is undefined in any board'                   )
    self.assertFalse( game_controller.is_valid_cell_reference( None, 1    ), 'is_valid_cell_reference() is false when range has an undefined row    number in any board' )
    self.assertFalse( game_controller.is_valid_cell_reference( 1   , None ), 'is_valid_cell_reference() is false when range has an undefined column number in any board' )

    self.assertFalse( game_controller.is_valid_cell_reference( 'A', 'A' ), 'is_valid_cell_reference() is false when ( A, A ) in any board' )
    self.assertFalse( game_controller.is_valid_cell_reference( 'A', '1' ), 'is_valid_cell_reference() is false when ( A, 1 ) in any board' )
    self.assertFalse( game_controller.is_valid_cell_reference( 'A', 1   ), 'is_valid_cell_reference() is false when ( A, 1 ) in any board' )
    self.assertFalse( game_controller.is_valid_cell_reference( '1', 'A' ), 'is_valid_cell_reference() is false when ( 1, A ) in any board' )

  def test_is_valid_cell_reference_below_range( self ) :
    self.assertFalse( game_controller.is_valid_cell_reference(  0, ' ' ), 'is_valid_cell_reference() is false when (  0,   ) in any board' )
    self.assertFalse( game_controller.is_valid_cell_reference(  0, 'A' ), 'is_valid_cell_reference() is false when (  0, A ) in any board' )
    self.assertFalse( game_controller.is_valid_cell_reference(  1, ' ' ), 'is_valid_cell_reference() is false when (  1,   ) in any board' )
    self.assertFalse( game_controller.is_valid_cell_reference( -1, ' ' ), 'is_valid_cell_reference() is false when ( -1,   ) in any board' )
    self.assertFalse( game_controller.is_valid_cell_reference( -1, 'A' ), 'is_valid_cell_reference() is false when ( -1, A ) in any board' )
    self.assertFalse( game_controller.is_valid_cell_reference(  1, ' ' ), 'is_valid_cell_reference() is false when (  1,   ) in any board' )

  def test_is_valid_cell_reference_above_range( self ) :
    game_controller.initialize_game( 1, 1 )
    self.assertFalse( game_controller.is_valid_cell_reference( 1, 'B' ), 'is_valid_cell_reference() is false for reference ( 1, B ) on a 1x1 board' )

    game_controller.initialize_game( 1, 1 )
    self.assertFalse( game_controller.is_valid_cell_reference( 2, 'A' ), 'is_valid_cell_reference() is false for reference ( 2, A ) on a 1x2 board' )

  def test_is_valid_answer_valid( self ) :
    self.assertTrue( game_controller.is_valid_answer( 'y' ), 'is_valid_answer() is true for answer y' )
    self.assertTrue( game_controller.is_valid_answer( 'Y' ), 'is_valid_answer() is true for answer Y' )
    self.assertTrue( game_controller.is_valid_answer( 'n' ), 'is_valid_answer() is true for answer n' )
    self.assertTrue( game_controller.is_valid_answer( 'N' ), 'is_valid_answer() is true for answer N' )

    self.assertTrue( game_controller.is_valid_answer( 'yes' ), 'is_valid_answer() is true for answer yes' )
    self.assertTrue( game_controller.is_valid_answer( 'Yes' ), 'is_valid_answer() is true for answer Yes' )
    self.assertTrue( game_controller.is_valid_answer( 'YES' ), 'is_valid_answer() is true for answer YES' )
    self.assertTrue( game_controller.is_valid_answer( 'no'  ), 'is_valid_answer() is true for answer no'  )
    self.assertTrue( game_controller.is_valid_answer( 'No'  ), 'is_valid_answer() is true for answer No'  )
    self.assertTrue( game_controller.is_valid_answer( 'NO'  ), 'is_valid_answer() is true for answer NO'  )

  def test_is_valid_answer_invalid( self ) :
    self.assertFalse( game_controller.is_valid_answer( ''   ), 'is_valid_answer() is false for an empty answer'     )
    self.assertFalse( game_controller.is_valid_answer( None ), 'is_valid_answer() is false for an undefined answer' )
    self.assertFalse( game_controller.is_valid_answer( 1    ), 'is_valid_answer() is false for answer 1'            )
    self.assertFalse( game_controller.is_valid_answer( 'a'  ), 'is_valid_answer() is false for answer a'            )
    self.assertFalse( game_controller.is_valid_answer( 'A'  ), 'is_valid_answer() is false for answer A'            )
    self.assertFalse( game_controller.is_valid_answer( 'x'  ), 'is_valid_answer() is false for answer x'            )
    self.assertFalse( game_controller.is_valid_answer( 'X'  ), 'is_valid_answer() is false for answer X'            )

  def test_print_score( self ) :
    game_controller.initialize_game( 1, 1 )
    self.assertListEqual( game_controller.print_score(), start_score_lines, 'print_score() without playing' )

    game_controller.initialize_game( 1, 1 )
    game_controller.reset_game()
    self.assertListEqual( game_controller.print_score(), first_score_lines, 'print_score() after first game starts' )

  def test_playing_on_1x1( self ) :
    game_controller.initialize_game( 1, 1 )
    game_controller.reset_game()
    self.assertTrue( game_controller.is_win( 1, 'A' ), 'is_win() is true after first move on a 1x1 board' )
    game_controller.put_piece( 1, 'A' )
    self.assertTrue( game_controller.has_no_more_attempts(), 'has_no_more_attempts() is true after first move on a 1x1 board' )
    self.assertListEqual( game_controller.print_board(), winner_1x1_board_lines, 'print_board() after first move on a 1x1 board' )
    game_controller.reset_game()
    self.assertListEqual( game_controller.print_board(), one_by_one_board_lines, 'print_board() after a reset on a 1x1 board' )

  def test_playing_on_1x2( self ) :
    game_controller.initialize_game( 1, 2 )
    game_controller.reset_game()
    first_move_1x2_board_lines = first_move_1x2_board_lines_1 if ( game_controller.is_win( 1, 'A' ) ) else first_move_1x2_board_lines_2
    game_controller.put_piece( 1, 'A' )
    self.assertTrue( game_controller.has_no_more_attempts(), 'has_no_more_attempts() is true after first move on a 1x2 board' )
    self.assertListEqual( game_controller.print_board(), first_move_1x2_board_lines, 'print_board() after first move on a 1x2 board' )
    game_controller.reset_game()
    self.assertListEqual( game_controller.print_board(), one_by_two_board_lines, 'print_board() after a reset on a 1x2 board' )

  def test_playing_on_2x2( self ) :
    game_controller.initialize_game( 2, 2 )
    game_controller.reset_game()
    game_controller.put_piece( 1, 'A' )
    self.assertFalse( game_controller.has_no_more_attempts(), 'has_no_more_attempts() is false after first move on a 2x2 board' )

if __name__ == '__main__' :
  unittest.main()
