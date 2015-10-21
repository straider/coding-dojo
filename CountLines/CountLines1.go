package main

import (
  "fmt"
  "os"
  "bufio"
)

const
  BUFFER_SIZE = 8 * 1024

// http://stackoverflow.com/a/24563853/5086987
func CountLines( filename string ) int {
  lines := 0

  file, err := os.Open( filename )
  if err == nil {
    reader  := bufio.NewReader( file )
    scanner := bufio.NewScanner( reader )

    defer file.Close()

    for scanner.Scan() {
      lines += 1
    }
  }

  return lines
}

func main() {
  fmt.Println( CountLines( os.Args[ 1 ] ) )
}
