package main

import (
  "fmt"
  "os"
)

func main() {
  var name string;
  if len( os.Args[ 1: ] ) == 0 {
    name = "World"
  } else {
    name = os.Args[ 1 ]
  }
  fmt.Println( "Hello, " + name + "!" )

  fmt.Println( "» José Carlos Monteiro «" )
}
