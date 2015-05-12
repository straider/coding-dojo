#!/usr/bin/env ruby
# encoding: utf-8

PRIME_WORDS = { 3 => 'Fizz', 5 => 'Buzz' }

for i in 1 .. 100 do
  line = ''
  PRIME_WORDS.each do | key, value |
    line += value if ( i % key ) == 0
  end
  line += ( line  == '' ) ? '%04d' % i : ''

  puts line
end
