#!/usr/bin/env ruby
# encoding: utf-8

top_folder       = File.dirname( File.dirname( File.expand_path( __FILE__ ) ) )
libraries_folder = File.join( top_folder, 'include', 'libruby' )
$LOAD_PATH.unshift( libraries_folder ) unless $LOAD_PATH.include?( libraries_folder )

require 'optparse'
require 'ostruct'

require 'game_controller'

VERSION = 'v1.00.00'

def show_help()
  print "#{ $0 } -r|--rows NUMBER_OF_ROWS -c|--columns NUMBER_OF_COLUMNS\n\n";
  puts "\t -r|--rows NUMBER_OF_ROWS: set the number of rows ( default is 3 )";
  puts "\t -c|--columns NUMBER_OF_COLUMNS: set the number of columns ( default is 3 )";
end

def show_version()
  puts "HitOrMiss - Procedural #{ VERSION }"
end

if __FILE__ == $0

  arguments = OpenStruct.new
  parser    = OptionParser.new do | options |
    options.version = VERSION

    options.on( '-h', '--help'                              , 'Show help message'     ) { show_help   ; exit( 0 ) }
    options.on( '-v', '--version'                           , 'Show program version'  ) { show_version; exit( 0 ) }
    options.on( '-r', '--rows NUMBER_OF_ROWS'      , Integer, 'Set number of rows'    ) { | argument | arguments.number_of_rows    = argument }
    options.on( '-c', '--columns NUMBER_OF_COLUMNS', Integer, 'Set number of columns' ) { | argument | arguments.number_of_columns = argument }
  end

  begin
    parser.parse!
  rescue OptionParser::ParseError => error
    puts "#{ error }"
    show_help
    exit( -1 )
  end

  number_of_rows    = defined?( arguments.number_of_rows    ) ? arguments.number_of_rows    : 3
  number_of_columns = defined?( arguments.number_of_columns ) ? arguments.number_of_columns : 3

  puts "Playing with a board {#{ number_of_rows }}x{#{ number_of_columns }}"
  play_game( number_of_rows, number_of_columns )
end
