#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unittest

import os
import sys

top_folder = os.path.dirname( sys.path[ 0 ] )
sys.path.append( os.path.join( top_folder, 'include', 'libpython' ) )

import score_controller

start_score_lines = [ 'Game Results:'
                    , '\tGames Played.........  0'
                    , '\tPlayer has won.......  0 time(s)'
                    , '\tPlayer has miss......  0 time(s)'
                    ];
final_score_lines = [ 'Game Results:'
                    , '\tGames Played.........  3'
                    , '\tPlayer has won.......  2 time(s)'
                    , '\tPlayer has miss...... 10 time(s)'
                    ];

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

  def test_scoring( self ) :
    score_controller.initialize_score()
    self.assertListEqual( score_controller.show_score(), start_score_lines, 'show_score() using score at start' );

    score_controller.store_games  ()
    score_controller.store_misses ()
    score_controller.store_misses ()
    score_controller.store_hits   ()
    score_controller.store_games  ()
    score_controller.store_misses ()
    score_controller.store_misses ()
    score_controller.store_misses ()
    score_controller.store_misses ()
    score_controller.store_misses ()
    score_controller.store_games  ()
    score_controller.store_misses ()
    score_controller.store_misses ()
    score_controller.store_misses ()
    score_controller.store_hits   ()
    self.assertListEqual( score_controller.show_score(), final_score_lines, 'show_score() using score at final' );

if __name__ == '__main__' :
  unittest.main()
