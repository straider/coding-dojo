#!/usr/bin/env ruby
# encoding: utf-8

for i in 1 .. 100 do
  if i % 3 == 0 and i % 5 == 0 then
    line = 'FizzBuzz'
  elsif i % 5 == 0 then
    line = 'Buzz'
  elsif i % 3 == 0 then
    line = 'Fizz'
  else
    line = '%04d' % i
  end

  puts line
end
