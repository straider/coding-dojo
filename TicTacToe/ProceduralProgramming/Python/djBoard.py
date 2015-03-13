#!/usr/bin/python
# -*- coding: utf-8 -*-
# "Defining Python Source Code Encodings":http://www.python.org/dev/peps/pep-0263/

# Constants
#---------------------------------------

PIECE_EMPTY = '.'

CELL_SEPARATOR   = ' | '
ROW_START        = '  +'                # To allow for variable sized matrices.
ROW_FILL_PATTERN = '---+'               # To allow for variable sized matrices.

MINIMUM_COLUMN_REFERENCE = 'A'
MINIMUM_ROW_REFERENCE    = '1'


# Variables
#---------------------------------------


# Routines
#---------------------------------------

def init_board( size ) :
  """
  Creates and initializes a matrix of size x size with null values.
  Returns that matrix.

  >>> init_board( 3 )                   #doctest: +NORMALIZE_WHITESPACE
  [[None, None, None],
   [None, None, None],
   [None, None, None]]
  """
  return [ [ None ] * size for index in xrange( size ) ]

def clean_board( board ) :
  """
  Cleans a board by setting every cell's value to an empty piece.
  Receives the board to cleanup and returns that board.

  >>> clean_board( init_board( 3 ) )     #doctest: +NORMALIZE_WHITESPACE
  [['.', '.', '.'],
   ['.', '.', '.'],
   ['.', '.', '.']]
  """
  for row in board :
    for index in xrange( len( row ) ) :
      row[ index ] = PIECE_EMPTY
  return board

def build_column_header( size ) :
  # Build Header of Columns, using MagicSpaces.
  column_header = '   '

  column = MINIMUM_COLUMN_REFERENCE
  for times in xrange( size ) :
    column_header += ' ' + column + '  '
    column = chr( ord( column ) + 1 )

  return column_header

def build_row_fill( size ) :
  row_fill = ROW_START

  for items in xrange( size ) :
    row_fill += ROW_FILL_PATTERN

  return row_fill

def show_board( board ) :
  """
  Prints the given board with references for column and row.

  >>> board = clean_board( init_board( 3 ) )
  >>> show_board( board )               #doctest: +NORMALIZE_WHITESPACE
      A   B   C
    +---+---+---+
  1 | . | . | . |
    +---+---+---+
  2 | . | . | . |
    +---+---+---+
  3 | . | . | . |
    +---+---+---+
  """
  size = len( board )

  # Print Header of Columns.
  print build_column_header( size )

  for index, row in enumerate( board ) :
    # Print Row Separator.
    print build_row_fill( size )

    # Print all cells of a row.
    line = ''
    for cell in row :
      line += cell + CELL_SEPARATOR
    print str( index + 1 ) + CELL_SEPARATOR + line

  # Print Row Separator.
  print build_row_fill( size )
  print

def maximum_column_reference( board ) :
  """
  Given a board it calculates the maximum column reference starting at minimum reference.
  Returns the character of maximum reference in board.

  >>> board = clean_board( init_board( 3 ) )
  >>> maximum_column_reference( board )
  'C'
  """
  size = len( board )
  return chr( ord( MINIMUM_COLUMN_REFERENCE ) + size - 1 )

def maximum_row_reference( board ) :
  """
  Given a board it calculates the maximum row reference starting at minimum reference.
  Returns the character of maximum reference in board.

  >>> board = clean_board( init_board( 3 ) )
  >>> maximum_row_reference( board )
  '3'
  """
  size = len( board )
  return chr( ord( MINIMUM_ROW_REFERENCE ) + size - 1 )

def is_value_within_range( value, minimum, maximum ) :
  """
  Given a value and a range, this function validates if the value is contained in the range.
  Returns True if value within range and False otherwise

  >>> is_value_within_range( 'B', 'A', 'C' )
  True
  >>> is_value_within_range( '2', '1', '3' )
  True

  >>> is_value_within_range( 'Z', 'A', 'C' )
  False
  >>> is_value_within_range( 'b', 'A', 'C' )
  False
  >>> is_value_within_range( '9', '1', '3' )
  False

  >>> is_value_within_range( '3', '1', '3' )
  True
  >>> is_value_within_range( 'C', 'A', 'C' )
  True
  """
  interval = xrange( ord( minimum ), ord( maximum ) + 1 )
  return ( ord( value ) in interval )

def is_a_column_reference( board, value ) :
  """
  Given a character value it returns True is it's within the range of column references,
      or False otherwise.

  >>> board = init_board( 3 )

  >>> is_a_column_reference( board, 'B' )
  True
  >>> is_a_column_reference( board, 'b' )
  False
  >>> is_a_column_reference( board, '1' )
  False
  """
  return is_value_within_range( value, MINIMUM_COLUMN_REFERENCE, maximum_column_reference( board ) )

def is_a_row_reference( board, value ) :
  """
  Given a character value it returns True is it's within the range of row references,
      or False otherwise.

  >>> board = init_board( 3 )

  >>> is_a_row_reference( board, '1' )
  True
  >>> is_a_row_reference( board, 'B' )
  False
  """
  return is_value_within_range( value, MINIMUM_ROW_REFERENCE, maximum_row_reference( board ) )

def mark_cell( board, piece, reference ) :
  """
  Given a board and a piece used by player and a reference ( column, row )
      it marks the corresponding cell of board with piece.
  Returns True is cell was empty and False otherwise.

  >>> board = clean_board( init_board( 3 ) )
  >>> mark_cell( board, 'O', [ 'B', '2' ] )
  True
  >>> mark_cell( board, 'X', [ 'B', '2' ] )
  False
  """
  column, row = reference
  # Adjust column and row values from ASCII value to Array Index.
  column = ( ord( column ) - ord( MINIMUM_COLUMN_REFERENCE ) )
  row    = ( ord( row    ) - ord( MINIMUM_ROW_REFERENCE    ) )

  if board[ row ][ column ] == PIECE_EMPTY :
    board[ row ][ column ] = piece

  return ( board[ row ][ column ] == piece )

def matrix_rows( board ) :
  """
  Given a square matrix - which is not validated if is square or not
  Return a List with the rows of that matrix.

  >>> board = [['A1', 'B1', 'C1'],
  ...          ['A2', 'B2', 'C2'],
  ...          ['A3', 'B3', 'C3']]
  >>> matrix_rows( board )           #doctest: +NORMALIZE_WHITESPACE
  [['A1', 'B1', 'C1'],
   ['A2', 'B2', 'C2'],
   ['A3', 'B3', 'C3']]
  """
  result = []

  for row in board :
    result.append( row )

  return result

def matrix_columns( board ) :
  """
  Given a square matrix - which is not validated if is square or not
  Return a List with the columns of that matrix.

  >>> board = [['A1', 'B1', 'C1'],
  ...          ['A2', 'B2', 'C2'],
  ...          ['A3', 'B3', 'C3']]
  >>> matrix_columns( board )        #doctest: +NORMALIZE_WHITESPACE
  [['A1', 'A2', 'A3'],
   ['B1', 'B2', 'B3'],
   ['C1', 'C2', 'C3']]
  """
  result = []
  size   = len( board )

  for row_index in xrange( size ) :
    column = []
    for column_index in xrange( size ) :
      column.append( board[ column_index ][ row_index ] )
    result.append( column )

  return result

def matrix_diagonals( board ) :
  """
  Given a square matrix - which is not validated if is square or not
  Return a List with the 2 diagonals of that matrix.

  >>> board = [['A1', 'B1', 'C1'],
  ...          ['A2', 'B2', 'C2'],
  ...          ['A3', 'B3', 'C3']]
  >>> matrix_diagonals( board )      #doctest: +NORMALIZE_WHITESPACE
  [['A1', 'B2', 'C3'],
   ['C1', 'B2', 'A3']]
  """
  result = []
  size   = len( board )

  diagonals = [ [], [] ]
  for index in xrange( size ) :
    diagonals[ 0 ].append( board[ index ][ index            ] )
    diagonals[ 1 ].append( board[ index ][ size - index - 1 ] )

  for diagonal in diagonals :
    result.append( diagonal )

  return result

def is_full( board ) :
  """
  Given a board it counts the number of occurrences of empty cells.
  Returns True if no occurrences found, False otherwise.

  >>> board = [['O', '.', 'X'],
  ...          ['O', 'X', 'O'],
  ...          ['.', '.', 'X']]
  >>> is_full( board )
  False

  >>> board = [['O', 'O', 'X'],
  ...          ['X', 'X', 'O'],
  ...          ['O', 'O', 'X']]
  >>> is_full( board )
  True
  """
  # Flatten matrix SIZE columns x SIZE rows to an array of SIZE x SIZE items.
  flat_board = sum( board, [] )
  # Return count of occurrences of PIECE_EMPTY in flatten board.
  return ( flat_board.count( PIECE_EMPTY) == 0 )


# "doctest - Test interactive Python examples":http://docs.python.org/library/doctest.html
# $> python -m doctest -v «script_name»

# "Running Doctest/Docutils":http://snipplr.com/view/8703/running-doctestdocutils/
if __name__ == '__main__' :
  import doctest
  doctest.testmod()
