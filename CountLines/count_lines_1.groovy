#!/bin/env groovy

int count_lines( filename ) {
  file = new File( filename )
  count = 0
  file.eachLine {
    count++
  }
  return count
}

println count_lines( args[ 0 ] );
