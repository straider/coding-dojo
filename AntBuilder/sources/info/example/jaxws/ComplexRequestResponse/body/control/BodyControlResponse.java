package info.example.jaxws.ComplexRequestResponse.body.control;

import java.util.Date;
import java.util.Calendar;
import java.sql.Timestamp;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.XmlElement;

@XmlRootElement
@XmlAccessorType( XmlAccessType.NONE )
@XmlType( propOrder = { "now" } )
public class BodyControlResponse {

  @XmlElement( name = "timestamp" )
  private final Date now;

  public BodyControlResponse() {
    // XPTS419 - 2014.03.26: JAXB requires a no-arg default constructor.
    now = new Date();
  }

  public String getTimestamp() {
    return new Timestamp( now.getTime() ).toString();
  }

}