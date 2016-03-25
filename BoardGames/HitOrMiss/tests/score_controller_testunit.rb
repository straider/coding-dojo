#!/usr/bin/env ruby
# encoding: utf-8

require 'test/unit'
require 'stringio'

top_folder       = File.dirname( File.dirname( File.expand_path( __FILE__ ) ) )
libraries_folder = File.join( top_folder, 'include', 'libruby' )
$LOAD_PATH.unshift( libraries_folder ) unless $LOAD_PATH.include?( libraries_folder )

require 'score_controller'

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

  def setup
    $stdout = StringIO.new
  end

  def teardown
    $stdout = STDOUT
  end

  def test_scoring()
    initialize_score
    assert_equal( $start_score_lines, show_score(), 'show_score() using score at start' );

    store_games 
    store_misses
    store_misses
    store_hits  
    store_games 
    store_misses
    store_misses
    store_misses
    store_misses
    store_misses
    store_games 
    store_misses
    store_misses
    store_misses
    store_hits  
    assert_equal( $final_score_lines, show_score(), 'show_score() using score at final' );
  end

end

if __FILE__ == $0
end
