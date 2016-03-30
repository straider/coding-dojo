#!/usr/bin/env ruby
# encoding: utf-8

top_folder       = File.dirname( File.dirname( File.expand_path( __FILE__ ) ) )
libraries_folder = File.join( top_folder, 'include', 'libruby' )
$LOAD_PATH.unshift( libraries_folder ) unless $LOAD_PATH.include?( libraries_folder )

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
  loop do
    case ARGV[ 0 ]
        when '-h', '--help'
          show_help
          exit( 0 )
        when '-v', '--version'
          show_version
        when '-r', '--rows'
          number_of_rows = ARGV[ 1 ].to_i
          ARGV.shift
        when '-c', '--columns'
          number_of_columns = ARGV[ 1 ].to_i
          ARGV.shift
        when /^-/
          puts "Unknown option: #{ ARGV[ 0 ].inspect }"
          show_help
          exit( -1 )
        else
          break
    end
    ARGV.shift
  end

  print "Playing with a board {#{ number_of_rows }}x{#{ number_of_columns }}"
  play_game( number_of_rows, number_of_columns )
end
