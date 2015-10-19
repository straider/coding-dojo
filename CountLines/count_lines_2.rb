#!/usr/bin/env ruby
# encoding: utf-8

def count_lines( filename )
  count = 0
  File.open( filename, 'r' ) do | file |
    count += 1 while file.gets
  end

  return count
end

if __FILE__ == $0
  puts count_lines( ARGV[ 0 ] );
end