package dojo.java.api.jaxws;

import java.security.NoSuchAlgorithmException;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

@WebService(
    name            = "Checksumer"
  , targetNamespace = "http://dojo.java.api.jaxws"
  , serviceName     = "ChecksumEndpointService"
  , portName        = "ChecksumEndpointPort"
)
@SOAPBinding(
    style          = Style.DOCUMENT
  , use            = SOAPBinding.Use.LITERAL
  , parameterStyle = SOAPBinding.ParameterStyle.WRAPPED
)
public interface ChecksumerInterface {

  @WebMethod( operationName = "list" )
  @WebResult( name = "response", header = false )
  public String listAlgorithms();

  @WebMethod( operationName = "crc32" )
  @WebResult( name = "response", header = false )
  public String calculateCRC32( @WebParam( name = "text", mode = WebParam.Mode.IN, header = false ) final String text );

  @WebMethod( operationName = "hash" )
  @WebResult( name = "response", header = false )
  public String calculateHash( @WebParam( name = "algorithm", mode = WebParam.Mode.IN, header = false ) final String algorithm
                             , @WebParam( name = "text"     , mode = WebParam.Mode.IN, header = false ) final String text
                             ) throws NoSuchAlgorithmException;

  @WebMethod( operationName = "hashes" )
  @WebResult( name = "response", header = false )
  public MultipleAlgorithmsResponse calculateHashes( @WebParam( name = "text", mode = WebParam.Mode.IN, header = false )
                                                     final String text
                                                   ) throws NoSuchAlgorithmException;

  @WebMethod( operationName = "values" )
  @WebResult( name = "response", header = false )
  public MultipleValuesResponse processMultiple( @WebParam( name = "request", mode = WebParam.Mode.IN, header = false )
                                                 final MultipleValuesRequest request
                                               ) throws NoSuchAlgorithmException;

}
