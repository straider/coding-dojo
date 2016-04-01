require_relative 'board_controller'
require_relative 'score_controller'

$maximum_attempts = 0
$moves_played     = 0

def initialize_game( number_of_rows, number_of_columns )
  result = initialize_board( number_of_rows, number_of_columns )

  if not result.nil?
    initialize_score

    $maximum_attempts = ( number_of_rows * number_of_columns / 2.0 ).ceil
  end

  return result
end

def reset_game()
  result = reset_board

  store_games

  $moves_played = 0

  return result
end

def print_board()
  show_board
end

def ask_cell_reference()
  row_number    = nil
  column_letter = nil

  is_valid_input = false
  while not is_valid_input
    input = ''
    while input.size != 2
      print 'Enter a cell reference: '
      input = gets.chomp
    end

    is_digit_letter = ( input =~ /\d[a-z]/i ) != nil
    is_letter_digit = ( input =~ /[a-z]\d/i ) != nil

    is_valid_input = ( is_digit_letter or is_letter_digit )

    if is_valid_input
      row_number    = is_digit_letter ? input[ 0 ].to_i   : input[ 1 ].to_i
      column_letter = is_letter_digit ? input[ 0 ].upcase : input[ 1 ].upcase
    else
      puts 'Invalid Cell Reference!'
    end
  end

  return [ row_number, column_letter ]
end

def is_valid_cell_reference?( row_number, column_letter )
  is_valid_cell?( row_number, column_letter )
end

def put_piece( row_number, column_letter )
  result = mark_cell( row_number, column_letter )

  if result
    $moves_played += 1
  end

  return result
end

def is_win?( row_number, column_letter )
  is_hit?( row_number, column_letter )
end

def has_no_more_attempts?()
  $moves_played >= $maximum_attempts
end

def ask_play_again()
  input = ''

  while input.size < 1
    print 'Do you wish to play again? '
    input = gets.chomp
  end

  return input
end

def is_valid_answer?( answer )
  result = false

  if answer.instance_of?( String ) and answer.size > 0
    result = [ 'Y', 'N' ].include?( answer.chars.first.upcase )
  end

  return result
end

def print_score()
  show_score
end

def play_game( number_of_rows, number_of_columns )
  initialize_game( number_of_rows, number_of_columns )

  play_again = true
  while play_again
    reset_game

    end_game_condition = false
    while not end_game_condition
      print_board

      row_number           = nil
      column_letter        = nil
      valid_cell_reference = false
      while not valid_cell_reference
        row_number, column_letter = ask_cell_reference

        valid_cell_reference = is_valid_cell_reference?( row_number, column_letter )
      end

      win_condition = is_win?( row_number, column_letter )
      is_valid_move = put_piece( row_number, column_letter )
      if win_condition
        store_hits
      elsif is_valid_move
        store_misses
      end

      end_game_condition = ( win_condition or has_no_more_attempts? )
    end

    print_board

    answer = ''
    while not is_valid_answer?( answer )
      answer = ask_play_again
    end

    play_again = ( answer.chars.first.upcase == 'Y' )
  end

  print_score
end
