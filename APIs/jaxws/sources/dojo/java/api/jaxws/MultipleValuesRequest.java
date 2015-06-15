package dojo.java.api.jaxws;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlType;

// @XmlRootElement( name = "request", namespace = MultipleValuesRequest.NAMESPACE )
@XmlRootElement( namespace = MultipleValuesRequest.NAMESPACE )
@XmlAccessorType( XmlAccessType.NONE )
@XmlType( propOrder = { "algorithm", "list" } )
public class MultipleValuesRequest {

  public static final String NAMESPACE = "dojo.java.api.jaxws";

  @XmlElement( required = true, nillable = false, name = "algorithm" ) private String algorithm;
  @XmlElementWrapper( name = "list" )
  @XmlElement( required = true, nillable = false, name = "text"      ) private List< String > list;

  public MultipleValuesRequest() {
    // XPTS419 - 2015.06.15: JAXB requires a no-arg default constructor.
  }

  public String getAlgorithm() {
    return algorithm;
  }

  public List< String > getValues() {
    return list;
  }

  @Override
  public String toString() {
    String items = "";
    for ( final String item : list ) {
      items += items.length() == 0 ? item : ", " + item;
    }

    return "algorithm: " + algorithm + ", items: " + items;
  }

}