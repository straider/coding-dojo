public class Procedural {

  public static void main( final String[] arguments ) {
    if ( arguments.length == 0 ) {
      System.out.println( "Hello, World!" );
    } else {
      final String name = arguments[ 0 ];
      System.out.println( "Hello, " + name + "!" );
    }

    System.out.println( "» José Carlos Monteiro «" );
  }

}