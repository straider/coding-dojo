// Compile command: javac -encoding "UTF-8" Procedural.java
// Execute commands:
//   java -Dfile.encoding="UTF-8" Procedural
//   java -Dfile.encoding="UTF-8" Procedural "José Carlos Monteiro"
//   java -Dfile.encoding="UTF-8" Procedural Universe

public class Procedural {

  public static void main( final String[] arguments ) {
    if ( arguments.length == 0 ) {
      System.out.println( "Hello, World!" );
    } else {
      final String name = arguments[ 0 ];
      System.out.println( "Hello, " + name + "!" );
    }

    System.out.println( "» José Carlos Monteiro «" );
  }

}