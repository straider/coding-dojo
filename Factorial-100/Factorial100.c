#include <stdio.h>

long long factorial( int value ) {
  long long result = 1;

  for ( int iteration = 1; iteration <= value; iteration++ ) {
    result = result * iteration;
  }

  return result;
}

int main( int argc, char **argv ) {
  for ( int i = 0; i <= 50000; i++ ) {
    for ( int value = 0; value <= 100; value++ ) {
      long long result = factorial( value );
      printf( "%lld\n", result );
    }
  }
}
