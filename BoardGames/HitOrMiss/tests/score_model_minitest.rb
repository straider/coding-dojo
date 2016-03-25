#!/usr/bin/env ruby
# encoding: utf-8

require 'minitest/autorun'

top_folder       = File.dirname( File.dirname( File.expand_path( __FILE__ ) ) )
libraries_folder = File.join( top_folder, 'include', 'libruby' )
$LOAD_PATH.unshift( libraries_folder ) unless $LOAD_PATH.include?( libraries_folder )

require 'score_model'

$start_score       = { GAMES_KEY => 0, HITS_KEY => 0, MISSES_KEY => 0 }
$start_first_game  = { GAMES_KEY => 1, HITS_KEY => 0, MISSES_KEY => 0 }
$first_score_hit   = { GAMES_KEY => 1, HITS_KEY => 1, MISSES_KEY => 0 }
$second_score_miss = { GAMES_KEY => 2, HITS_KEY => 1, MISSES_KEY => 1 }
$third_score_miss  = { GAMES_KEY => 3, HITS_KEY => 1, MISSES_KEY => 2 }
$third_score_hit   = { GAMES_KEY => 3, HITS_KEY => 2, MISSES_KEY => 2 }

class TestCases < Minitest::Test

  def test_create_score()
    assert_equal( $start_score, create_score, 'create_score()' )
  end

  def test_add_games()
    score = create_score
    assert_equal( $start_first_game, add_games( score ), 'add_games() after creating score' )
  end

  def test_add_hits()
    score = create_score
    score = add_games( score )
    assert_equal( $first_score_hit, add_hits( score ), 'add_hits() to first game score' )
  end

  def test_add_misses()
    score = create_score
    score = add_games ( score )
    score = add_hits  ( score )
    score = add_games ( score )
    assert_equal( $second_score_miss, add_misses( score ), 'add_misses() to second game score' )
  end

  def test_scoring()
    score = create_score
    score = add_games  ( score )
    score = add_hits   ( score )
    score = add_games  ( score )
    score = add_misses ( score )
    score = add_games  ( score )
    assert_equal( $third_score_miss, add_misses( score ), 'add_misses() to third game score' )

    score = add_misses ( score )
    assert_equal( $third_score_hit, add_hits( score ), 'add_hits() to third game score' )
  end

  def test_get_score()
    assert_equal( 3, get_games( $third_score_hit ) , 'get_games  () for 3rd game' )
    assert_equal( 2, get_hits( $third_score_hit )  , 'get_hits   () for 3rd game' )
    assert_equal( 2, get_misses( $third_score_hit ), 'get_misses () for 3rd game' )
  end

end

if __FILE__ == $0
end
