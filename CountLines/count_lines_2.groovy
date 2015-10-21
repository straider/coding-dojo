#!/bin/env groovy

int count_lines( filename ) {
  file = new File( filename )
  st   = new StreamTokenizer( file.newReader() )
  while ( st.nextToken() != StreamTokenizer.TT_EOF ) {
  }

  return st.lineno()
}

println count_lines( args[ 0 ] );
