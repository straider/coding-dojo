#!/usr/bin/env ruby
# encoding: utf-8

def count_lines( filename )
  File.foreach( filename ) do
  end
  count = $.
end

if __FILE__ == $0
  puts count_lines( ARGV[ 0 ] );
end