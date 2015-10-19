#!/bin/env python
# -*- coding: utf-8 -*-

import sys

def count_lines( file_path ) :
  counter = 0
  with open( file_path, 'r' ) as file :
    while True :
      buffer = file.read( 4096 )
      if buffer :
        counter += buffer.count( '\n' )
      else :
        break

  return counter

if __name__ == '__main__' :

  import doctest
  doctest.testmod()

  print count_lines( sys.argv[ 1 ] )
