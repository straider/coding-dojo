#!/usr/bin/ruby -wKU
# encoding: utf-8

require 'djBoard'

=begin
  Given a piece value indicated by argument player,
  Output a message asking user for a cell reference,
  And validate that input is a 2 character string where each character is within range
=end
def get_valid_input( player, board )
  size         = board.size
  minimum_cell = MINIMUM_COLUMN_REFERENCE          + MINIMUM_ROW_REFERENCE
  maximum_cell = maximum_column_reference( board ) + maximum_row_reference( board )

  reference = [ nil, nil ]

  while reference.compact.size < 2
    reference = [ nil, nil ]
    print 'Player ( ' + player + ' ), please select cell in range [ ' + minimum_cell + ' .. ' + maximum_cell + ' ]: '
    answer = gets.chomp.upcase
    if answer.size == 2
      for character in answer.split( // )
        if    is_a_column_reference( board, character )
          reference[ 0 ] = character
        elsif is_a_row_reference( board, character )
          reference[ 1 ] = character
        end
      end
    end
  end
  puts

  return reference
end

=begin
  Given a board and a player it keeps asking user for a cell reference
  Until given reference points to an empty cell, which is then marked.
  Returns None
=end
def play_turn( board, player )
  accepted_play = false

  while not accepted_play
    reference     = get_valid_input( player, board )
    accepted_play = mark_cell( board, player, reference )
  end
end

=begin
  Given a board and the piece used by a player
      it checks for all 8 possible winner conditions.
  Returns True if last play made player reach a winning condition, False otherwise.
=end
def is_victory( board, player )
  possibilities = []
  possibilities = possibilities + matrix_rows( board )
  possibilities = possibilities + matrix_columns( board )
  possibilities = possibilities + matrix_diagonals( board )

  size           = board.size
  player_has_won = false

  for row in possibilities
    if row.select { | cell | cell == player }.size == size
      player_has_won = true
    end
  end

  return player_has_won
end

=begin
  Given a board and a set of players, conduct a game of Tic-Tac-Toe till game ends.
  A game ends when there's a winner or when there's a tie - no more cells available.
  Returns the mark of the player who won or None in case of tie.
=end
def play( board, players )
  this_turn  = 0
  who_won    = nil
  game_ended = false

  while not game_ended
    show_board( board )
    play_turn( board, players[ this_turn ] )
    if    is_victory( board, players[ this_turn ] )
      puts 'Player ( ' + players[ this_turn ] + ' ) won. Congratulations!!!'
      who_won    = players[ this_turn ]
      game_ended = true
    elsif is_full( board )
      puts 'Game ended with a draw. Well done!'
      game_ended = true
    else
      this_turn = 1 - this_turn
    end
  end
  puts

  show_board( board )
  return who_won
end

=begin
  Asks user about playing another game and until the response
      is 'Y' or 'N' it continues asking.
  Returns True if response is 'Y', False if is 'N'
=end
def play_again
  response = nil

  while not [ 'Y', 'N' ].include?( response )
    print 'Play another game? [ Y / N ]: '
    response = gets.chomp.upcase
  end
  puts

  return response == 'Y'
end

=begin
  Given an initialized board it loops forever until user responds 'N' to play another game.
  Within the loop, each iteration cleans the board, waits for game result after calling play(),
      appends the result to the List of results and asks user about playing another game.
  Returns a List of results.
=end
def play_game( size, players_set )
  board        = init_board( size )
  players      = Array.new( players_set )
  results      = []
  keep_playing = true

  while keep_playing
    board       = clean_board( board )
    game_result = play( board, players )
    results.push( game_result )
    keep_playing   = play_again()
    shifted_player = players.shift
    players.push( shifted_player )
  end

  return results
end

=begin
  Given a List of results, it outputs the total number of games played,
      the total number of victories for mark 'O',
      the total number of victories for mark 'X',
      and the total number of drawns.
=end
def show_statistics( results, players )
  games_won = []
  for player in players
    games_won.push( results.select { | result | result == player }.size )
  end

  games_played = results.size
  games_tied   = games_played - games_won.inject { | sum, n | sum + n }

  puts 'Game Results:'
  puts "\tGames Played......... " + games_played.to_s
  players.each_with_index do | player, index |
    puts "\tPlayer ( " + player + ' ) won..... ' + games_won[ index ].to_s + ' times'
  end
  puts "\tGames Tied........... " + games_tied.to_s
  puts
end
