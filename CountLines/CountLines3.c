#include <stdio.h>
#include <string.h>

// http://stackoverflow.com/a/4278920/5086987

#define BUFFER_SIZE 8192

int countlines( char *filename ) {
  int lines = 0;

  FILE *file = fopen( filename, "r" );
  if ( file != NULL ) {
    char  buffer[ BUFFER_SIZE + 1 ];
    char* pointer;
    int   bytes;
    while ( ! feof( file ) ) {
      bytes = fread( buffer, sizeof( char ), BUFFER_SIZE, file );
      if ( bytes <= 0 ) {
        break;
      }

      buffer[ bytes ] = '\0';
      for ( pointer = buffer; pointer; pointer = strchr( pointer, '\n' ) ) {
        lines++;
        ++pointer;
      }
    }

    fclose( file );
  }

  return lines;
}

int main( int argc, char *argv[] ) {
  printf( "%d\n", countlines( argv[ 1 ] ) );
}
