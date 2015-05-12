#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'number_word.rb'

# http://nithinbekal.com/posts/ruby-decorators/
class Decorator < NumberWord

  @@words = []

  def initialize( prime, word, decoder )
    @prime   = prime
    @word    = word
    @decoder = decoder
  end

  def say( value )
    decode( value )
    result = @@words.join
    @@words.clear
    
    return result
  end

  def decode( value )
    @@words << @word if value % @prime == 0

    if @decoder.respond_to?( :decode ) then
      @decoder.decode( value )
    else
      @@words << @decoder.say( value ) if @@words.size == 0
    end
  end

end

if __FILE__ == $0
  instance  = NumberWord.new
  decorator = Decorator.new( 3, 'Fizz', instance )
  puts decorator.say( 15 )
end
