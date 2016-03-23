package builder.dojo;

public class Main {

  public static void main( final String[] arguments ) {
    final Greeter greeter = ( arguments.length == 0 ) ? new Greeter() : new Greeter( arguments[ 0 ] );
    System.out.println( greeter.greet() );

    System.out.println( "» José Carlos Monteiro «" );
  }

}