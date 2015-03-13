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


# Classes
#---------------------------------------

class Board :

  def __init__( self, size ) :
    """
    Initializes an instance property which is matrix of size x size with null values.

    >>> board = Board( 3 )

    >>> min( board._Board__cells )
    'A1'
    >>> max( board._Board__cells )
    'C3'
    """
    self.__cells = {}
    for column_index in xrange( size ) :
      column_reference = chr( ord( MINIMUM_COLUMN_REFERENCE ) + column_index )
      for row_index in xrange( size ) :
        row_reference = chr( ord( MINIMUM_ROW_REFERENCE ) + row_index )
        cell_reference = column_reference + row_reference
        self.__cells[ cell_reference ] = None


  def clean_board( self ) :
    """
    Cleans a board by setting every cell's value to an empty piece.

    >>> board = Board( 3 )
    >>> board.clean_board()
    >>> board._Board__cells.values()            #doctest: +NORMALIZE_WHITESPACE
    ['.', '.', '.',
     '.', '.', '.',
     '.', '.', '.']
    """
    for key in self.__cells.keys() :
      self.__cells[ key ] = PIECE_EMPTY

  def __build_column_header( self ) :
    """
    Returns a string made up of column references, suitable for printing in CLI mode.

    >>> board = Board( 3 )
    >>> board.clean_board()
    >>> board._Board__build_column_header()
    '    A   B   C  '
    """
    # Build Header of Columns, using MagicSpaces.
    column_header = '   '

    for column in self.column_range() :
      column_header += ' ' + column + '  '

    return column_header

  def __build_row_fill( self ) :
    """
    Returns a string representing a row separator, suitable for printing in CLI mode.

    >>> board = Board( 3 )
    >>> board.clean_board()
    >>> board._Board__build_row_fill()
    '  +---+---+---+'
    """
    row_fill = ROW_START

    for items in xrange( self.size() ) :
      row_fill += ROW_FILL_PATTERN

    return row_fill

  def to_string( self ) :
    """
    Builds a string, with references for column and row for CLI output, from the instance property board.

    >>> board = Board( 3 )
    >>> board.clean_board()
    >>> print board.to_string()         #doctest: +NORMALIZE_WHITESPACE
        A   B   C
      +---+---+---+
    1 | . | . | . |
      +---+---+---+
    2 | . | . | . |
      +---+---+---+
    3 | . | . | . |
      +---+---+---+
    """
    # Print Header of Columns.
    stringified_board = self.__build_column_header() + '\n'

    for index, row in enumerate( self.rows() ) :
      # Print Row Separator.
      stringified_board += self.__build_row_fill() + '\n'

      # Print all cells of a row.
      line = ''
      for cell in row :
        line += cell + CELL_SEPARATOR
      stringified_board += str( index + 1 ) + CELL_SEPARATOR + line + '\n'

    # Print Row Separator.
    stringified_board += self.__build_row_fill() + '\n'
    stringified_board += '\n'

    return stringified_board

  def __str__( self ) :
    return self.to_string()

  def is_a_column_reference( self, value ) :
    """
    Given a character value it returns True is it's within the range of column references,
        or False otherwise.

    >>> board = Board( 3 )

    >>> board.is_a_column_reference( 'B' )
    True
    >>> board.is_a_column_reference( 'b' )
    False
    >>> board.is_a_column_reference( '1' )
    False
    """
    return value in self.column_range()

  def is_a_row_reference( self, value ) :
    """
    Given a character value it returns True is it's within the range of row references,
        or False otherwise.

    >>> board = Board( 3 )

    >>> board.is_a_row_reference( '1' )
    True
    >>> board.is_a_row_reference( 'B' )
    False
    """
    return value in self.row_range()

  def mark_cell( self, piece, reference ) :
    """
    Given a piece used by player and a reference ( column, row )
        it marks the corresponding cell on the board with that piece.
    Returns True is cell was empty and False otherwise.

    >>> board = Board( 3 )
    >>> board.clean_board()

    >>> board.mark_cell( 'O', [ 'B', '2' ] )
    True
    >>> board.mark_cell( 'X', [ 'B', '2' ] )
    False
    """
    # Using an empty string to join items of an array into a cell reference.
    cell_reference = ''.join( reference )

    if self.__cells[ cell_reference ] == PIECE_EMPTY :
      self.__cells[ cell_reference ] = piece

    return ( self.__cells[ cell_reference ] == piece )

  def columns( self ) :
    """
    Returns a List with the columns of the board.

    >>> board = Board( 3 )
    >>> board._Board__cells = { 'A1': 'A1', 'B1': 'B1', 'C1': 'C1',
    ...                 'A2': 'A2', 'B2': 'B2', 'C2': 'C2',
    ...                 'A3': 'A3', 'B3': 'B3', 'C3': 'C3' }
    >>> board.columns()                 #doctest: +NORMALIZE_WHITESPACE
    [['A1', 'A2', 'A3'],
     ['B1', 'B2', 'B3'],
     ['C1', 'C2', 'C3']]
    """
    result = []

    for column_reference in self.column_range() :

      column = []
      for row_reference in self.row_range() :
        cell_reference = column_reference + row_reference
        column.append( self.__cells[ cell_reference ] )

      result.append( column )

    return result

  def rows( self ) :
    """
    Returns a List with the rows of the board.

    >>> board = Board( 3 )
    >>> board._Board__cells = { 'A1': 'A1', 'B1': 'B1', 'C1': 'C1',
    ...                 'A2': 'A2', 'B2': 'B2', 'C2': 'C2',
    ...                 'A3': 'A3', 'B3': 'B3', 'C3': 'C3' }
    >>> board.rows()                    #doctest: +NORMALIZE_WHITESPACE
    [['A1', 'B1', 'C1'],
     ['A2', 'B2', 'C2'],
     ['A3', 'B3', 'C3']]
    """
    result = []

    for row_reference in self.row_range() :

      row = []
      for column_reference in self.column_range() :
        cell_reference = column_reference + row_reference
        row.append( self.__cells[ cell_reference ] )

      result.append( row )

    return result

  def diagonals( self ) :
    """
    Returns a List with the 2 diagonals of the board.

    >>> board = Board( 3 )
    >>> board._Board__cells = { 'A1': 'A1', 'B1': 'B1', 'C1': 'C1',
    ...                 'A2': 'A2', 'B2': 'B2', 'C2': 'C2',
    ...                 'A3': 'A3', 'B3': 'B3', 'C3': 'C3' }
    >>> board.diagonals()               #doctest: +NORMALIZE_WHITESPACE
    [['A1', 'B2', 'C3'],
     ['C1', 'B2', 'A3']]
    """
    diagonals         = [ [], [] ]
    column_references = self.column_range()
    row_references    = self.row_range()

    for item in zip( column_references, row_references ) :
      cell_reference = ''.join( item )
      diagonals[ 0 ].append( self.__cells[ cell_reference ] )

    column_references.reverse()
    for item in zip( column_references, row_references ) :
      cell_reference = ''.join( item )
      diagonals[ 1 ].append( self.__cells[ cell_reference ] )

    return diagonals

  def is_full( self ) :
    """
    Counts the number of occurrences of empty cells in the board.
    Returns True if no occurrences found, False otherwise.

    >>> board = Board( 3 )
    >>> board.clean_board()
    >>> board._Board__cells[ 'A1' ] = 'O'
    >>> board._Board__cells[ 'A2' ] = 'O'
    >>> board._Board__cells[ 'A3' ] = 'X'
    >>> board._Board__cells[ 'B1' ] = 'X'
    >>> board._Board__cells[ 'B2' ] = 'X'
    >>> board._Board__cells[ 'B3' ] = 'O'
    >>> board.is_full()
    False

    >>> board._Board__cells[ 'C1' ] = 'O'
    >>> board._Board__cells[ 'C2' ] = 'O'
    >>> board._Board__cells[ 'C3' ] = 'X'
    >>> board.is_full()
    True
    """
    flat_board = self.__cells.values()
    return ( flat_board.count( PIECE_EMPTY) == 0 )

  def size( self ) :
    """
    Returns the size of the board, since it is a square matrix ( size x size ).

    >>> board = Board( 3 )
    >>> board.size()
    3
    """
    return len( self.row_range() )

  def column_range( self ) :
    """
    Returns a sorted array of the set of column references.

    >>> board = Board( 3 )
    >>> board.column_range()            #doctest: +NORMALIZE_WHITESPACE
    ['A', 'B', 'C']
    """
    return sorted( set( [ key[ 0 ] for key in self.__cells.keys() ] ) )

  def row_range( self ) :
    """
    Returns a sorted array of the set of row references.

    >>> board = Board( 3 )
    >>> board.row_range()               #doctest: +NORMALIZE_WHITESPACE
    ['1', '2', '3']
    """
    return sorted( set( [ key[ 1 ] for key in self.__cells.keys() ] ) )


# "doctest - Test interactive Python examples":http://docs.python.org/library/doctest.html
# $> python -m doctest -v «script_name»

# "Running Doctest/Docutils":http://snipplr.com/view/8703/running-doctestdocutils/
if __name__ == '__main__' :
  import doctest
  doctest.testmod()
