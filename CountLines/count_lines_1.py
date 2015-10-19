#!/bin/env python
# -*- coding: utf-8 -*-

import sys

def count_lines( file_path ) :
  counter = 0

  with open( file_path, 'r' ) as file :
    for line in file :
      counter += 1

  return counter

if __name__ == '__main__' :

  import doctest
  doctest.testmod()

  print count_lines( sys.argv[ 1 ] )
