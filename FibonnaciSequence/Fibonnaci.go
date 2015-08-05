package main

import "fmt"

func fibonnaci( value int ) []int {
  var sequence []int

  for number := 0; number <= value; number++ {
    if number <= 1 {
      sequence = append( sequence, number )
    } else {
      length := len( sequence )
      sequence = append( sequence, sequence[ length - 1 ] + sequence[ length - 2 ] )
    }
  }

  return sequence
}

func main() {
  const LIMIT int = 44

  var sequence []int

  for value := 0; value <= 25000; value++ {
    result := fibonnaci( LIMIT )
    sequence = append( sequence, result... )
  }

  for index, value := range sequence {
    fmt.Println( fmt.Sprintf( "%02d: %9d", index % ( LIMIT + 1 ), value ) )
  }

}
