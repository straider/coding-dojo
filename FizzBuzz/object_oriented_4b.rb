#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'chain_step_number.rb'
require_relative 'chain_step_word.rb'

class ChainOfReponsibility

  def initialize()
    @fizz_step  = ChainStepWord.new( 3, 'Fizz' )
    @buzz_step  = ChainStepWord.new( 5, 'Buzz' )
    @dazz_step  = ChainStepWord.new( 7, 'Dazz' )
    @final_step = ChainStepNumber.new

    @fizz_step.link( @buzz_step  )
    @buzz_step.link( @dazz_step  )
    @dazz_step.link( @final_step )
  end

  def say( value )
    @fizz_step.say( value )
  end

end

if __FILE__ == $0
  chain = ChainOfReponsibility.new

  for i in 1 .. 100 do
    line = chain.say( i )

    puts line
  end
end
