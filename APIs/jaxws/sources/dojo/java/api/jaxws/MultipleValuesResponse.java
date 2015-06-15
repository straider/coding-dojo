package dojo.java.api.jaxws;

import java.util.List;
import java.util.LinkedList;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement( name = "response", namespace = MultipleValuesResponse.NAMESPACE )
@XmlAccessorType( XmlAccessType.NONE )
@XmlType( propOrder = { "algorithm", "list" } )
public class MultipleValuesResponse {

  public static final String NAMESPACE = "dojo.java.api.jaxws";

  @XmlElement( required = true, nillable = false, name = "algorithm" ) private String                 algorithm;
  @XmlElementWrapper( name = "list" )
  @XmlElement( required = true, nillable = false, name = "item"      ) private List< MultipleValues > list;

  public MultipleValuesResponse() {
    // XPTS419 - 2015.06.15: JAXB requires a no-arg default constructor.
  }

  public MultipleValuesResponse( final String algorithm ) {
    this.algorithm = algorithm;

    list = new LinkedList< MultipleValues >();
  }

  public void add( final String text, final String hash ) {
    final MultipleValues multipleValues = new MultipleValues( text, hash );
    list.add( multipleValues );
  }

  @Override
  public String toString() {
    String items = "";
    for ( final MultipleValues item : list ) {
      items += items.length() == 0 ? item.toString() : ", " + item.toString();
    }

    return "algorithm: " + algorithm + ", items: " + items;
  }

}