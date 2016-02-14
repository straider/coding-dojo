#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys

top_folder = os.path.dirname( sys.path[ 0 ] )
sys.path.append( os.path.join( top_folder, 'include', 'libpython' ) )

import argparse

import game_controller

VERSION = 'v1.00.00'

def show_version() :
  print 'HitOrMiss - Procedural {0}'.format( VERSION )
  sys.exit( 0 )

if __name__ == '__main__' :
  parser = argparse.ArgumentParser( usage = '%(prog)s [ -r|--rows ROWS ] [ -c|--columns COLUMNS ] [ -v|--version ]' )
  parser.add_argument( '-r', '--rows'   , action = 'store'     , dest = 'rows'   , type = int, help = 'set number of rows ( default is 3 )'    )
  parser.add_argument( '-c', '--columns', action = 'store'     , dest = 'columns', type = int, help = 'set number of columns ( default is 3 )' )
  parser.add_argument( '-v', '--version', action = 'store_true', dest = 'version'            , help = 'show program information and exit'      )

  arguments = parser.parse_args()

  if arguments.version :
    show_version()

  number_of_rows    = arguments.rows    if arguments.rows    else 3
  number_of_columns = arguments.columns if arguments.columns else 3

  game_controller.play_game( number_of_rows, number_of_columns )
