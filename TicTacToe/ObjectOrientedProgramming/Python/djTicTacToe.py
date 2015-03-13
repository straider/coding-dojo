#!/usr/bin/python
# -*- coding: utf-8 -*-
# "Defining Python Source Code Encodings":http://www.python.org/dev/peps/pep-0263/

from djGame import *


# Constants
#---------------------------------------

PIECE_O = 'O'
PIECE_X = 'X'


# Variables
#---------------------------------------

size    = 3                             # Should be set by configuration or by command-line option...
players = [ PIECE_O, PIECE_X ]          # This should be built dynamically...
game    = Game( players, size )
#~ results = []


# Routines
#---------------------------------------

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

def play_game( game ) :
  """
  Given the initial game state ( board and a set of players ), loop forever
      until user responds 'N' to play another game.
  Within the loop, each iteration:
      cleans the board;
      waits for game result of playing one game between those players;
      appends the result to the List of results;
      and asks user about playing another game.
  Returns a List of results.
  """
  results      = []
  keep_playing = True

  while keep_playing :
    game_result = game.play()
    results.append( game_result )
    keep_playing = play_again()
    game.restart()

  return results

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


# Main Code
#---------------------------------------

# "doctest - Test interactive Python examples":http://docs.python.org/library/doctest.html
# $> python -m doctest -v «script_name»

# "Running Doctest/Docutils":http://snipplr.com/view/8703/running-doctestdocutils/
if __name__ == '__main__' :
  import doctest
  doctest.testmod()

results = play_game( game )
show_statistics( results, players )
# Variable results should be an instance property of Game instance?
