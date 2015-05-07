#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys

class Greeter :

  def __init__( self, name = 'World' ) :
    self.name = name

  def say( self ) :
    return self.name

if __name__ == "__main__" :

  if len( sys.argv ) - 1 == 0 :
    greeter = Greeter()
  else :
    greeter = Greeter( sys.argv[ 1 ] )
  print( "Hello, " + greeter.say() + "!" )

  print( "» José Carlos Monteiro «" )
