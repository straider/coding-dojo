#!/usr/bin/python
# -*- coding: utf-8 -*-
# "Defining Python Source Code Encodings":http://www.python.org/dev/peps/pep-0263/

from djBoard import *


# Classes
#---------------------------------------

class Game :

  def __init__( self, players, size ) :
    """
    Initializes the state of a game, by setting the instance properties to initial values:
      * property player - should be a list of pieces, each used by one player;
      * property board - which holds the matrix of size x size with every cell marked as empty.

    >>> game = Game( [ 'O', 'X' ], 3 )
    >>> game._Game__board._Board__cells.values()  #doctest: +NORMALIZE_WHITESPACE
    ['.', '.', '.',
     '.', '.', '.',
     '.', '.', '.']
    >>> game._Game__players                       #doctest: +NORMALIZE_WHITESPACE
    ['O', 'X']
    """
    self.__players = list( players )    # Keep a copy of the list of given players.
    self.__board   = Board( size )
    self.__board.clean_board()

  def get_valid_input( self, player ) :
    """
    Given a piece value indicated by argument player,
    Output a message asking user for a cell reference,
    And validate that input is a 2 character string where each character is within range
    """
    minimum_cell = min( self.__board.cells.keys() )
    maximum_cell = max( self.__board.cells.keys() )
    reference    = [ None, None ]

    while reference.count( None ) > 0 :
      reference = [ None, None ]
      answer    = raw_input( 'Player ( ' + player + ' ), please select cell in range [ ' + minimum_cell + ' .. ' + maximum_cell + ' ]: ' )
      if len( answer ) == 2 :
        for character in list( answer.upper() ) :
          if   self.__board.is_a_column_reference( character ) :
            reference[ 0 ] = character
          elif self.__board.is_a_row_reference( character ) :
            reference[ 1 ] = character

    print

    return reference

  def play_turn( self, player ) :
    """
    Given a player it keeps asking user for a cell reference
    Until the given reference points out to an empty cell, which is then marked.
    Returns None
    """
    accepted_play = False

    while not accepted_play :
      reference     = self.get_valid_input( player )
      accepted_play = self.__board.mark_cell( player, reference )

  def is_victory( self, player ) :
    """
    Given the piece used by a player it checks for all 8 possible winner conditions.
    Returns True if last play made player reach a winning condition, False otherwise.

    >>> game = Game( [ 'O', 'X' ], 3 )

    >>> game._Game__board._Board__cells = { 'A1': None, 'B1': None, 'C1': None,
    ...                                     'A2':  'O', 'B2':  'O', 'C2':  'O',
    ...                                     'A3': None, 'B3': None, 'C3': None }
    >>> game.is_victory( 'O' )
    True
    >>> game.is_victory( 'X' )
    False

    >>> game._Game__board._Board__cells = { 'A1': None, 'B1':  'O', 'C1': None,
    ...                                     'A2': None, 'B2':  'O', 'C2': None,
    ...                                     'A3': None, 'B3':  'O', 'C3': None }
    >>> game.is_victory( 'O' )
    True
    >>> game.is_victory( 'X' )
    False

    >>> game._Game__board._Board__cells = { 'A1':  'X', 'B1': None, 'C1': None,
    ...                                     'A2': None, 'B2':  'X', 'C2': None,
    ...                                     'A3': None, 'B3': None, 'C3':  'X' }
    >>> game.is_victory( 'X' )
    True
    >>> game.is_victory( 'O' )
    False
    """
    possibilities = []
    possibilities = possibilities + self.__board.rows      ()
    possibilities = possibilities + self.__board.columns   ()
    possibilities = possibilities + self.__board.diagonals ()

    size           = self.__board.size()
    player_has_won = False

    for row in possibilities :
      if row.count( player ) == size :
        player_has_won = True

    return player_has_won

  def play( self ) :
    """
    Conduct a game of Tic-Tac-Toe over current board and set of players, till game ends.
    A game ends when there's a winner or when there's a tie - no more cells available.
    Returns the mark of the player who won or None in case of tie.
    """
    this_turn  = 0
    who_won    = None
    game_ended = False

    while not game_ended :

      print self.__board
      self.play_turn( self.__players[ this_turn ] )

      if    self.is_victory( self.__players[ this_turn ] ) :
        print 'Player ( ' + self.__players[ this_turn ] + ' ) won. Congratulations!!!'
        who_won    = self.__players[ this_turn ]
        game_ended = True
      elif  self.__board.is_full() :
        print 'Game ended with a draw. Well done!'
        game_ended = True
      else :
        this_turn = 1 - this_turn

    print
    print self.__board

    return who_won

  def restart( self ) :
    """
    Prepares next game by restoring the board to a clean state and by alternating between players.
    """
    self.__board.clean_board()
    shifted_player = self.__players.pop( 0 )
    self.__players.append( shifted_player )


# "doctest - Test interactive Python examples":http://docs.python.org/library/doctest.html
# $> python -m doctest -v «script_name»

# "Running Doctest/Docutils":http://snipplr.com/view/8703/running-doctestdocutils/
if __name__ == '__main__' :
  import doctest
  doctest.testmod()
