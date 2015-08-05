import java.util.List;
import java.util.ArrayList;

public class Fibonnaci {

  private static List< Integer > fibonnaci( int value ) {
    final List< Integer > sequence = new ArrayList< Integer >();

    for ( int number = 0; number <= value ; number++ ) {
      if ( number <= 1 ) {
        sequence.add( number );
      } else {
        final int length = sequence.size();
        sequence.add( sequence.get( length - 1 ) + sequence.get( length - 2 ) );
      }
    }

    return sequence;
  }

  private static final int LIMIT = 44;

  public static void main( String[] arguments ) {
    final List< Integer > sequence = new ArrayList< Integer >();
    for ( int i = 0; i <= 25000; i++ ) {
      sequence.addAll( fibonnaci( LIMIT ) );
    }

    for ( int index = 0; index < sequence.size(); index++ ) {
      final int value = sequence.get( index );
      System.out.println( String.format( "%02d: %9d", index % ( LIMIT + 1 ), value ) );
    }
  }

}
