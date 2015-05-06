// Compile command: javac NumberWord.java

public class NumberWord implements Decoder {

  public String say( final Integer value ) {
    return String.format( "%04d", value );
  }

}