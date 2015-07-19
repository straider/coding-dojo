#!/bin/env ruby

def factorial( value )
  result = 1
  for iteration in 1 .. value
    result = result * iteration
  end

  return result
end

if __FILE__ == $0

  for i in 0 .. 50_000
    for value in 0 .. 100
      result = factorial( value )
      puts result
    end
  end

end