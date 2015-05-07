#!/usr/bin/env ruby

# Array.size() is not procedural: it's a method of the object Array.
if ARGV.size == 0 then
  name = 'World'
else
  name = ARGV[ 0 ]
end
puts "Hello, #{ name }!"

puts '» José Carlos Monteiro «'
