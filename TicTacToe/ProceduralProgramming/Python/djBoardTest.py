#!/usr/bin/python
# -*- coding: utf-8 -*-
# "Defining Python Source Code Encodings":http://www.python.org/dev/peps/pep-0263/

# Convert this to either DocTest or Test::Unit

from djBoard import *

# Constants
#---------------------------------------


# Variables
#---------------------------------------


# Routines
#---------------------------------------


# Main Code
#---------------------------------------

print 'Is value "A" in range A..C? ' + str( is_value_within_range( 'A', 'A', 'C' ) )
print 'Is value "B" in range A..C? ' + str( is_value_within_range( 'B', 'A', 'C' ) )
print 'Is value "C" in range A..C? ' + str( is_value_within_range( 'C', 'A', 'C' ) )
print 'Is value "Z" in range A..C? ' + str( is_value_within_range( 'Z', 'A', 'C' ) )
print 'Is value "b" in range A..C? ' + str( is_value_within_range( 'b', 'A', 'C' ) )
#~ print 'Is value  1  in range 1..3? ' + str( is_value_within_range(  1 ,  1 ,  3  ) )
#~ print 'Is value  2  in range 1..3? ' + str( is_value_within_range(  2 ,  1 ,  3  ) )
#~ print 'Is value  3  in range 1..3? ' + str( is_value_within_range(  3 ,  1 ,  3  ) )
#~ print 'Is value  5  in range 1..3? ' + str( is_value_within_range(  5 ,  1 ,  3  ) )
print 'Is value "1" in range 1..3? ' + str( is_value_within_range( '1',  '1' ,  '3'  ) )
print

board = init_board( 3 )
clean_board( board )
show_board( board )
print

print 'Is value "A" in column range? ' + str( is_a_column_reference( board, 'A' ) )
print 'Is value "a" in column range? ' + str( is_a_column_reference( board, 'a' ) )
#~ print 'Is value  1  in row range? '    + str( is_a_row_reference( board,  1  ) )
print 'Is value "1" in row range? '    + str( is_a_row_reference( board, '1' ) )
print

print 'Is Full? ' + str( is_full( board ) )
print 'First cell available? ' + str( mark_cell( board, 'O', [ 'A', '1' ] ) )
print 'First cell available, again? ' + str( mark_cell( board, 'O', [ 'A', '1' ] ) )
clean_board( board )
print

mark_cell( board, 'O', [ 'A', '1' ] )
mark_cell( board, 'X', [ 'B', '1' ] )
mark_cell( board, 'O', [ 'C', '1' ] )
show_board( board )
print 'Is Full? ' + str( is_full( board ) )
mark_cell( board, 'X', [ 'A', '2' ] )
mark_cell( board, 'O', [ 'B', '2' ] )
mark_cell( board, 'X', [ 'C', '2' ] )
show_board( board )
print 'Is Full? ' + str( is_full( board ) )
mark_cell( board, 'O', [ 'A', '3' ] )
mark_cell( board, 'X', [ 'B', '3' ] )
mark_cell( board, 'O', [ 'C', '3' ] )
show_board( board )
print 'Is Full? ' + str( is_full( board ) )
