public class Factorial100 {

  private static long factorial( int value ) {
    long result = 1L;

    for ( int iteration = 1; iteration <= value ; iteration++ ) {
      result = result * iteration;
    }

    return result;
  }

  public static void main( String[] arguments ) {
    for ( int i = 0; i <= 50000; i++ ) {
      for ( int value = 0; value <= 100; value++ ) {
        long result = Factorial100.factorial( value );
        System.out.println( result );
      }
    }
  }

}
