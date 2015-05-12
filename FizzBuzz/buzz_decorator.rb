#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'number_word.rb'
require_relative 'decorator.rb'

class BuzzDecorator < Decorator

  def initialize( decoder )
    super( 5, 'Buzz', decoder )
  end

end

if __FILE__ == $0
  instance  = NumberWord.new
  decorator = BuzzDecorator.new( instance )
  puts decorator.say( 15 )
end
