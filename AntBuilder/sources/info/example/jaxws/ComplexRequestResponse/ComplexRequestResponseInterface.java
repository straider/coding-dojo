package info.example.jaxws.ComplexRequestResponse;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

import info.example.jaxws.ComplexRequestResponse.body.BodyRequest;
import info.example.jaxws.ComplexRequestResponse.body.BodyResponse;

@WebService
@SOAPBinding( 
    style          = Style.DOCUMENT
  , use            = SOAPBinding.Use.LITERAL
  , parameterStyle = SOAPBinding.ParameterStyle.WRAPPED 
)
public interface ComplexRequestResponseInterface {

  @WebMethod
  @WebResult( name = "response", header = false )
  public BodyResponse calculate(
                                 @WebParam( name = "request", mode = WebParam.Mode.IN, header = false ) final BodyRequest request
                               );

}
