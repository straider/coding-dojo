#!/usr/bin/env python
# -*- coding: utf-8 -*-
# https://www.python.org/dev/peps/pep-0263/

import sys

if len( sys.argv ) - 1 == 0 :
  print( "Hello, World!" )
else :
  print( "Hello, " + sys.argv[ 1 ] + "!" )

print( "» José Carlos Monteiro «" )
