package main

import (
  "fmt"
  "math/big"
)

func factorial( value int ) big.Int {
  var result *big.Int = big.NewInt( 1 )

  for iteration := 1; iteration <= value; iteration++ {
    result = result.Mul( result, big.NewInt( int64( iteration ) ) )
  }

  return *result
}

func main() {
  var result big.Int

  for value := 0; value <= 50000; value++ {
    for value := 0; value <= 100; value++ {
      result = factorial( value )
      fmt.Println( result.String() )
    }
  }
}
