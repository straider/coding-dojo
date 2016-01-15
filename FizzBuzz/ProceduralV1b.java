// Compile command: javac ProceduralV1b.java
// Execute command: java ProceduralV1b

public class ProceduralV1b {

  public static void main( final String[] arguments ) {
    for ( int i = 1; i <= 100; i++ ) {
      final String line;

      if ( i % 3 == 0 && i % 5 == 0 && i % 7 == 0 ) {
        line = "FizzBuzzDazz";
      } else if ( i % 5 == 0 && i % 7 == 0 ) {
        line = "BuzzDazz";
      } else if ( i % 3 == 0 && i % 7 == 0 ) {
        line = "FizzDazz";
      } else if ( i % 3 == 0 && i % 5 == 0 ) {
        line = "FizzBuzz";
      } else if ( i % 7 == 0 ) {
        line = "Dazz";
      } else if ( i % 5 == 0 ) {
        line = "Buzz";
      } else if ( i % 3 == 0 ) {
        line = "Fizz";
      } else {
        line = String.format( "%04d", i ); // String.format() is not procedural: it's a method of the object String.
      }

      System.out.println( line );
    }
  }

}