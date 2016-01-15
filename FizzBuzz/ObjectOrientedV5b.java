// Compile command: javac ObjectOrientedV5b.java
// Execute command: java ObjectOrientedV5b

import java.util.Iterator;
import java.util.List;
import java.util.ArrayList;

class PrimeWordCollection {

  private final List< PrimeWord > collection;

  public PrimeWordCollection() {
    final PrimeWord fizz = new PrimeWord( 3, "Fizz" );
    final PrimeWord buzz = new PrimeWord( 5, "Buzz" );
    final PrimeWord dazz = new PrimeWord( 7, "Dazz" );

    collection = new ArrayList< PrimeWord >();
    collection.add( fizz );
    collection.add( buzz );
    collection.add( dazz );
  }

  public Iterator getIterator() {
    return collection.iterator();
  }

}

public class ObjectOrientedV5b {

  public static void main( final String[] arguments ) {
    final PrimeWordCollection collection = new PrimeWordCollection();

    for ( int i = 1; i <= 100; i++ ) {
      String line = "";

      final Iterator iterator = collection.getIterator();
      while ( iterator.hasNext() ) {
        final PrimeWord item = ( PrimeWord ) iterator.next();
        line += item.say( i );
      }

      line += ( line.equals( "" ) ) ? String.format( "%04d", i ) : "";

      System.out.println( line );
    }
  }

}