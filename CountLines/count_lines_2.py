#!/bin/env python
# -*- coding: utf-8 -*-

import sys

def count_lines( file_path ) :
  with open( file_path, 'r' ) as file :
    counter = sum( 1 for _ in file )

  return counter

if __name__ == '__main__' :

  import doctest
  doctest.testmod()

  print count_lines( sys.argv[ 1 ] )
