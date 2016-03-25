#!/usr/bin/env ruby
# encoding: utf-8

require 'test/unit'

top_folder       = File.dirname( File.dirname( File.expand_path( __FILE__ ) ) )
libraries_folder = File.join( top_folder, 'include', 'libruby' )
$LOAD_PATH.unshift( libraries_folder ) unless $LOAD_PATH.include?( libraries_folder )

require 'score_view'

$start_score = { :games => 0, :hits => 0, :misses =>  0 }
$final_score = { :games => 3, :hits => 2, :misses => 10 }
$wrong_score = { :wins => 2, :losses => 10 }

$start_score_lines = [ 'Game Results:'                      \
                     , "\tGames Played.........  0"         \
                     , "\tPlayer has won.......  0 time(s)" \
                     , "\tPlayer has miss......  0 time(s)" \
                     ];
$final_score_lines = [ 'Game Results:'                      \
                     , "\tGames Played.........  3"         \
                     , "\tPlayer has won.......  2 time(s)" \
                     , "\tPlayer has miss...... 10 time(s)" \
                     ];

class TestCases < Test::Unit::TestCase

  def test_build_score_lines_valid()
    assert_equal( $start_score_lines, build_score_lines( $start_score ), 'build_score_lines() using score at start' )
    assert_equal( $final_score_lines, build_score_lines( $final_score ), 'build_score_lines() using score at final' )
  end

  def test_build_score_lines_invalid()
    assert_nil( build_score_lines( $wrong_score ), 'build_score_lines() using a bad score' )
  end

end

if __FILE__ == $0
end
