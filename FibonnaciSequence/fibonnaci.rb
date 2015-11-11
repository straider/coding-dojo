#!/bin/env ruby

def fibonnaci( value )
  sequence = []

  ( 0 .. value ).each do | number |
    if number <= 1
      sequence.push( number )
    else
      sequence.push( sequence[ -1 ] + sequence[ -2 ] )
    end
  end

  sequence
end

if __FILE__ == $0

  LIMIT = 44

  sequence = []
  for i in 0 .. 25_000
    # sequence += fibonnaci( LIMIT )
    sequence.push( *( fibonnaci( LIMIT ) ) )
  end

  sequence.each_with_index do | value, index |
    puts '%02d: %9d' % [ index % ( LIMIT + 1 ), value ]
  end

end