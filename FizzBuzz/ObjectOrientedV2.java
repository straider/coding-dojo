// Compile command: javac ObjectOrientedV2.java
// Execute command: java ObjectOrientedV2

import java.util.List;
import java.util.LinkedList;

public class ObjectOrientedV2 {

  public static void main( final String[] arguments ) {
    final PrimeWord fizz = new PrimeWord( 3, "Fizz" );
    final PrimeWord buzz = new PrimeWord( 5, "Buzz" );

    final List< PrimeWord > collection = new LinkedList< PrimeWord >();
    collection.add( fizz );
    collection.add( buzz );

    for ( int i = 1; i <= 100; i++ ) {
      String line = "";

      for ( final PrimeWord item : collection ) {
        line += item.say( i );
      }

      line += ( line.equals( "" ) ) ? String.format( "%04d", i ) : "";

      System.out.println( line );
    }
  }

}