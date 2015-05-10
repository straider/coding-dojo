package main

import (
  "fmt"
  "os"
)

const message string = "Hello, %s!\n"

type Greeter struct {
  name string
}

func ( g * Greeter ) say() string {
  return g.name
}

func main() {
  var greeter Greeter
  if len( os.Args[ 1: ] ) == 0 {
    greeter = Greeter{ name: "World" }
  } else {
    greeter = Greeter{ name: os.Args[ 1 ] }
  }
  fmt.Printf( message, greeter.say()  )

  fmt.Println( "» José Carlos Monteiro «" )
}
