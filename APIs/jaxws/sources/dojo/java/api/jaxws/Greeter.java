package dojo.java.api.jaxws;

import javax.jws.WebService;

@WebService( endpointInterface = "dojo.java.api.jaxws.GreeterInterface" )
public class Greeter implements GreeterInterface {

  @Override
  public String hello() {
    final String message = "Hello, World!";
    return message;
  }

  @Override
  public String greet( final String name ) {
    final String message = String.format( "Hello, %s!", name );
    return message;
  }

}
