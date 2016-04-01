#!/usr/bin/env ruby
# encoding: utf-8

top_folder       = File.dirname( File.dirname( File.expand_path( __FILE__ ) ) )
libraries_folder = File.join( top_folder, 'include', 'libruby' )
$LOAD_PATH.unshift( libraries_folder ) unless $LOAD_PATH.include?( libraries_folder )

require 'getoptlong'

require 'game_controller'

VERSION = 'v1.00.00'

def show_help()
  print "#{ $0 } -r|--rows NUMBER_OF_ROWS -c|--columns NUMBER_OF_COLUMNS\n\n";
  print "\t -r|--rows NUMBER_OF_ROWS: set the number of rows ( default is 3 )\n";
  print "\t -c|--columns NUMBER_OF_COLUMNS: set the number of columns ( default is 3 )\n";
end

def show_version()
  puts "HitOrMiss - Procedural #{ VERSION }"
  exit( 0 )
end

if __FILE__ == $0

  number_of_rows    = 3
  number_of_columns = 3
  options = GetoptLong.new( [ '--help'   , '-h', GetoptLong::NO_ARGUMENT       ] \
                          , [ '--version', '-v', GetoptLong::NO_ARGUMENT       ] \
                          , [ '--rows'   , '-r', GetoptLong::REQUIRED_ARGUMENT ] \
                          , [ '--columns', '-c', GetoptLong::REQUIRED_ARGUMENT ]
                          )

  options.each do | option, argument |
    case option
      when '--help'
        show_help
        exit( 0 )
      when '--version'
        show_version
      when '--rows'
        number_of_rows = argument.to_i
      when '--columns'
        number_of_columns = argument.to_i
    end
  end

  puts "Playing with a board {#{ number_of_rows }}x{#{ number_of_columns }}"
  play_game( number_of_rows, number_of_columns )
end
