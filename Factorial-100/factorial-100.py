#!/bin/env python

def factorial( value ) :
  result = long( 1 )
  for iteration in range( 1, value + 1 ) :
    result = result * iteration

  return result

if __name__ == '__main__' :

  for i in range( 0, 50000 + 1 ) :
    for value in range( 0, 100 + 1 ) :
       result = factorial( value )
       print result
