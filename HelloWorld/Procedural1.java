// Compile command: javac -encoding "UTF-8" Procedural1.java
// Execute commands:
//   java -Dfile.encoding="UTF-8" Procedural1
//   java -Dfile.encoding="UTF-8" Procedural1 "José Carlos Monteiro"
//   java -Dfile.encoding="UTF-8" Procedural1 Universe

public class Procedural1 {

  public static void main( final String[] arguments ) {
    final String name = ( arguments.length == 0 ) ? "World" : arguments[ 0 ]; // Array.length is not procedural: it's a property of the object Array.
    System.out.printf( "Hello, %s!\n", name );

    System.out.println( "» José Carlos Monteiro «" );
  }

}