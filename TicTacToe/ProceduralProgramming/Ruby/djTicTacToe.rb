#!/usr/bin/ruby -wKU
# encoding: utf-8

require 'djGame'

# Constants
#---------------------------------------

SIZE    = 3                             # Should be set by configuration or by command-line option...
PIECE_O = 'O'
PIECE_X = 'X'


# Variables
#---------------------------------------

players = [ PIECE_O, PIECE_X ]          # This should be built dynamically...
results = []


# Routines
#---------------------------------------


# Main Code
#---------------------------------------

results = play_game( SIZE, players )
show_statistics( results, players )
