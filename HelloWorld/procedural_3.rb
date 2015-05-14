#!/usr/bin/env ruby
# encoding: utf-8

MESSAGE = 'Hello, %s!'

def greet( message, name = 'World' )
  message % name
end

# Array.size() is not procedural: it's a method of the object Array.
if ARGV.size != 0 then
  greeting = greet( MESSAGE, name = ARGV[ 0 ] )
else
  greeting = greet( MESSAGE )
end
puts greeting

puts '» José Carlos Monteiro «'
