#!/usr/bin/env ruby
# encoding: utf-8

def count_lines( filename )
  count = 0
  File.open( filename, 'r' ) do | file |
    while ( chunk = file.sysread( 4096 ) )
      count += chunk.count( "\n" )
    end rescue EOFError
  end

  return count
end

if __FILE__ == $0
  puts count_lines( ARGV[ 0 ] );
end