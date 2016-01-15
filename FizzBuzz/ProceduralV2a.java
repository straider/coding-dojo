// Compile command: javac ProceduralV2a.java
// Execute command: java ProceduralV2a

public class ProceduralV2a {

  public static void main( final String[] arguments ) {
    for ( int i = 1; i <= 100; i++ ) {
      final String value = String.format( "%04d", i ); // String.format() is not procedural: it's a method of the object String.

      String line = "";
      line += ( i % 3 == 0 ) ? "Fizz" : "";
      line += ( i % 5 == 0 ) ? "Buzz" : "";
      line += ( line.equals( "" ) ) ? value : "";

      System.out.println( line );
    }
  }

}