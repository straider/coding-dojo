#include <stdio.h>
#include <stdlib.h>

// http://stackoverflow.com/a/4278875/5086987
int countlines( char *filename ) {
  int lines = 0;

  FILE *file = fopen( filename, "r" );
  if ( file != NULL ) {
    while ( EOF != ( scanf( "%*[^\n]" ), scanf( "%*c" ) ) ) {
      lines++;
    }

    fclose( file );
  }

  return lines;
}

void main( int argc, char *argv[] ) {
  printf( "%d\n", countlines( argv[ 1 ] ) );
}
