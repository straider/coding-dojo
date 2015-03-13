package info.example.jaxws.ComplexRequestResponse.body.control;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.XmlElement;

@XmlRootElement
@XmlAccessorType( XmlAccessType.NONE )
@XmlType( propOrder = { "operation" } )
public class BodyControlRequest {

  @XmlElement
  private String operation;

  public BodyControlRequest() {
    // XPTS419 - 2014.03.26: JAXB requires a no-arg default constructor.
  }

  public String getOperation() {
    return operation;
  }

  public void setOperation( final String operation ) {
    this.operation = operation;
  }

}