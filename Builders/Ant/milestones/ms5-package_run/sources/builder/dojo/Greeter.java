package builder.dojo;

import org.apache.log4j.Logger;

public class Greeter {

  private final String name;

  private static final Logger logger = Logger.getLogger( Greeter.class );

  public Greeter() {
    logger.debug( "Creating an instance of " + this.class + " without any arguments" );
    name = "World";
  }

  public Greeter( final String name ) {
    logger.debug( "Creating an instance of " + this.class + " with argument: " + name );
    this.name = name;
  }

  public String greet() {
    final String message = String.format( "Hello, %s!", name );
    logger.debug( "Result: " + message );
    return message;
  }

}