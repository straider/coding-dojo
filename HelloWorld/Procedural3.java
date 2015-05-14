// Compile command: javac -encoding "UTF-8" Procedural3.java
// Execute commands:
//   java -Dfile.encoding="UTF-8" Procedural3
//   java -Dfile.encoding="UTF-8" Procedural3 "José Carlos Monteiro"
//   java -Dfile.encoding="UTF-8" Procedural3 Universe

public class Procedural3 {

  private static final String MESSAGE = "Hello, %s!\n";

  private static String greet( final String message, final String name ) {
    return String.format( message, name );
  }

  private static String greet( final String message ) {
    return greet( message, "World" );
  }

  public static void main( final String[] arguments ) {
    final String greeting = ( arguments.length == 0 ) ? greet( MESSAGE ) : greet( MESSAGE, arguments[ 0 ] ); // Array.length is not procedural: it's a property of the object Array.
    System.out.printf( greeting );

    System.out.println( "» José Carlos Monteiro «" );
  }

}