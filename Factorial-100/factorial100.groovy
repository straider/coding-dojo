#!/bin/env groovy

BigInteger factorial( value ) {
  BigInteger result = 1

  for ( iteration = 1; iteration <= value; iteration++ ) {
    result = result.multiply( iteration )
  }

  return result
}

for ( i = 0; i <= 50000; i++ ) {
  for ( value = 0; value <= 100; value++ ) {
    BigInteger result = factorial( value )
    println result
  }
}
