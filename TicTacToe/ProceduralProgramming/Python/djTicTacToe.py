#!/usr/bin/python
# -*- coding: utf-8 -*-
# "Defining Python Source Code Encodings":http://www.python.org/dev/peps/pep-0263/

from djGame import *

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

# "doctest - Test interactive Python examples":http://docs.python.org/library/doctest.html
# $> python -m doctest -v «script_name»

# "Running Doctest/Docutils":http://snipplr.com/view/8703/running-doctestdocutils/
if __name__ == '__main__' :
  import doctest
  doctest.testmod()

results = play_game( SIZE, players )
show_statistics( results, players )
