#include <stdio.h>

// http://stackoverflow.com/a/12733630/5086987
int countlines( char *filename ) {
  int lines = 0;

  FILE *file = fopen( filename, "r" );
  if ( file != NULL ) {
    int character = 0;
    while ( ! feof( file ) ) {
      character = fgetc( file );
      if ( character == '\n' ) {
        lines++;
      }
    }

    fclose( file );
  }

  return lines;
}

int main( int argc, char *argv[] ) {
  printf( "%d\n", countlines( argv[ 1 ] ) );
}
