def create_board( number_of_rows, number_of_columns )
  result = nil

  if not number_of_rows.nil? and not number_of_columns.nil?
    if number_of_rows > 0 and number_of_columns > 0 then
      board = Array.new
      number_of_rows.times do
        row = [ '' ] * number_of_columns
        board << row
      end
      result = board
    end
  end

  return result
end

def clear_board( board )
  first_row         = board.first
  number_of_rows    = board     .size
  number_of_columns = first_row .size

  return create_board( number_of_rows, number_of_columns )
end

def is_valid_row?( board, row_number )
  board.instance_of?( Array ) ? ( 1 .. board.size ).include?( row_number ) : false
end

def is_valid_column?( board, column_number )
  first_row = board.instance_of?( Array ) ? board.first : nil
  first_row.instance_of?( Array ) ? ( 1 .. first_row.size ).include?( column_number ) : false
end

def get_piece( board, row_number, column_number )
  ( is_valid_row?( board, row_number ) and is_valid_column?( board, column_number ) ) ? board[ row_number - 1 ][ column_number - 1 ] : nil
end

def set_piece( board, row_number, column_number, piece )
  if ( is_valid_row?( board, row_number ) and is_valid_column?( board, column_number ) )
    new_board = Marshal.load( Marshal.dump( board ) )

    new_board[ row_number - 1 ][ column_number - 1 ] = piece
    return new_board
  else
    board.instance_of?( Array ) ? board : nil
  end
end
