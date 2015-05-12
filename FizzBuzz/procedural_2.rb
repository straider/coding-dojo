#!/usr/bin/env ruby
# encoding: utf-8

for i in 1 .. 100 do
  line = ''
  line += ( i % 3 == 0  ) ? 'Fizz'     : ''
  line += ( i % 5 == 0  ) ? 'Buzz'     : ''
  line += ( line  == '' ) ? '%04d' % i : ''

  puts line
end
