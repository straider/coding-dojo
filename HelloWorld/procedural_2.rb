#!/usr/bin/env ruby
# encoding: utf-8

# Array.size() is not procedural: it's a method of the object Array.
if ARGV.size != 0 then
  name = ARGV[ 0 ]
end
name ||= 'World'
puts "Hello, #{ name }!"

puts '» José Carlos Monteiro «'
