#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'prime_word.rb'

PRIME_WORDS = { 3 => 'Fizz', 5 => 'Buzz' }

if __FILE__ == $0
  prime_words = []
  PRIME_WORDS.keys.sort.each do | key |
    value = PRIME_WORDS[ key ]
    prime_words << PrimeWord.new( key, value )
  end

  for i in 1 .. 100 do
    line = ''
    prime_words.each do | instance |
      line += instance.say( i)
    end
    line += ( line  == '' ) ? '%04d' % i : ''

    puts line
  end
end
