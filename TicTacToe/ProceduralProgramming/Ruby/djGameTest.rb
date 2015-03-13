#!/usr/bin/ruby -wKU
# encoding: utf-8

# Convert this to either DocTest or Test::Unit

require 'djGame'

# Constants
#---------------------------------------


# Variables
#---------------------------------------


# Routines
#---------------------------------------


# Main Code
#---------------------------------------

board = init_board( 3 )
clean_board( board )
mark_cell( board, 'O', [ 'A', '1' ] )
mark_cell( board, 'X', [ 'B', '1' ] )
mark_cell( board, 'O', [ 'C', '1' ] )
mark_cell( board, 'X', [ 'A', '2' ] )
mark_cell( board, 'O', [ 'B', '2' ] )
mark_cell( board, 'X', [ 'C', '2' ] )
show_board( board )
puts '"O" won? ' + is_victory( board, 'O' ).to_s
puts '"X" won? ' + is_victory( board, 'X' ).to_s
mark_cell( board, 'O', [ 'A', '3' ] )
show_board( board )
puts '"O" won? ' + is_victory( board, 'O' ).to_s
puts '"X" won? ' + is_victory( board, 'X' ).to_s
puts
show_statistics( [], [ 'O', 'X' ] )
show_statistics( [ 'O', 'X', 'O', '.', ' ', nil ], [ 'O', 'X' ] )
