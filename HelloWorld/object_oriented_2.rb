#!/usr/bin/env ruby
# encoding: utf-8

class Greeter

  def initialize( name = 'World' )
    @name = name
  end

  def say()
    @name
  end

end

if ARGV.size != 0 then
  greeter = Greeter.new( ARGV[ 0 ] )
end
greeter ||= Greeter.new
puts "Hello, #{ greeter.say() }!"

puts '» José Carlos Monteiro «'
