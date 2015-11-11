#!/bin/env groovy

List< Integer > fibonnaci( value ) {
  def sequence = []

  for ( number in 0 .. value ) {
    if ( number <= 1 ) {
      sequence << number
    } else {
      sequence << ( sequence[ -1 ] + sequence[ -2 ] )
    }
  }

  sequence
}

LIMIT = 44

def sequence = []
for ( i in 0 .. 25000 ) {
  // sequence += fibonnaci( LIMIT )
  sequence.addAll( fibonnaci( LIMIT ) )
}

sequence.eachWithIndex { value, index ->
  println String.format( "%02d: %9d", index % ( LIMIT + 1 ), value )
}
