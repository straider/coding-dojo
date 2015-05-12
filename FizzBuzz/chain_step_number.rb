#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'chain_step.rb'

class ChainStepNumber < ChainStep

  def decode( value )
    @@words << '%04d' % value if @@words.size == 0
  end

end

if __FILE__ == $0
  step = ChainStepNumber.new
  puts step.say( 15 )
end
