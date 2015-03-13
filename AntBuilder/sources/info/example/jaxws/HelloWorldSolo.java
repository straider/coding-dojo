package info.example.jaxws;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;

@WebService
public class HelloWorldSolo {

  @WebMethod
  public String salute() {
    return "Hello, World!";
  }

  @WebMethod
  @WebResult( name = "result", header = false )
  public String greet(
                       @WebParam( name = "input", mode = WebParam.Mode.IN, header = false ) final String name 
                     )
  {
    return "Hello, " + name;
  }

}
