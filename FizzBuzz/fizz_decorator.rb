#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'number_word.rb'
require_relative 'decorator.rb'

class FizzDecorator < Decorator

  def initialize( decoder )
    super( 3, 'Fizz', decoder )
  end

end

if __FILE__ == $0
  instance  = NumberWord.new
  decorator = FizzDecorator.new( instance )
  puts decorator.say( 15 )
end
