// Compile command: javac ObjectOrientedV2b.java
// Execute command: java ObjectOrientedV2b

import java.util.List;
import java.util.ArrayList;

public class ObjectOrientedV2b {

  public static void main( final String[] arguments ) {
    final PrimeWord fizz = new PrimeWord( 3, "Fizz" );
    final PrimeWord buzz = new PrimeWord( 5, "Buzz" );
    final PrimeWord dazz = new PrimeWord( 7, "Dazz" );

    final List< PrimeWord > collection = new ArrayList< PrimeWord >();
    collection.add( fizz );
    collection.add( buzz );
    collection.add( dazz );

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