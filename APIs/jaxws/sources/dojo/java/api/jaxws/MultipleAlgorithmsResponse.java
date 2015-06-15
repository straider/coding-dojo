package dojo.java.api.jaxws;

import java.util.List;
import java.util.LinkedList;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement( name = "response", namespace = MultipleAlgorithmsResponse.NAMESPACE )
@XmlAccessorType( XmlAccessType.NONE )
@XmlType( propOrder = { "list" } )
public class MultipleAlgorithmsResponse {

  public static final String NAMESPACE = "dojo.java.api.jaxws";

  @XmlElements( { @XmlElement( required = true, nillable = false, name = "hash", type = String.class ) } ) 
  @XmlElementWrapper( name = "list" ) private List< String > list;

  public MultipleAlgorithmsResponse() {
    list = new LinkedList< String >();
  }

  public void add( final String value ) {
    list.add( value );
  }

  @Override
  public String toString() {
    return list.toString();
  }

}