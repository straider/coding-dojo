#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'prime_word.rb'

if __FILE__ == $0
  fizz = PrimeWord.new( 3, 'Fizz' )
  buzz = PrimeWord.new( 5, 'Buzz' )
  dazz = PrimeWord.new( 7, 'Dazz' )

  for i in 1 .. 100 do
    line = ''
    line += fizz.say( i )
    line += buzz.say( i )
    line += dazz.say( i )
    line += ( line  == '' ) ? '%04d' % i : ''

    puts line
  end
end
