#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unittest

import os
import sys

top_folder = os.path.dirname( sys.path[ 0 ] )
sys.path.append( os.path.join( top_folder, 'include', 'libpython' ) )

import board_model

one_by_one_board        = [ [ '' ] ];
two_by_two_board        = [ [ '', '' ], [ '', '' ] ];
two_by_four_board       = [ [ '', '', '', '' ], [ '', '', '', '' ] ];
three_by_two_board      = [ [ '', '' ], [ '', '' ], [ '', '' ] ];
three_by_three_board    = [ [ '', '' , '' ], [ '', '', ''  ], [ '' , '', '' ] ];
board_with_pieces       = [ [ '', 'X', '' ], [ '', '', 'O' ], [ '' , '', '' ] ];
board_with_more_pieces  = [ [ '', 'X', '' ], [ '', '', 'O' ], [ 'X', '', '' ] ];
board_with_other_pieces = [ [ '', 'O', '' ], [ '', '', 'O' ], [ '' , '', '' ] ];

class TestCases( unittest.TestCase ) :

  def test_create_board_valid( self ) :
    self.assertListEqual( board_model.create_board( 1, 1 ), one_by_one_board    , 'create_board() 1x1' )
    self.assertListEqual( board_model.create_board( 2, 2 ), two_by_two_board    , 'create_board() 2x2' )
    self.assertListEqual( board_model.create_board( 2, 4 ), two_by_four_board   , 'create_board() 2x4' )
    self.assertListEqual( board_model.create_board( 3, 2 ), three_by_two_board  , 'create_board() 3x2' )
    self.assertListEqual( board_model.create_board( 3, 3 ), three_by_three_board, 'create_board() 3x3' )

  def test_create_board_invalid( self ) :
    self.assertIsNone( board_model.create_board( 0, 0 ), 'create_board() 0x0' )
    self.assertIsNone( board_model.create_board( 0, 1 ), 'create_board() 0x1' )
    self.assertIsNone( board_model.create_board( 1, 0 ), 'create_board() 1x0' )

    self.assertIsNone( board_model.create_board( -1, -1 ), 'create_board() with invalid dimensions ' )
    self.assertIsNone( board_model.create_board( -1,  1 ), 'create_board() with invalid dimensions ' )
    self.assertIsNone( board_model.create_board(  1, -1 ), 'create_board() with invalid dimensions ' )

    self.assertIsNone( board_model.create_board( None, None ), 'create_board() with no dimensions' )

  def test_clear_board( self ) :
    self.assertListEqual( board_model.clear_board( one_by_one_board     ), one_by_one_board    , 'clear_board() with empty 1x1 board'       )
    self.assertListEqual( board_model.clear_board( two_by_two_board     ), two_by_two_board    , 'clear_board() with empty 2x2 board'       )
    self.assertListEqual( board_model.clear_board( three_by_three_board ), three_by_three_board, 'clear_board() with empty 3x3 board'       )
    self.assertListEqual( board_model.clear_board( board_with_pieces    ), three_by_three_board, 'clear_board() with a non empty 3x3 board' )

  def test_is_valid_row_true( self ) :
    self.assertTrue( board_model.is_valid_row( three_by_three_board, 1 ), 'is_valid_row() is true when row #1 on a 3x3 board' )
    self.assertTrue( board_model.is_valid_row( three_by_three_board, 2 ), 'is_valid_row() is true when row #2 on a 3x3 board' )
    self.assertTrue( board_model.is_valid_row( three_by_three_board, 3 ), 'is_valid_row() is true when row #3 on a 3x3 board' )

  def test_is_valid_row_false( self ) :
    self.assertFalse( board_model.is_valid_row( three_by_three_board, 0 ), 'is_valid_row() is false when row below range on a 3x3 board' )
    self.assertFalse( board_model.is_valid_row( three_by_three_board, 4 ), 'is_valid_row() is false when row above range on a 3x3 board' )

    self.assertFalse( board_model.is_valid_row( three_by_three_board, None ), 'is_valid_row() is false when row is undefined on a 3x3 board' )

    self.assertFalse( board_model.is_valid_row( None, 1 ), 'is_valid_row() is false when row #1 on an undefined board' )

  def test_is_valid_column_true( self ) :
    self.assertTrue( board_model.is_valid_column( three_by_three_board, 1 ), 'is_valid_column() is true when column #1 on a 3x3 board' )
    self.assertTrue( board_model.is_valid_column( three_by_three_board, 2 ), 'is_valid_column() is true when column #2 on a 3x3 board' )
    self.assertTrue( board_model.is_valid_column( three_by_three_board, 3 ), 'is_valid_column() is true when column #3 on a 3x3 board' )

  def test_is_valid_column_false( self ) :
    self.assertFalse( board_model.is_valid_column( three_by_three_board, 0 ), 'is_valid_column() is false when column below range on a 3x3 board' )
    self.assertFalse( board_model.is_valid_column( three_by_three_board, 4 ), 'is_valid_column() is false when column above range on a 3x3 board' )

    self.assertFalse( board_model.is_valid_column( three_by_three_board, None ), 'is_valid_column() is false when column is undefined on a 3x3 board' )

    self.assertFalse( board_model.is_valid_column( None, 1 ), 'is_valid_column() is false when column #1 on an undefined board' )

  def test_get_piece_valid( self ) :
    self.assertEqual( board_model.get_piece( board_with_pieces, 1, 1 ), '' , 'get_piece() empty cell at ( 1, 1 ) on a 3x3 board' )
    self.assertEqual( board_model.get_piece( board_with_pieces, 1, 2 ), 'X', 'get_piece() X in  cell at ( 1, 2 ) on a 3x3 board' )
    self.assertEqual( board_model.get_piece( board_with_pieces, 2, 3 ), 'O', 'get_piece() O in  cell at ( 2, 3 ) on a 3x3 board' )

  def test_get_piece_invalid( self ) :
    self.assertIsNone( board_model.get_piece( board_with_pieces, 0, 0 ), 'get_piece() in cell at ( 0, 0 ) on a 3x3 board' )
    self.assertIsNone( board_model.get_piece( board_with_pieces, 0, 1 ), 'get_piece() in cell at ( 0, 1 ) on a 3x3 board' )
    self.assertIsNone( board_model.get_piece( board_with_pieces, 1, 0 ), 'get_piece() in cell at ( 1, 0 ) on a 3x3 board' )

    self.assertIsNone( board_model.get_piece( board_with_pieces, 4, 4 ), 'get_piece() in cell at ( 4, 4 ) on a 3x3 board' )
    self.assertIsNone( board_model.get_piece( board_with_pieces, 3, 4 ), 'get_piece() in cell at ( 3, 4 ) on a 3x3 board' )
    self.assertIsNone( board_model.get_piece( board_with_pieces, 4, 3 ), 'get_piece() in cell at ( 4, 3 ) on a 3x3 board' )

    self.assertIsNone( board_model.get_piece( board_with_pieces, None, None ), 'get_piece() in cell at invalid_range on a  3x3 board' )

    self.assertIsNone( board_model.get_piece( None, 1, 1 ), 'get_piece() in cell at ( 1, 1 ) on an undefined board' )

  def test_set_piece_valid( self ) :
    self.assertListEqual( board_model.set_piece( board_with_pieces, 3, 1, 'X' ), board_with_more_pieces , 'set_piece() X at cell ( 3, 1 ) on a 3x3 board' )
    self.assertListEqual( board_model.set_piece( board_with_pieces, 1, 2, 'O' ), board_with_other_pieces, 'set_piece() O at cell ( 1, 2 ) on a 3x3 board' )

  def test_set_piece_invalid( self ) :
    self.assertListEqual( board_model.set_piece( board_with_pieces, 0, 0, 'E' ), board_with_pieces, 'set_piece() E on cell ( 0, 0 ) on a 3x3 board' )
    self.assertListEqual( board_model.set_piece( board_with_pieces, 0, 1, 'E' ), board_with_pieces, 'set_piece() E on cell ( 0, 1 ) on a 3x3 board' )
    self.assertListEqual( board_model.set_piece( board_with_pieces, 1, 0, 'E' ), board_with_pieces, 'set_piece() E on cell ( 1, 0 ) on a 3x3 board' )

    self.assertListEqual( board_model.set_piece( board_with_pieces, 4, 4, 'E' ), board_with_pieces, 'set_piece() E on cell ( 4, 4 ) on a 3x3 board' )
    self.assertListEqual( board_model.set_piece( board_with_pieces, 3, 4, 'E' ), board_with_pieces, 'set_piece() E on cell ( 3, 4 ) on a 3x3 board' )
    self.assertListEqual( board_model.set_piece( board_with_pieces, 4, 3, 'E' ), board_with_pieces, 'set_piece() E on cell ( 4, 3 ) on a 3x3 board' )

    self.assertListEqual( board_model.set_piece( board_with_pieces, None, None, 'E' ), board_with_pieces, 'set_piece() E on cell at invalid range on a 3x3 board' )

    self.assertIsNone( board_model.set_piece( None, 1, 1, 'E' ), 'set_piece() E on cell ( 1, 1 ) on an undefined board' )

if __name__ == '__main__' :
  unittest.main()
