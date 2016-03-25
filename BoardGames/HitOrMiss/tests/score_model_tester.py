#!/usr/bin/env python
# -*- coding: utf-8 -*-

import unittest

import os
import sys

top_folder = os.path.dirname( sys.path[ 0 ] )
sys.path.append( os.path.join( top_folder, 'include', 'libpython' ) )

import score_model

start_score       = { score_model.GAMES_KEY : 0, score_model.HITS_KEY : 0, score_model.MISSES_KEY : 0 }
start_first_game  = { score_model.GAMES_KEY : 1, score_model.HITS_KEY : 0, score_model.MISSES_KEY : 0 }
first_score_hit   = { score_model.GAMES_KEY : 1, score_model.HITS_KEY : 1, score_model.MISSES_KEY : 0 }
second_score_miss = { score_model.GAMES_KEY : 2, score_model.HITS_KEY : 1, score_model.MISSES_KEY : 1 }
third_score_miss  = { score_model.GAMES_KEY : 3, score_model.HITS_KEY : 1, score_model.MISSES_KEY : 2 }
third_score_hit   = { score_model.GAMES_KEY : 3, score_model.HITS_KEY : 2, score_model.MISSES_KEY : 2 }

class TestCases( unittest.TestCase ) :

  def test_create_score( self ) :
    self.assertDictEqual( score_model.create_score(), start_score, 'create_score()' )

  def test_add_games( self ) :
    score = score_model.create_score()
    self.assertDictEqual( score_model.add_games( score ), start_first_game, 'add_games() after creating score' )

  def test_add_hits( self ) :
    score = score_model.create_score()
    score = score_model.add_games( score )
    self.assertDictEqual( score_model.add_hits( score ), first_score_hit, 'add_hits() to first game score' )

  def test_add_misses( self ) :
    score = score_model.create_score()
    score = score_model.add_games ( score )
    score = score_model.add_hits  ( score )
    score = score_model.add_games ( score )
    self.assertDictEqual( score_model.add_misses( score ), second_score_miss, 'add_misses() to second game score' )

  def test_scoring( self ) :
    score = score_model.create_score()
    score = score_model.add_games  ( score )
    score = score_model.add_hits   ( score )
    score = score_model.add_games  ( score )
    score = score_model.add_misses ( score )
    score = score_model.add_games  ( score )
    self.assertDictEqual( score_model.add_misses( score ), third_score_miss, 'add_misses() to third game score' )

    score = score_model.add_misses ( score )
    self.assertDictEqual( score_model.add_hits( score ), third_score_hit, 'add_hits() to third game score' )

  def test_get_score( self ) :
    self.assertEqual( score_model.get_games  ( third_score_hit ), 3, 'get_games  () for 3rd game' )
    self.assertEqual( score_model.get_hits   ( third_score_hit ), 2, 'get_hits   () for 3rd game' )
    self.assertEqual( score_model.get_misses ( third_score_hit ), 2, 'get_misses () for 3rd game' )

if __name__ == '__main__' :
  unittest.main()
