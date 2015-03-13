#!/usr/bin/python
# -*- coding: utf-8 -*-
# "Defining Python Source Code Encodings":http://www.python.org/dev/peps/pep-0263/

# Convert this to either DocTest or Test::Unit

from djGame import *

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
print '"O" won? ' + str( is_victory( board, 'O' ) )
print '"X" won? ' + str( is_victory( board, 'X' ) )
mark_cell( board, 'O', [ 'A', '3' ] )
show_board( board )
print '"O" won? ' + str( is_victory( board, 'O' ) )
print '"X" won? ' + str( is_victory( board, 'X' ) )
print
show_statistics( [], [ 'O', 'X' ] )
show_statistics( [ 'O', 'X', 'O', '.', ' ', None ], [ 'O', 'X' ] )
