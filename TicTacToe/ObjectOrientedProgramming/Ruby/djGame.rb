#!/usr/bin/ruby -wKU
# encoding: utf-8

require 'djBoard'


# Classes
#---------------------------------------

class Game

=begin
  Initializes the state of a game, by setting the instance properties to initial values:
    * property player - should be a list of pieces, each used by one player;
    * property board - which holds the matrix of size x size with every cell marked as empty.
=end
  def initialize( players, size )
    @players = Array.new( players )
    @board   = Board.new( size )
    @board.clean_board()
  end

=begin
  Given a piece value indicated by argument player,
  Output a message asking user for a cell reference,
  And validate that input is a 2 character string where each character is within range
=end
  def get_valid_input( player)
    size         = @board.size
    minimum_cell = MINIMUM_COLUMN_REFERENCE          + MINIMUM_ROW_REFERENCE
    maximum_cell = @board.maximum_column_reference() + @board.maximum_row_reference()

    reference = [ nil, nil ]

    while reference.compact.size < 2
      reference = [ nil, nil ]
      print 'Player ( ' + player + ' ), please select cell in range [ ' + minimum_cell + ' .. ' + maximum_cell + ' ]: '
      answer = gets.chomp.upcase
      if answer.size == 2
        for character in answer.split( // )
          if    @board.is_a_column_reference( character )
            reference[ 0 ] = character
          elsif @board.is_a_row_reference( character )
            reference[ 1 ] = character
          end
        end
      end
    end
    puts

    return reference
  end

=begin
  Given a player it keeps asking user for a cell reference
  Until the given reference points out to an empty cell, which is then marked.
  Returns None
=end
  def play_turn( player )
    accepted_play = false

    while not accepted_play
      reference     = get_valid_input( player )
      accepted_play = @board.mark_cell( player, reference )
    end
  end

=begin
  Given the piece used by a player it checks for all 8 possible winner conditions.
  Returns True if last play made player reach a winning condition, False otherwise.
=end
  def is_victory( player )
    possibilities = []
    possibilities = possibilities + @board.rows()
    possibilities = possibilities + @board.columns()
    possibilities = possibilities + @board.diagonals()

    size           = @board.size
    player_has_won = false

    for row in possibilities
      if row.select { | cell | cell == player }.size == size
        player_has_won = true
      end
    end

    return player_has_won
  end

=begin
  Conduct a game of Tic-Tac-Toe over current board and set of players, till game ends.
  A game ends when there's a winner or when there's a tie - no more cells available.
  Returns the mark of the player who won or None in case of tie.
=end
  def play()
    this_turn  = 0
    who_won    = nil
    game_ended = false

    while not game_ended
      puts @board.to_string()
      play_turn( @players[ this_turn ] )
      if    is_victory( @players[ this_turn ] )
        puts 'Player ( ' + @players[ this_turn ] + ' ) won. Congratulations!!!'
        who_won    = @players[ this_turn ]
        game_ended = true
      elsif @board.is_full()
        puts 'Game ended with a draw. Well done!'
        game_ended = true
      else
        this_turn = 1 - this_turn
      end
    end
    puts

    puts @board.to_string()
    return who_won
  end

=begin
  Prepares next game by restoring the board to a clean state and by alternating between players.
=end
  def restart()
    @board.clean_board()
    shifted_player = @players.shift
    @players.push( shifted_player )
  end

end
