package dojo.java.api.jaxws;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement( name = "item", namespace = MultipleValues.NAMESPACE )
@XmlAccessorType( XmlAccessType.NONE )
@XmlType( propOrder = { "text", "hash" } )
public class MultipleValues {

  public static final String NAMESPACE = "dojo.java.api.jaxws";

  @XmlElement( required = true, nillable = false, name = "text" ) private String text;
  @XmlElement( required = true, nillable = false, name = "hash" ) private String hash;

  public MultipleValues() {
    // XPTS419 - 2015.06.15: JAXB requires a no-arg default constructor.
  }

  public MultipleValues( final String text, final String hash ) {
    this.text = text;
    this.hash = hash;
  }

  @Override
  public String toString() {
    return "( text = " + text + ", hash = " + hash + " )";
  }

}