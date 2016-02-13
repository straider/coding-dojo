#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unittest

import os
import sys

top_folder = os.path.dirname( sys.path[ 0 ] )
sys.path.append( os.path.join( top_folder, 'include', 'libpython' ) )

import score_view

start_score = { 'games' : 0, 'hits' : 0, 'misses' :  0 }
final_score = { 'games' : 3, 'hits' : 2, 'misses' : 10 }
wrong_score = { 'wins' : 2, 'losses' : 10 }

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

  def test_build_score_lines_valid( self ) :
    self.assertListEqual( score_view.build_score_lines( start_score ), start_score_lines, 'build_score_lines() using score at start' );
    self.assertListEqual( score_view.build_score_lines( final_score ), final_score_lines, 'build_score_lines() using score at final' );

  def test_build_score_lines_invalid( self ) :
    self.assertIsNone( score_view.build_score_lines( wrong_score ), 'build_score_lines() using a bad score' );

if __name__ == '__main__' :
  unittest.main()
