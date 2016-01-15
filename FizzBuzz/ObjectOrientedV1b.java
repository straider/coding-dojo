// Compile command: javac ObjectOrientedV1b.java
// Execute command: java ObjectOrientedV1b

public class ObjectOrientedV1b {

  public static void main( final String[] arguments ) {
    final PrimeWord fizz = new PrimeWord( 3, "Fizz" );
    final PrimeWord buzz = new PrimeWord( 5, "Buzz" );
    final PrimeWord dazz = new PrimeWord( 7, "Dazz" );

    for ( int i = 1; i <= 100; i++ ) {
      String line = "";

      line += fizz.say( i );
      line += buzz.say( i );
      line += dazz.say( i );
      line += ( line.equals( "" ) ) ? String.format( "%04d", i ) : "";

      System.out.println( line );
    }
  }

}
