package dojo.java.api.jaxws;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

@WebService(
    name            = "Greeter"
  , targetNamespace = "http://jaxws.api.java.dojo"
  , serviceName     = "GreeterEndpointService"
  , portName        = "GreeterEndpointPort"
)
@SOAPBinding(
    style          = Style.DOCUMENT
  , use            = SOAPBinding.Use.LITERAL
  , parameterStyle = SOAPBinding.ParameterStyle.WRAPPED
)
public interface GreeterInterface {

  @WebMethod( operationName = "hello" )
  @WebResult( name = "response", header = false )
  public String hello();

  @WebMethod( operationName = "greet" )
  @WebResult( name = "response", header = false )
  public String greet( @WebParam( name = "name", mode = WebParam.Mode.IN, header = false ) final String name );

}
