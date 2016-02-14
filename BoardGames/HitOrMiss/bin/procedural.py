#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys

top_folder = os.path.dirname( sys.path[ 0 ] )
sys.path.append( os.path.join( top_folder, 'include', 'libpython' ) )

import getopt

import game_controller

VERSION = 'v1.00.00'
PROGRAM = sys.argv[ 0 ]

def show_usage( exit_code = 0 ) :
  print '{0} -r|--rows NUMBER_OF_ROWS -c|--columns NUMBER_OF_COLUMNS\n'.format( PROGRAM )
  print '\t -r|--rows NUMBER_OF_ROWS: set the number of rows ( default is 3 )'
  print '\t -c|--columns NUMBER_OF_COLUMNS: set the number of columns ( default is 3 )'
  sys.exit( exit_code )

def show_version() :
  print 'HitOrMiss - Procedural {0}'.format( VERSION )
  sys.exit( 0 )

if __name__ == '__main__' :
  number_of_rows    = 3
  number_of_columns = 3

  try:
    opts, args = getopt.getopt( sys.argv[ 1 : ], 'hvr:c:', [ 'help', 'version', 'rows=', 'columns=' ] )
  except getopt.GetoptError :
    show_usage( -1 )
  for opt, arg in opts :
    if   opt in ( '-h', '--help'    ) :
      show_usage()
    elif opt in ( '-v', '--version' ) :
      show_version()
    elif opt in ( '-r', '--rows'    ) :
      number_of_rows = arg
    elif opt in ( '-c', '--columns' ) :
      number_of_columns = arg

  game_controller.play_game( number_of_rows, number_of_columns )
