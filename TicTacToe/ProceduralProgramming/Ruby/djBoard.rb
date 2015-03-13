#!/usr/bin/ruby -wKU
# encoding: utf-8

# Constants
#---------------------------------------

PIECE_EMPTY      = '.'                  # Should be a variable passed to each function that needs this constant.

CELL_SEPARATOR   = ' | '
ROW_START        = '  +'                # To allow for variable sized matrices.
ROW_FILL_PATTERN = '---+'               # To allow for variable sized matrices.

MINIMUM_COLUMN_REFERENCE = 'A'
MINIMUM_ROW_REFERENCE    = '1'


# Routines
#---------------------------------------

=begin
  Creates and initializes a matrix of size x size with null values.
  Returns that matrix.
=end
def init_board( size )
  board = []

  size.times do
    row = []
    size.times do
      row.push( nil )
    end
    board.push( row )
  end

  return board
end

=begin
  Cleans a board by setting every cell's value to an empty piece
  Receives the board to cleanup and returns that board.
=end
def clean_board( board )
  size = board.size

  for row in board
    size.times do | index |
      row[ index ] = PIECE_EMPTY
    end
  end

  return board
end

def build_column_header( size )
  # Build Header of Columns, using MagicSpaces.
  column_header = '   '

  column = MINIMUM_COLUMN_REFERENCE
  size.times do
    column_header += ( ' ' + column + '  ' )
    column = column.succ
  end

  return column_header
end

def build_row_fill( size )
  row_fill = ROW_START

  size.times do
    row_fill += ROW_FILL_PATTERN
  end

  return row_fill
end

=begin
  Prints the given board with references for column and row.
=end
def show_board( board )
  size = board.size

  # Print Header of Columns.
  puts build_column_header( size )

  row_reference = MINIMUM_ROW_REFERENCE
  for row in board
    # Print Row Separator.
    puts build_row_fill( size )

    # Print all cells of a row.
    line = ''
    for cell in row
      line += ( cell + CELL_SEPARATOR )
    end
    puts( row_reference + CELL_SEPARATOR + line )

    row_reference = row_reference.succ
  end

  # Print Row Separator.
  puts build_row_fill( size )
  puts
end

=begin
  Given a board it calculates the maximum column reference starting at minimum reference.
  Returns the character of maximum reference in board.
=end
def maximum_column_reference( board )
  size = board.size
  return ( MINIMUM_COLUMN_REFERENCE[ 0 ] + size - 1 ).chr
end
=begin
  Given a board it calculates the maximum row reference starting at minimum reference.
  Returns the character of maximum reference in board.
=end
def maximum_row_reference( board )
  size = board.size
  return ( MINIMUM_ROW_REFERENCE[ 0 ] + size - 1 ).chr
end

=begin
  Given a value and a range, this function validates if the value is contained in the range.
  Returns True if value within range and False otherwise
=end
def is_value_within_range( value, min, max )
  ( min .. max ).include?( value )
end
def is_a_column_reference( board, value )
  is_value_within_range( value, MINIMUM_COLUMN_REFERENCE, maximum_column_reference( board ) )
end
def is_a_row_reference( board, value )
  is_value_within_range( value, MINIMUM_ROW_REFERENCE, maximum_row_reference( board ) )
end

=begin
  Given a board and a piece used by player and a reference ( column, row )
      it marks the corresponding cell of board with piece.
  Returns True is cell was empty and False otherwise.
=end
def mark_cell( board, piece, reference )
  column, row = reference
  # Adjust column and row values from ASCII value to Array Index.
  column = ( column[ 0 ] - MINIMUM_COLUMN_REFERENCE[ 0 ] )
  row    = ( row[ 0 ]    - MINIMUM_ROW_REFERENCE[ 0 ]    )

  board[ row ][ column ] = piece if board[ row ][ column ] == PIECE_EMPTY
  return board[ row ][ column ] == piece
end

=begin
  Given a square matrix - which is not validated if is square or not
  Return a List with the rows of that matrix.
=end
def matrix_rows( board )
  result = []

  for row in board
    result.push( row )
  end

  return result
end

=begin
  Given a square matrix - which is not validated if is square or not
  Return a List with the columns of that matrix.
=end
def matrix_columns( board )
  result = []
  size   = board.size

  for row_index in ( 0 ... size )
    column = []
    for column_index in ( 0 ... size )
      column.push( board[ column_index ][ row_index ] )
    end
    result.push( column )
  end

  return result
end

=begin
  Given a square matrix - which is not validated if is square or not
  Return a List with the 2 diagonals of that matrix.
=end
def matrix_diagonals( board )
  result = []
  size   = board.size

  diagonals = [ [], [] ]
  for index in ( 0 ... size )
    diagonals[ 0 ].push( board[ index ][ index            ] )
    diagonals[ 1 ].push( board[ index ][ size - index - 1 ] )
  end

  for diagonal in diagonals
    result.push( diagonal )
  end

  return result
end

=begin
  Given a board it counts the number of occurrences of empty cells.
  Returns True if no occurrences found, False otherwise.
=end
def is_full( board )
  board.flatten.select { | cell | cell == PIECE_EMPTY }.size == 0
end
