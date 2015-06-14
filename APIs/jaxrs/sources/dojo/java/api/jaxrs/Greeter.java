package dojo.java.api.jaxrs;

import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path( "/" )
public class Greeter {

  @GET
  @Path( "hello/" )
  @Produces( { MediaType.TEXT_PLAIN, MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON } )
  public Response greet() {
    final String message = "Hello, World!";

    final Response response = Response.status( 200 ).entity( message ).build();
    return response;
  }

  @GET
  @Path( "greet/" )
  @Produces( { MediaType.TEXT_PLAIN, MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON } )
  public Response greet( @DefaultValue( "World" ) @QueryParam( "name" ) final String name ) {
    final String message = String.format( "Hello, %s!", name );

    final Response response = Response.status( 200 ).entity( message ).build();
    return response;
  }

}
