import random

import board_model
import board_view

PIECE_EMPTY  = ''
PIECE_HIDDEN = 'x'
PIECE_HIT    = 'X'
PIECE_MISS   = 'O'

board        = None
row_count    = 0
column_count = 0

def set_mark() :
  global board

  random_row    = random.randint( 1, row_count    )
  random_column = random.randint( 1, column_count )

  board = board_model.set_piece( board, random_row, random_column, PIECE_HIDDEN )

def initialize_board( number_of_rows, number_of_columns ) :
  global board, row_count, column_count
  row_count    = number_of_rows
  column_count = number_of_columns

  if row_count > 0 and column_count > 0 :
    board = board_model.create_board( row_count, column_count )

    return '{0}x{1}'.format( row_count, column_count )
  else :
    board        = None
    row_count    = 0
    column_count = 0

    return None

def reset_board() :
  global board

  if board and row_count > 0 and column_count > 0 :
    board = board_model.clear_board( board )

    set_mark()

    return '{0}x{1}'.format( row_count, column_count )
  else :
    return None

def show_board() :
  board_lines = board_view.build_board_lines( board )

  if board_lines :
    for line in board_lines :
      print line

  return board_lines

def is_valid_cell( row_number, column_letter ) :
  result = False

  if row_number and column_letter :
    if type( row_number ) is int and str( column_letter ).isalpha :
      column_number = ord( str( column_letter ) ) - ord ( 'A' ) + 1

      if row_count > 0 and column_count > 0 :
        is_valid_row_number    = row_number    in range( 1, row_count    + 1 )
        is_valid_column_number = column_number in range( 1, column_count + 1 )

        result = ( is_valid_row_number and is_valid_column_number )

  return result

def is_hit( row_number, column_letter ) :
  result = False

  if is_valid_cell( row_number, column_letter ) :
    column_number = ord( str( column_letter ) ) - ord ( 'A' ) + 1

    result = ( board_model.get_piece( board, row_number, column_number ) == PIECE_HIDDEN )

  return result

def mark_cell( row_number, column_letter ) :
  global board

  result = False

  if is_valid_cell( row_number, column_letter ) :
    column_number = ord( str( column_letter ) ) - ord ( 'A' ) + 1

    piece = board_model.get_piece( board, row_number, column_number )
    if piece in ( PIECE_EMPTY, PIECE_HIDDEN ) :
      piece  = PIECE_HIT if is_hit( row_number, column_letter ) else PIECE_MISS
      board  = board_model.set_piece( board, row_number, column_number, piece )
      result = True

  return result


