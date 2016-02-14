#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys

top_folder = os.path.dirname( sys.path[ 0 ] )
sys.path.append( os.path.join( top_folder, 'include', 'libpython' ) )

import optparse

import game_controller

VERSION = 'v1.00.00'
PROGRAM = sys.argv[ 0 ]

if __name__ == '__main__' :
  parser = optparse.OptionParser( usage   = '%prog [ -r|--rows ROWS ] [ -c|--columns COLUMNS ]'
                                , version = 'HitOrMiss - Procedural {0}'.format( VERSION )
                                )
  parser.add_option( '-r', '--rows'   , action = 'store', dest = 'rows'   , type = 'int', help = 'set number of rows ( default is 3 )'    )
  parser.add_option( '-c', '--columns', action = 'store', dest = 'columns', type = 'int', help = 'set number of columns ( default is 3 )' )

  options, remainder = parser.parse_args()

  number_of_rows    = options.rows    if options.rows    else 3
  number_of_columns = options.columns if options.columns else 3

  game_controller.play_game( number_of_rows, number_of_columns )
