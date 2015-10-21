#!/bin/env groovy

BUFFER_SIZE = 8 * 1024

int count_lines( filename ) {
  lines = 0

  InputStream stream = new BufferedInputStream( new FileInputStream( filename ) );
  byte[]      buffer = new byte[ BUFFER_SIZE ];

  hasCharacters = false;

  bytes = 0;
  while ( ( bytes = stream.read( buffer ) ) != -1 ) {
    for ( i = 0; i < bytes; i++ ) {
      if ( buffer[ i ] == '\n' ) {
        lines++;
      }
    }
    hasCharacters = buffer[ bytes - 1 ] != '\n';
  }
  if ( hasCharacters ) {
    lines++;
  }

  stream.close();

  return lines;
}

println count_lines( args[ 0 ] );
