#!/usr/bin/ruby -wKU
# encoding: utf-8

require 'djGame'

# Constants
#---------------------------------------

PIECE_O = 'O'
PIECE_X = 'X'


# Variables
#---------------------------------------

size    = 3                             # Should be set by configuration or by command-line option...
players = [ PIECE_O, PIECE_X ]          # This should be built dynamically...
game    = Game.new( players, size )
results = []


# Routines
#---------------------------------------

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
  Given the initial game state ( board and a set of players ), loop forever
      until user responds 'N' to play another game.
  Within the loop, each iteration:
      cleans the board;
      waits for game result of playing one game between those players;
      appends the result to the List of results;
      and asks user about playing another game.
  Returns a List of results.
=end
def play_game( game)
  results      = []
  keep_playing = true

  while keep_playing
    game_result = game.play()
    results.push( game_result )
    keep_playing = play_again()
    game.restart()
  end

  return results
end

=begin
  Given a List of results and a set of players, it outputs the total number of games played,
      the total number of victories for each player,
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


# Main Code
#---------------------------------------

results = play_game( game )
show_statistics( results, players )
