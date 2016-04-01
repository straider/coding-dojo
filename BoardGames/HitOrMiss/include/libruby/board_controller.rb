require_relative 'board_model'
require_relative 'board_view'

PIECE_EMPTY  = ''
PIECE_HIDDEN = 'x'
PIECE_HIT    = 'X'
PIECE_MISS   = 'O'

$board        = nil
$row_count    = 0
$column_count = 0

def initialize_board( number_of_rows, number_of_columns )
  result = nil

  if not number_of_rows.nil? and not number_of_columns.nil?
    $row_count    = number_of_rows
    $column_count = number_of_columns
    if $row_count > 0 and $column_count > 0
      $board = create_board( $row_count, $column_count )
      result = "#{ $row_count }x#{ $column_count }"
    end
  else
    $board        = nil
    $row_count    = 0
    $column_count = 0
  end

  return result
end

def reset_board()
  result = nil

  if not $board.nil?
    if $row_count > 0 and $column_count > 0
      $board = clear_board( $board )

      random_row    = rand( 1 .. $row_count    )
      random_column = rand( 1 .. $column_count )

      $board = set_piece( $board, random_row, random_column, PIECE_HIDDEN )
      result = "#{ $row_count }x#{ $column_count }"
    end
  end

  return result
end

def show_board()
  board_lines = build_board_lines( $board )

  if not board_lines.nil?
    board_lines.each do | line |
      puts line
    end
  end

  return board_lines
end

def is_valid_cell?( row_number, column_letter )
  result = false

  if not row_number.nil? and not column_letter.nil?
    column_number = column_letter.ord - 'A'.ord + 1

    result = ( is_valid_row?( $board, row_number ) and is_valid_column?( $board, column_number ) )
  end

  return result
end

def is_hit?( row_number, column_letter )
  result = false

  if is_valid_cell?( row_number, column_letter )
    column_number = column_letter.ord - 'A'.ord + 1

    result = ( get_piece( $board, row_number, column_number ) == PIECE_HIDDEN )
  end

  return result
end

def mark_cell( row_number, column_letter )
  result = false

  if is_valid_cell?( row_number, column_letter )
    column_number = column_letter.ord - 'A'.ord + 1

    piece = get_piece( $board, row_number, column_number )
    if [ PIECE_EMPTY, PIECE_HIDDEN ].include?( piece )
      piece  = is_hit?( row_number, column_letter ) ? PIECE_HIT : PIECE_MISS
      $board = set_piece( $board, row_number, column_number, piece )
      result = true
    end
  end

  return result
end
