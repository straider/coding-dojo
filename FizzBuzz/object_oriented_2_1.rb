#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'prime_word.rb'

if __FILE__ == $0
  prime_words = []
  prime_words << PrimeWord.new( 3, 'Fizz' )
  prime_words << PrimeWord.new( 5, 'Buzz' )

  for i in 1 .. 100 do
    line = ''
    prime_words.each do | instance |
      line += instance.say( i)
    end
    line += ( line  == '' ) ? '%04d' % i : ''

    puts line
  end
end
