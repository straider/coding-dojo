// Compile command: javac ProceduralV1a.java
// Execute command: java ProceduralV1a

public class ProceduralV1a {

  public static void main( final String[] arguments ) {
    for ( int i = 1; i <= 100; i++ ) {
      final String line;

      if ( i % 3 == 0 && i % 5 == 0 ) {
        line = "FizzBuzz";
      } else if ( i % 3 == 0 ) {
        line = "Fizz";
      } else if ( i % 5 == 0 ) {
        line = "Buzz";
      } else {
        line = String.format( "%04d", i ); // String.format() is not procedural: it's a method of the object String.
      }

      System.out.println( line );
    }
  }

}