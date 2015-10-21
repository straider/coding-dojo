package main

import (
  "fmt"
  "os"
  "io"
  "bufio"
  "bytes"
)

const
  BUFFER_SIZE = 8 * 1024

// http://stackoverflow.com/a/24563853/5086987
func CountLines( filename string ) int {
  lines := 0

  hasCharacters := false

  file, err := os.Open( filename )
  if err == nil {
    newLine := []byte{'\n'}
    buffer  := make( []byte, BUFFER_SIZE )
    reader  := bufio.NewReader( file )

    defer file.Close()

    for {
      size, err := reader.Read( buffer )
      if err != nil && err != io.EOF {
        return 0
      }

      lines += bytes.Count( buffer[ : size ], newLine )

      if err == io.EOF {
        break
      }

      hasCharacters = buffer[ size - 1 ] != '\n';
    }

    if hasCharacters {
      lines += 1
    }
  }

  return lines
}

func main() {
  fmt.Println( CountLines( os.Args[ 1 ] ) )
}
