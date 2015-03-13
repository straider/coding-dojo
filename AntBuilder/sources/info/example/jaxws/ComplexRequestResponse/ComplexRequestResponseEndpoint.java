package info.example.jaxws.ComplexRequestResponse;

import javax.jws.WebService;

import info.example.jaxws.ComplexRequestResponse.body.BodyRequest;
import info.example.jaxws.ComplexRequestResponse.body.BodyResponse;

@WebService( endpointInterface = "info.example.jaxws.ComplexRequestResponse.ComplexRequestResponseInterface" )
public class ComplexRequestResponseEndpoint implements ComplexRequestResponseInterface {

  @Override
  public BodyResponse calculate( final BodyRequest request ) {
    final String  operation = request.getControl().getOperation();
    final Integer operand1  = request.getData().getArgumentA();
    final Integer operand2  = request.getData().getArgumentB();

    final Integer result;
    if ( operation.equals( "+" ) ) {
      result = operand1 + operand2;
    } else if ( operation.equals( "-" )) {
      result = operand2 - operand1;
    } else {
      result = null;
    }

    final BodyResponse response = new BodyResponse( result );

    return response;
  }

}
