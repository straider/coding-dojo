#!/usr/bin/env python
# -*- coding: utf-8 -*-
# https://www.python.org/dev/peps/pep-0263/

# Must import module "sys" to handle command line arguments ( which is not procedural ).
import sys

MESSAGE = 'Hello, %(name)s!'

def greet( message, name = 'World' ) :
  message % { 'name' : name }

if __name__ == '__main__' :

  greeting = greet( MESSAGE, sys.argv[ 1 ] ) if len( sys.argv ) - 1 != 0 else greet( MESSAGE )
  print( greeting )

  print( '» José Carlos Monteiro «' )
