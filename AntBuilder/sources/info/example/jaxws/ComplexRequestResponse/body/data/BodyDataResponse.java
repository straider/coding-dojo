package info.example.jaxws.ComplexRequestResponse.body.data;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.XmlElement;

@XmlRootElement
@XmlAccessorType( XmlAccessType.NONE )
@XmlType( propOrder = { "value" } )
public class BodyDataResponse {

  @XmlElement
  private Integer value;

  public BodyDataResponse() {
    throw new UnsupportedOperationException( "JAXB requires a no-arg default constructor." );
  }

  public BodyDataResponse( final Integer value ) {
    this.value = value;
  }

}