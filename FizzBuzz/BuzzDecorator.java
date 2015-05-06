// Compile command: javac BuzzDecorator.java

public class BuzzDecorator extends Decorator {

  public BuzzDecorator( final Decoder decoder ) {
    super( 5, "Buzz", decoder );
  }

}