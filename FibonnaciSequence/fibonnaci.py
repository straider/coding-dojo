#!/bin/env python

def fibonnaci( value ) :
  sequence = []

  for number in range( 0, value + 1 ) :
    if number <= 1 :
      sequence.append( number )
    else :
      sequence.append( sequence[ -1 ] + sequence[ -2 ] )

  return sequence

if __name__ == '__main__' :

  LIMIT = 44

  sequence = []
  for i in range( 0, 25000 + 1 ) :
    sequence += fibonnaci( LIMIT )
    # sequence.extend( fibonnaci( LIMIT ) )

  index = 0
  for value in sequence :
    print '%02d: %9d' % ( index % ( LIMIT + 1 ), value )
    index += 1
