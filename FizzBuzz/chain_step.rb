#!/usr/bin/env ruby
# encoding: utf-8

class ChainStep

  @@words = []

  def link( step = nil )
    @next_step = step
  end

  def say( value )
    decode( value )
    result = @@words.join
    @@words.clear

    return result
  end

end

if __FILE__ == $0
  instance = ChainStep.new
  puts instance.say( 15 )
end
