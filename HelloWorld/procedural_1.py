#!/usr/bin/env python
# -*- coding: utf-8 -*-
# https://www.python.org/dev/peps/pep-0263/

# Must import module "sys" to handle command line arguments ( which is not procedural ).
import sys

if __name__ == '__main__' :

  if len( sys.argv ) - 1 == 0 :
    name = 'World'
  else :
    name = sys.argv[ 1 ]
  print( 'Hello, %(name)s!' % { 'name' : name } )

  print( '» José Carlos Monteiro «' )
