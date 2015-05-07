// Compile command: javac Decorator.java

import java.util.Arrays;
import java.util.List;
import java.util.LinkedList;

public abstract class Decorator implements Decoder {

  protected final Integer prime  ;
  protected final String  word   ;
  protected final Decoder decoder;

  protected static final List< String > words = new LinkedList< String >();

  protected Decorator( final Integer prime, final String word, final Decoder decoder ) {
    this.prime   = prime  ;
    this.word    = word   ;
    this.decoder = decoder;
  }

  @Override
  public String say( final Integer value ) {
    String result = "";

    decode( value );
    for ( final String item : words ) {
      result += item;
    }
    words.clear();

    return result;
  }

  protected void decode( final Integer value ) {
    if ( ( value % prime == 0 )  ) {
      words.add( word );
    }

    if ( decoder instanceof Decorator ) {
      ( ( Decorator ) decoder ).decode( value );
    }

    if ( decoder instanceof Decoder ) {
      if ( words.size() == 0 ) {
        words.add( decoder.say( value ) );
      }
    }
  }

}