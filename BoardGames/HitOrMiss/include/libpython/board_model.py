import copy

def create_board( number_of_rows, number_of_columns ) :
  if number_of_rows > 0 and number_of_columns > 0 :
    return [ [ '' ] * number_of_columns for _ in range( number_of_rows ) ]
  else :
    return None

def clear_board( board ) :
  first_row         = board[ 0 ]
  number_of_rows    = len( board     )
  number_of_columns = len( first_row )
  return [ [ '' ] * number_of_columns for _ in range( number_of_rows ) ]

def is_valid_row( board, row_number ) :
  return row_number in range( 1, len( board ) + 1 ) if type( board ) is list else False

def is_valid_column( board, column_number ) :
  first_row = board[ 0 ] if type( board ) is list else None
  return column_number in range( 1, len( first_row ) + 1 ) if type( first_row ) is list else False

def get_piece( board, row_number, column_number ) :
  try :
    return board[ row_number - 1 ][ column_number - 1 ] if ( row_number > 0 and column_number > 0 ) else None
  except ( TypeError, IndexError ) :
    return None

def set_piece( board, row_number, column_number, piece ) :
  try :
    new_board = copy.deepcopy( board )

    if ( row_number > 0 and column_number > 0 ) :
      new_board[ row_number - 1 ][ column_number - 1 ] = piece

    return new_board
  except IndexError :
    return board
  except TypeError :
    return None

