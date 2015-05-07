#!/usr/bin/env ruby

class Greeter

  def initialize( name = 'World' )
    @name = name
  end

  def say()
    @name
  end

end

if ARGV.size == 0 then
  greeter = Greeter.new
else
  greeter = Greeter.new( ARGV[ 0 ] )
end
puts "Hello, #{ greeter.say() }!"

puts '» José Carlos Monteiro «'
