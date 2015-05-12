#!/usr/bin/env ruby
# encoding: utf-8

class NumberWord

  def say( value )
    '%04d' % value
  end

end

if __FILE__ == $0
  instance = NumberWord.new
  puts instance.say( 15 )
end
