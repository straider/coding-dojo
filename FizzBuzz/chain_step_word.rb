#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'chain_step.rb'

class ChainStepWord < ChainStep

  def initialize( prime, word )
    @prime = prime
    @word  = word
  end

  def decode( value )
    @@words << @word if value % @prime == 0
    @next_step.decode( value )
  end

end

if __FILE__ == $0
  step = ChainStepWord.new( 3, 'Fizz' )
  puts step.say( 15 )
end
