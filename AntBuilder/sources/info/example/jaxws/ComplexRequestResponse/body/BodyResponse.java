package info.example.jaxws.ComplexRequestResponse.body;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.XmlElement;

import info.example.jaxws.ComplexRequestResponse.body.control.BodyControlResponse;
import info.example.jaxws.ComplexRequestResponse.body.data.BodyDataResponse;

@XmlRootElement
@XmlAccessorType( XmlAccessType.NONE )
@XmlType( propOrder = { "control", "data" } )
public class BodyResponse {

  @XmlElement( required = true )
  private BodyControlResponse control;
  @XmlElement( required = true )
  private BodyDataResponse    data;

  public BodyResponse() {
    throw new UnsupportedOperationException( "JAXB requires a no-arg default constructor." );
  }

  public BodyResponse( final Integer value ) {
    control = new BodyControlResponse();
    data    = new BodyDataResponse( value );
  }

}