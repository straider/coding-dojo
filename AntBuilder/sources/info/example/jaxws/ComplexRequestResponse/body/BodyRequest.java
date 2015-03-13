package info.example.jaxws.ComplexRequestResponse.body;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.XmlElement;

import info.example.jaxws.ComplexRequestResponse.body.control.BodyControlRequest;
import info.example.jaxws.ComplexRequestResponse.body.data.BodyDataRequest;

@XmlRootElement
@XmlAccessorType( XmlAccessType.NONE )
@XmlType( propOrder = { "control", "data" } )
public class BodyRequest {

  @XmlElement( required = true )
  private BodyControlRequest control;
  @XmlElement( required = true )
  private BodyDataRequest    data;

  public BodyRequest() {
    // XPTS419 - 2014.03.26: JAXB requires a no-arg default constructor.
  }

  public BodyControlRequest getControl() {
    return control;
  }

  public BodyDataRequest getData() {
    return data;
  }

  public void setControl( final BodyControlRequest control ) {
    this.control = control;
  }

  public void setData( final BodyDataRequest data ) {
    this.data = data;
  }

}