package builder.dojo;

import org.apache.log4j.Logger;

public class Main {

  private static final String messageUTF8 = "» José Carlos Monteiro «";
  private static final Logger logger      = Logger.getLogger( Main.class );

  public static void main( final String[] arguments ) {
    final Greeter greeter = ( arguments.length == 0 ) ? new Greeter() : new Greeter( arguments[ 0 ] );
    final String  message = greeter.greet();
    logger.info( "Message: " + message );
    System.out.println( message );

    logger.info( "UTF-8: " + messageUTF8 );
    System.out.println( messageUTF8 );
  }

}