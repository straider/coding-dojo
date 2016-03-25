#!/usr/bin/env ruby
# encoding: utf-8

top_folder       = File.dirname( File.dirname( File.expand_path( __FILE__ ) ) )
libraries_folder = File.join( top_folder, 'include', 'libruby' )
$LOAD_PATH.unshift( libraries_folder ) unless $LOAD_PATH.include?( libraries_folder )

require 'game_controller'

if __FILE__ == $0
  play_game( 2, 2 )
end
