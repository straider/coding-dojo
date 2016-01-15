#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'number_word.rb'
require_relative 'decorator.rb'

class DazzDecorator < Decorator

  def initialize( decoder )
    super( 7, 'Dazz', decoder )
  end

end

if __FILE__ == $0
  instance  = NumberWord.new
  decorator = DazzDecorator.new( instance )
  puts decorator.say( 7 )
end
