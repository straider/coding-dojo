#!/usr/bin/ruby -wKU
# encoding: utf-8

# Convert this to either DocTest or Test::Unit

require 'djBoard'

# Constants
#---------------------------------------


# Variables
#---------------------------------------


# Routines
#---------------------------------------


# Main Code
#---------------------------------------

puts 'Is value A in range A..C? ' + is_value_within_range( 'A', 'A', 'C' ).to_s
puts 'Is value B in range A..C? ' + is_value_within_range( 'B', 'A', 'C' ).to_s
puts 'Is value C in range A..C? ' + is_value_within_range( 'C', 'A', 'C' ).to_s
puts 'Is value Z in range A..C? ' + is_value_within_range( 'Z', 'A', 'C' ).to_s
puts 'Is value b in range A..C? ' + is_value_within_range( 'b', 'A', 'C' ).to_s
puts 'Is value 1 in range 1..3? ' + is_value_within_range( 1, 1, 3 ).to_s
puts 'Is value 2 in range 1..3? ' + is_value_within_range( 2, 1, 3 ).to_s
puts 'Is value 3 in range 1..3? ' + is_value_within_range( 3, 1, 3 ).to_s
puts 'Is value 5 in range 1..3? ' + is_value_within_range( 5, 1, 3 ).to_s
puts 'Is value "1" in range 1..3? ' + is_value_within_range( '1', 1, 3 ).to_s
puts

board = init_board( 3 )
clean_board( board )
show_board( board )
puts

puts 'Is value "A" in column range? ' + is_a_column_reference( board, 'A' ).to_s
puts 'Is value "a" in column range? ' + is_a_column_reference( board, 'a' ).to_s
puts 'Is value  1  in row range? '    + is_a_row_reference( board, 1 ).to_s
puts 'Is value "1" in row range? '    + is_a_row_reference( board, '1' ).to_s
puts

puts 'Is Full? ' + is_full( board ).to_s
puts 'First cell available? ' + mark_cell( board, 'O', [ 'A', '1' ] ).to_s
puts 'First cell available, again? ' + mark_cell( board, 'O', [ 'A', '1' ] ).to_s
clean_board( board )
puts

mark_cell( board, 'O', [ 'A', '1' ] )
mark_cell( board, 'X', [ 'B', '1' ] )
mark_cell( board, 'O', [ 'C', '1' ] )
show_board( board )
puts 'Is Full? ' + is_full( board ).to_s
mark_cell( board, 'X', [ 'A', '2' ] )
mark_cell( board, 'O', [ 'B', '2' ] )
mark_cell( board, 'X', [ 'C', '2' ] )
show_board( board )
puts 'Is Full? ' + is_full( board ).to_s
mark_cell( board, 'O', [ 'A', '3' ] )
mark_cell( board, 'X', [ 'B', '3' ] )
mark_cell( board, 'O', [ 'C', '3' ] )
show_board( board )
puts 'Is Full? ' + is_full( board ).to_s
