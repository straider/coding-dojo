// Compile command: javac ObjectOrientedV1.java
// Execute command: java ObjectOrientedV1

public class ObjectOrientedV1 {

  public static void main( final String[] arguments ) {
    final PrimeWord fizz = new PrimeWord( 3, "Fizz" );
    final PrimeWord buzz = new PrimeWord( 5, "Buzz" );

    for ( int i = 1; i <= 100; i++ ) {
      String line = "";

      line += fizz.say( i );
      line += buzz.say( i );
      line += ( line.equals( "" ) ) ? String.format( "%04d", i ) : "";

      System.out.println( line );
    }
  }

}
