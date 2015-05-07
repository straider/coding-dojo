// Compile command: javac -encoding "UTF-8" Procedural.java
// Execute commands:
//   java -Dfile.encoding="UTF-8" Procedural
//   java -Dfile.encoding="UTF-8" Procedural "José Carlos Monteiro"
//   java -Dfile.encoding="UTF-8" Procedural Universe

public class Procedural {

  public static void main( final String[] arguments ) {
    final String name = ( arguments.length == 0 ) ? "World" : arguments[ 0 ]; // Array.length is not procedural: it's a property of the object Array.
    System.out.printf( "Hello, %s!\n", name );

    System.out.println( "» José Carlos Monteiro «" );
  }

}