package dojo.java.api.jaxws;

import java.util.TreeSet;
import java.util.zip.CRC32;
import java.util.zip.Checksum;
import java.security.Security;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.io.ByteArrayOutputStream;

import javax.jws.WebService;
import javax.xml.bind.Marshaller;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.PropertyException;
import javax.xml.ws.WebServiceException;

@WebService( endpointInterface = "dojo.java.api.jaxws.ChecksumerInterface" )
public class Checksumer implements ChecksumerInterface {

  @Override
  public String listAlgorithms() {
    final TreeSet< String > algorithms = new TreeSet< String >( Security.getAlgorithms( "MessageDigest" ) );
    return algorithms.toString();
  }

  @Override
  public String calculateCRC32( final String text ) {
    final Checksum checksum = new CRC32();
    final byte[]   bytes    = text.getBytes();
    checksum.update( bytes, 0, bytes.length );

    final String result = "CRC32 checksum = " + Long.toString( checksum.getValue() );
    return result;
  }

  @Override
  public String calculateHash( final String algorithm, final String text ) throws NoSuchAlgorithmException {
    final String result = algorithm + " checksum = " + digestText( algorithm, text );
    return result;
  }

  @Override
  public MultipleAlgorithmsResponse calculateHashes( final String text ) throws NoSuchAlgorithmException {
    final MultipleAlgorithmsResponse response = new MultipleAlgorithmsResponse();

    final String[] algorithms = listAlgorithms().replace( "[", "" ).replace( "]", "" ).split( ", " );
    for ( final String algorithm : algorithms ) {
      response.add( algorithm + " checksum = " + digestText( algorithm, text ) );
    }

    return response;
  }

  @Override
  public MultipleValuesResponse processMultiple( final MultipleValuesRequest request ) throws NoSuchAlgorithmException {
    final String algorithm = request.getAlgorithm();

    final MultipleValuesResponse response = new MultipleValuesResponse( algorithm );
    for ( final String text : request.getValues() ) {
      response.add( text, digestText( algorithm, text ) );
    }

    return response;
    // return new MultipleValuesResponse( marshall( request, MultipleValuesRequest.class ) );
    // return new MultipleValuesResponse( marshall( response, MultipleValuesRequest.class ) );
  }

  private String digestText( final String algorithm, final String text ) throws NoSuchAlgorithmException {
    final MessageDigest md    = MessageDigest.getInstance( algorithm );
    final byte[]        bytes = text.getBytes();
    final StringBuffer  hex   = new StringBuffer();
		for ( final byte b : md.digest( bytes ) ) {
			hex.append( String.format( "%02x", b & 0xff ) );
		}

    return hex.toString();
  }

  private String marshall( final Object object, final Class ... classes ) {
    try {
      final JAXBContext jaxbContext    = JAXBContext.newInstance( classes );
      final Marshaller  jaxbMarshaller = jaxbContext.createMarshaller();
      try {
        jaxbMarshaller.setProperty( Marshaller.JAXB_FORMATTED_OUTPUT, true );
      } catch ( final PropertyException exception ) {
        throw new WebServiceException( exception );
      }

      final ByteArrayOutputStream output = new ByteArrayOutputStream();

      try {
        jaxbMarshaller.marshal( object, output );
      } catch ( final JAXBException exception ) {
        throw new WebServiceException( exception );
      }

      return output.toString();

    } catch ( final JAXBException exception ) {
      throw new WebServiceException( exception );
    }
  }

}
