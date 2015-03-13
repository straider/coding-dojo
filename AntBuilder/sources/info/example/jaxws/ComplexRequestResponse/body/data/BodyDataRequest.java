package info.example.jaxws.ComplexRequestResponse.body.data;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.XmlElement;

@XmlRootElement
@XmlAccessorType( XmlAccessType.NONE )
@XmlType( propOrder = { "argumentA", "argumentB" } )
public class BodyDataRequest {

  @XmlElement
  private Integer argumentA;
  @XmlElement
  private Integer argumentB;

  public BodyDataRequest() {
    // XPTS419 - 2014.03.26: JAXB requires a no-arg default constructor.
  }

  public Integer getArgumentA() {
    return argumentA;
  }

  public Integer getArgumentB() {
    return argumentB;
  }

  public void setArgumentA( final Integer argument ) {
    this.argumentA = argument;
  }

  public void setArgumentB( final Integer argument ) {
    this.argumentB = argument;
  }

}