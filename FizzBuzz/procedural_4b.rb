#!/usr/bin/env ruby
# encoding: utf-8

1.upto( 100 ) do | i |
  result = ''
  result << 'Fizz' if ( i % 3 ) == 0
  result << 'Buzz' if ( i % 5 ) == 0
  result << 'Dazz' if ( i % 7 ) == 0
  puts ( result == '' ? '%04d' % i : result )
end
