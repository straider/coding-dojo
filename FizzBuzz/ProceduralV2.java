// Compile command: javac ProceduralV2.java
// Execute command: java ProceduralV2

public class ProceduralV2 {

  public static void main( final String[] arguments ) {
    for ( int i = 1; i <= 100; i++ ) {
      final String value = String.format( "%04d", i );

      String line = "";
      line += ( i % 3 == 0 ) ? "Fizz" : "";
      line += ( i % 5 == 0 ) ? "Buzz" : "";
      line += ( line.equals( "" ) ) ? value : "";

      System.out.println( line );
    }
  }

}