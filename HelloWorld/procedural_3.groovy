def MESSAGE = "Hello, %s!"

def String greet( String message, String name = 'World' ) {
  return String.format( message, name ) // String.format is not procedural: it's a method of the object String.
}

// Array.length is not procedural: it's a property of the object Array.
greeting = ( args.length != 0 ) ? greet( MESSAGE, args[ 0 ] ) : greet( MESSAGE )
println greeting

println '» José Carlos Monteiro «'
