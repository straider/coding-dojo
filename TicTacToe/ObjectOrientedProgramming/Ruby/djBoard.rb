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


# Classes
#---------------------------------------

class Board

=begin
  Initializes an instance property which is matrix of size x size with null values.
=end
  def initialize( size )
    @board = []

    size.times do
      row = []
      size.times do
        row.push( nil )
      end
      @board.push( row )
    end
  end

=begin
  Cleans a board by setting every cell's value to an empty piece.
=end
  def clean_board()
    size = @board.size

    for row in @board
      size.times do | index |
        row[ index ] = PIECE_EMPTY
      end
    end
  end

  def build_column_header()
    # Build Header of Columns, using MagicSpaces.
    column_header = '   '

    column = MINIMUM_COLUMN_REFERENCE
    @board.size.times do
      column_header += ( ' ' + column + '  ' )
      column = column.succ
    end

    return column_header
  end

  def build_row_fill()
    row_fill = ROW_START

    @board.size.times do
      row_fill += ROW_FILL_PATTERN
    end

    return row_fill
  end

=begin
  Builds a string, with references for column and row for CLI output, from the instance property board.
=end
  def to_string()
    # Print Header of Columns.
    stringified_board = build_column_header() + "\n"

    row_reference = MINIMUM_ROW_REFERENCE
    for row in @board
      # Print Row Separator.
      stringified_board += build_row_fill() + "\n"

      # Print all cells of a row.
      line = ''
      for cell in row
        line += ( cell + CELL_SEPARATOR )
      end
      stringified_board += ( row_reference + CELL_SEPARATOR + line ) + "\n"

      row_reference = row_reference.succ
    end

    # Print Row Separator.
    stringified_board += build_row_fill() + "\n"
    stringified_board += "\n"
  end

=begin
  Calculates the maximum column reference starting at the minimum reference of the board.
  Returns the character of maximum reference in board.
=end
  def maximum_column_reference()
    size = @board.size
    return ( MINIMUM_COLUMN_REFERENCE[ 0 ] + size - 1 ).chr
  end
=begin
  Calculates the maximum row reference starting at the minimum reference of the board.
  Returns the character of maximum reference in board.
=end
  def maximum_row_reference()
    size = @board.size
    return ( MINIMUM_ROW_REFERENCE[ 0 ] + size - 1 ).chr
  end

=begin
  Given a value and a range, this function validates if the value is contained in the range.
  Returns True if value within range and False otherwise
=end
  def is_value_within_range( value, min, max )
    ( min .. max ).include?( value )
  end
=begin
  Given a character value it returns True is it's within the range of column references,
      or False otherwise.
=end
  def is_a_column_reference(value )
    is_value_within_range( value, MINIMUM_COLUMN_REFERENCE, maximum_column_reference() )
  end
=begin
  Given a character value it returns True is it's within the range of row references,
      or False otherwise.
=end
  def is_a_row_reference( value )
    is_value_within_range( value, MINIMUM_ROW_REFERENCE, maximum_row_reference() )
  end

=begin
  Given a piece used by player and a reference ( column, row )
      it marks the corresponding cell on the board with that piece.
  Returns True is cell was empty and False otherwise.
=end
  def mark_cell( piece, reference )
    column, row = reference
    # Adjust column and row values from ASCII value to Array Index.
    column = ( column[ 0 ] - MINIMUM_COLUMN_REFERENCE[ 0 ] )
    row    = ( row[ 0 ]    - MINIMUM_ROW_REFERENCE[ 0 ]    )

    @board[ row ][ column ] = piece if @board[ row ][ column ] == PIECE_EMPTY
    return @board[ row ][ column ] == piece
  end

=begin
  Returns a List with the rows of the board.
=end
  def rows()
    result = []

    for row in @board
      result.push( row )
    end

    return result
  end

=begin
  Returns a List with the columns of the board.
=end
  def columns()
    result = []
    size   = @board.size

    for row_index in ( 0 ... size )
      column = []
      for column_index in ( 0 ... size )
        column.push( @board[ column_index ][ row_index ] )
      end
      result.push( column )
    end

    return result
  end

=begin
  Returns a List with the 2 diagonals of the board.
=end
  def diagonals()
    result = []
    size   = @board.size

    diagonals = [ [], [] ]
    for index in ( 0 ... size )
      diagonals[ 0 ].push( @board[ index ][ index            ] )
      diagonals[ 1 ].push( @board[ index ][ size - index - 1 ] )
    end

    for diagonal in diagonals
      result.push( diagonal )
    end

    return result
  end

=begin
  Counts the number of occurrences of empty cells in the board.
  Returns True if no occurrences found, False otherwise.
=end
  def is_full()
    @board.flatten.select { | cell | cell == PIECE_EMPTY }.size == 0
  end

=begin
  Returns the size of the board, since it is a square matrix ( size x size ).
=end
  def size
    @board.size
  end

end
