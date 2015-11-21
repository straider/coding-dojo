// Array.length is not procedural: it's a property of the object Array.
def name
if ( args.length != 0 ) {
  name = args[ 0 ]
}
name = name ?: 'World'
println "Hello, ${ name }!"

println '» José Carlos Monteiro «'
