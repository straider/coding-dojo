#!/bin/env groovy

long factorial( value ) {
  long result = 1

  for ( iteration = 1; iteration <= value; iteration++ ) {
    result = result * iteration
  }

  return result
}

for ( i = 0; i <= 50000; i++ ) {
  for ( value = 0; value <= 100; value++ ) {
    long result = factorial( value )
    println result
  }
}
