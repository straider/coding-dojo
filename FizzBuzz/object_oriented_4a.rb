#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'chain_of_responsibility.rb'

if __FILE__ == $0
  chain = ChainOfReponsibility.new

  for i in 1 .. 100 do
    line = chain.say( i )

    puts line
  end
end
