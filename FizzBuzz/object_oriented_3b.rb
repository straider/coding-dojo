#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'number_word.rb'
require_relative 'decorator.rb'
require_relative 'fizz_decorator.rb'
require_relative 'buzz_decorator.rb'
require_relative 'dazz_decorator.rb'

if __FILE__ == $0
  decoder = NumberWord.new
  dazz    = DazzDecorator.new( decoder )
  buzz    = BuzzDecorator.new( dazz    )
  fizz    = FizzDecorator.new( buzz    )

  for i in 1 .. 100 do
    line = fizz.say( i )

    puts line
  end
end
