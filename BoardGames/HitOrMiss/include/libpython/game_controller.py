import math

import board_controller
import score_controller

maximum_attempts = 0
moves_played     = 0

def initialize_game( number_of_rows, number_of_columns ) :
  global maximum_attempts

  result = board_controller.initialize_board( number_of_rows, number_of_columns )

  if result :
    score_controller.initialize_score()
    maximum_attempts = int( math.ceil( number_of_rows * number_of_columns / 2.0 ) )

  return result

def reset_game() :
  global moves_played

  result = board_controller.reset_board()

  score_controller.store_games()
  moves_played = 0

  return result

def print_board() :
  return board_controller.show_board()

def ask_cell_reference() :
  row_number    = None
  column_letter = None

  is_valid_input = False
  while not is_valid_input :
    input = ''
    while len( input ) != 2 :
      input = raw_input( 'Enter a cell reference: ' )

    is_digit_letter = input[ 0 ].isdigit() and input[ 1 ].isalpha()
    is_letter_digit = input[ 0 ].isalpha() and input[ 1 ].isdigit()

    is_valid_input = is_digit_letter or is_letter_digit

    if is_valid_input :
      row_number    = int( input[ 0 ] )  if is_digit_letter else int( input[ 1 ] )
      column_letter = input[ 0 ].upper() if is_letter_digit else input[ 1 ].upper()
    else :
      print 'Invalid Cell Reference!'

  return ( row_number, column_letter )

def is_valid_cell_reference( row_number, column_letter ) :
  return board_controller.is_valid_cell( row_number, column_letter )

def put_piece( row_number, column_letter ) :
  global moves_played

  result = board_controller.mark_cell( row_number, column_letter )
  if result :
    moves_played += 1

  return result

def is_win( row_number, column_letter ) :
  return board_controller.is_hit( row_number, column_letter )

def has_no_more_attempts() :
  return moves_played >= maximum_attempts

def ask_play_again() :
  input = ''
  while len( input ) < 1 :
    input = raw_input( 'Do you wish to play again? ' )

  return input

def is_valid_answer( answer ) :
  return ( answer and type( answer ) is str and str( answer[ 0 ] ).upper() in ( 'Y', 'N' ) )

def print_score() :
  return score_controller.show_score()

def play_game( number_of_rows, number_of_columns ) :
  initialize_game( number_of_rows, number_of_columns )

  play_again = True
  while play_again :
    reset_game()

    end_game_condition = False
    while not end_game_condition :
      print_board()

      row_number           = None
      column_letter        = None
      valid_cell_reference = False
      while not valid_cell_reference :
        ( row_number, column_letter ) = ask_cell_reference()

        valid_cell_reference = is_valid_cell_reference( row_number, column_letter )

      win_condition = is_win    ( row_number, column_letter )
      is_valid_move = put_piece ( row_number, column_letter )
      if win_condition :
        score_controller.store_hits()
      elif is_valid_move :
        score_controller.store_misses()

      end_game_condition = win_condition or has_no_more_attempts()

    print_board()

    answer = ''
    while not is_valid_answer( answer ) :
      answer = ask_play_again()

    play_again = answer[ 0 ].upper() == 'Y'

  print_score()
