import java.math.BigInteger;

public class Factorial100 {

  private static BigInteger factorial( int value ) {
    BigInteger result = BigInteger.valueOf( 1 );

    for ( int iteration = 1; iteration <= value ; iteration++ ) {
      result = result.multiply( BigInteger.valueOf( iteration ) );
    }

    return result;
  }

  public static void main( String[] arguments ) {
    for ( int i = 0; i <= 50000; i++ ) {
      for ( int value = 0; value <= 100; value++ ) {
        BigInteger result = Factorial100.factorial( value );
        System.out.println( result );
      }
    }
  }

}
