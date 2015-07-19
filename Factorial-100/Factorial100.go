package main

import "fmt"

func factorial( value int ) int64 {
  var result int64 = 1

  for iteration := 1; iteration <= value; iteration++ {
    result = result * int64( iteration )
  }

  return result
}

func main() {
  var result int64

  for value := 0; value <= 50000; value++ {
    for value := 0; value <= 100; value++ {
      result = factorial( value )
      fmt.Println( result )
    }
  }
}
