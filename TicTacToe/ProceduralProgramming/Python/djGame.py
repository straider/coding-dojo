#!/usr/bin/python
# -*- coding: utf-8 -*-
# "Defining Python Source Code Encodings":http://www.python.org/dev/peps/pep-0263/

from djBoard import *

# Variables
#---------------------------------------


# Routines
#---------------------------------------

def get_valid_input( player, board ) :
  """
  Given a piece value indicated by argument player and a board ( for checking reference),
  Output a message asking user for a cell reference,
  And validate that input is a 2 character string where each character is within range.
  """
  size         = len( board )
  minimum_cell = MINIMUM_COLUMN_REFERENCE          + MINIMUM_ROW_REFERENCE
  maximum_cell = maximum_column_reference( board ) + maximum_row_reference( board )
  reference    = [ None, None ]

  while reference.count( None ) > 0 :
    reference = [ None, None ]
    answer    = raw_input( 'Player ( ' + player + ' ), please select cell in range [ ' + minimum_cell + ' .. ' + maximum_cell + ' ]: ' )
    if len( answer ) == 2 :
      for character in list( answer.upper() ) :
        if   is_a_column_reference( board, character ) :
          reference[ 0 ] = character
        elif is_a_row_reference( board, character ) :
          reference[ 1 ] = character

  print

  return reference

# How to control input and output when using DocTest :?:
#~ print get_valid_input( PIECE_O )

def play_turn( board, player ) :
  """
  Given a board and a player it keeps asking user for a cell reference
  Until given reference points to an empty cell, which is then marked.
  Returns None
  """
  accepted_play = False

  while not accepted_play :
    reference     = get_valid_input( player, board )
    accepted_play = mark_cell( board, player, reference )

# How to control input and output when using DocTest :?:
#~ board = clean_board( init_board() )
#~ print play_turn( board, PIECE_X )

def is_victory( board, player ) :
  """
  Given a board and the piece used by a player
      it checks for all 8 possible winner conditions.
  Returns True if last play made player reach a winning condition, False otherwise.

  >>> board = [[None, None, None],
  ...          ['O' , 'O' , 'O' ],
  ...          [None, None, None]]
  >>> is_victory( board, 'O' )
  True
  >>> is_victory( board, 'X' )
  False

  >>> board = [[None, 'O', None],
  ...          [None, 'O', None],
  ...          [None, 'O', None]]
  >>> is_victory( board, 'O' )
  True
  >>> is_victory( board, 'X' )
  False

  >>> board = [['X' , None, None],
  ...          [None, 'X' , None],
  ...          [None, None, 'X']]
  >>> is_victory( board, 'X' )
  True
  >>> is_victory( board, 'O' )
  False
  """
  possibilities = []
  possibilities = possibilities + matrix_rows      ( board )
  possibilities = possibilities + matrix_columns   ( board )
  possibilities = possibilities + matrix_diagonals ( board )

  size           = len( board )
  player_has_won = False

  for row in possibilities :
    if row.count( player ) == size :
      player_has_won = True

  return player_has_won

def play( board, players ) :
  """
  Given a board and a set of players, conduct a game of Tic-Tac-Toe till game ends.
  A game ends when there's a winner or when there's a tie - no more cells available.
  Returns the mark of the player who won or None in case of tie.
  """
  this_turn  = 0
  who_won    = None
  game_ended = False

  while not game_ended :
    show_board( board )
    play_turn( board, players[ this_turn ] )
    if    is_victory( board, players[ this_turn ] ) :
      print 'Player ( ' + players[ this_turn ] + ' ) won. Congratulations!!!'
      who_won    = players[ this_turn ]
      game_ended = True
    elif  is_full( board ) :
      print 'Game ended with a draw. Well done!'
      game_ended = True
    else :
      this_turn = 1 - this_turn

  print
  show_board( board )

  return who_won

# How to control input and output when using DocTest :?:
#~ board = clean_board( init_board() )
#~ print play( board, players )

def play_again() :
  """
  Asks user about playing another game and until the response
      is 'Y' or 'N' it continues asking.
  Returns True if response is 'Y', False if is 'N'
  """
  response = None

  while not response in ( 'Y', 'N' ) :
    response = raw_input( 'Play another game? [ Y / N ]: ' )
    response = response.upper()

  print

  return response == 'Y'

# How to control input and output when using DocTest :?:
#~ print ask_to_play_again()

def play_game( size, players_set ) :
  """
  Given a board size and a set of players, it initializes the board and copies the players
      before looping until user responds 'N' to play another game.
  Within the loop, each iteration:
      cleans the board;
      waits for game result of playing one game between those players;
      appends the result to the List of results;
      and asks user about playing another game.
  Returns a List of results.
  """
  board        = init_board( size )
  players      = list( players_set )
  results      = []
  keep_playing = True

  while keep_playing :
    board       = clean_board( board )
    game_result = play( board, players )
    results.append( game_result )
    keep_playing   = play_again()
    shifted_player = players.pop( 0 )
    players.append( shifted_player )

  return results

# How to control input and output when using DocTest :?:
#~ print play_game( init_board() )

def show_statistics( results, players ) :
  """
  Given a List of results and a set of players, it outputs the total number of games played,
      the total number of victories for each player,
      and the total number of drawns.
  """
  games_won = []
  for player in players :
    games_won.append( results.count( player ) )

  games_played = len( results )
  games_tied   = games_played - sum( games_won )

  print 'Game Results:'
  print '\tGames Played......... ' + str( games_played   )
  for index, player in enumerate( players ) :
    print '\tPlayer ( ' + player + ' ) won..... ' + str( games_won[ index ] ) + ' times'
  print '\tGames Tied........... ' + str( games_tied     )
  print

# How to control input and output when using DocTest :?:
#~ show_statistics( play_game( init_board() ) )


# "doctest - Test interactive Python examples":http://docs.python.org/library/doctest.html
# $> python -m doctest -v «script_name»

# "Running Doctest/Docutils":http://snipplr.com/view/8703/running-doctestdocutils/
if __name__ == '__main__' :
  import doctest
  doctest.testmod()
