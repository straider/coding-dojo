package dojo.java.api.jaxrs;

import java.util.TreeSet;
import java.util.zip.CRC32;
import java.util.zip.Checksum;
import java.security.Security;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.ws.rs.Path;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PathParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

@Path( "checksum/" )
public class ChecksumService {

  @GET
  @Path( "/" )
  @Produces( { MediaType.TEXT_PLAIN, MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON } )
  public Response listAlgorithms() {
    final TreeSet< String > algorithms = new TreeSet< String >( Security.getAlgorithms( "MessageDigest" ) );

    final Response response = Response.status( 200 ).entity( "Available Algorithms are: " + algorithms ).build();
    return response;
  }

  @POST
  @Path( "crc32/" )
  @Consumes( MediaType.TEXT_PLAIN )
  @Produces( { MediaType.TEXT_PLAIN, MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON } )
  public Response calculateCRC32( final String string ) {
    final Checksum checksum = new CRC32();
    final byte[]   bytes    = string.getBytes();
    checksum.update( bytes, 0, bytes.length );

    final String result = "CRC32 checksum = " + Long.toString( checksum.getValue() );

    final Response response = Response.status( 200 ).entity( result ).build();
    return response;
  }

  @POST
  @Path( "{algorithm}/" )
  @Consumes( MediaType.TEXT_PLAIN )
  @Produces( { MediaType.TEXT_PLAIN, MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON } )
  public Response calculateHash( @PathParam  ( "algorithm" ) final String algorithm
                               ,                             final String string
  ) throws NoSuchAlgorithmException {
    final MessageDigest md    = MessageDigest.getInstance( algorithm );
    final byte[]        bytes = string.getBytes();
    final StringBuffer  hex   = new StringBuffer();
		for ( final byte b : md.digest( bytes ) ) {
			hex.append( String.format( "%02x", b & 0xff ) );
		}
    final String result = md.getAlgorithm() + " checksum = " + hex;

    final Response response = Response.status( 200 ).entity( result ).build();
    return response;
  }

}
