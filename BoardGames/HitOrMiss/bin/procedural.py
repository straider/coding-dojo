#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys

top_folder = os.path.dirname( sys.path[ 0 ] )
sys.path.append( os.path.join( top_folder, 'include', 'libpython' ) )

import game_controller

# getopt standard
# getopt long

if __name__ == '__main__' :
  game_controller.play_game( 1, 1 )
