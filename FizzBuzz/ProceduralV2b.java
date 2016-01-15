// Compile command: javac ProceduralV2b.java
// Execute command: java ProceduralV2b

public class ProceduralV2b {

  public static void main( final String[] arguments ) {
    for ( int i = 1; i <= 100; i++ ) {
      final String value = String.format( "%04d", i ); // String.format() is not procedural: it's a method of the object String.

      String line = "";
      line += ( i % 3 == 0 ) ? "Fizz" : "";
      line += ( i % 5 == 0 ) ? "Buzz" : "";
      line += ( i % 7 == 0 ) ? "Dazz" : "";
      line += ( line.equals( "" ) ) ? value : "";

      System.out.println( line );
    }
  }

}