#!/usr/bin/env ruby
# encoding: utf-8

class PrimeWord

  def initialize( prime, word )
    @prime = prime
    @word  = word
  end

  def say( value )
    value % @prime == 0 ? @word : ''
  end

end

if __FILE__ == $0
  instance = PrimeWord.new( 3, 'Fizz' )
  puts instance.say( 15 )
end
